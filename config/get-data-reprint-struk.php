
<?php
require 'function.php';
/** @var mysqli $conn */

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json; charset=utf-8');

function respond(array $data, int $httpCode = 200): void
{
    http_response_code($httpCode);
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    if (empty($_SESSION['nik_user'])) {
        respond([
            'status' => 'error',
            'message' => 'Sesi login tidak ditemukan.'
        ], 401);
    }

    if (!isset($conn) || !($conn instanceof mysqli)) {
        throw new RuntimeException('Koneksi database tidak tersedia.');
    }

    $nik = trim((string) $_SESSION['nik_user']);

    // Cari user aktif dan NCVS miliknya.
    $userStmt = mysqli_prepare(
        $conn,
        "SELECT ncvs
         FROM tbl_user
         WHERE nik_user = ?
           AND is_deleted = 0
         LIMIT 1"
    );

    mysqli_stmt_bind_param($userStmt, 's', $nik);
    mysqli_stmt_execute($userStmt);
    $userResult = mysqli_stmt_get_result($userStmt);
    $user = mysqli_fetch_assoc($userResult);
    mysqli_stmt_close($userStmt);

    if (!$user) {
        respond([
            'status' => 'error',
            'message' => 'User tidak valid atau sudah tidak aktif.'
        ], 403);
    }

    $userNcvs = trim((string) ($user['ncvs'] ?? ''));
    $action = trim((string) ($_POST['action'] ?? ''));

    // Filter NCVS diterapkan di backend.
    $ncvsSql = '';
    $baseParams = [];

    if ($userNcvs !== '') {
        $ncvsSql = ' AND ncvs = ? ';
        $baseParams[] = $userNcvs;
    }

    if ($action === 'list') {
        $keyword = trim((string) ($_POST['search'] ?? ''));
        $start = max(0, (int) ($_POST['start'] ?? 0));
        $length = (int) ($_POST['length'] ?? 20);

        if (!in_array($length, [10, 20, 50, 100], true)) {
            $length = 20;
        }

        $searchSql = '';
        $params = $baseParams;

        if ($keyword !== '') {
            $searchSql = "
                AND (
                    bucket LIKE ?
                    OR model LIKE ?
                    OR style LIKE ?
                    OR ncvs LIKE ?
                )
            ";

            $like = '%' . $keyword . '%';
            array_push($params, $like, $like, $like, $like);
        }

        $countSql = "
            SELECT COUNT(*) AS total
            FROM (
                SELECT bucket, model, style, ncvs
                FROM tbl_transactions
                WHERE print_status = 'FAILED'
                $ncvsSql
                GROUP BY bucket, model, style, ncvs
            ) AS failed_groups
        ";

        $countStmt = mysqli_prepare($conn, $countSql);

        if ($baseParams) {
            mysqli_stmt_bind_param(
                $countStmt,
                str_repeat('s', count($baseParams)),
                ...$baseParams
            );
        }

        mysqli_stmt_execute($countStmt);
        $total = (int) mysqli_fetch_assoc(
            mysqli_stmt_get_result($countStmt)
        )['total'];
        mysqli_stmt_close($countStmt);

        $filteredSql = "
            SELECT COUNT(*) AS total
            FROM (
                SELECT bucket, model, style, ncvs
                FROM tbl_transactions
                WHERE print_status = 'FAILED'
                $ncvsSql
                $searchSql
                GROUP BY bucket, model, style, ncvs
            ) AS failed_groups
        ";

        $filteredStmt = mysqli_prepare($conn, $filteredSql);

        if ($params) {
            mysqli_stmt_bind_param(
                $filteredStmt,
                str_repeat('s', count($params)),
                ...$params
            );
        }

        mysqli_stmt_execute($filteredStmt);
        $filtered = (int) mysqli_fetch_assoc(
            mysqli_stmt_get_result($filteredStmt)
        )['total'];
        mysqli_stmt_close($filteredStmt);

        $dataSql = "
            SELECT
                bucket,
                model,
                style,
                ncvs,
                COUNT(DISTINCT barcode) AS total_failed
            FROM tbl_transactions
            WHERE print_status = 'FAILED'
            $ncvsSql
            $searchSql
            GROUP BY bucket, model, style, ncvs
            ORDER BY bucket, model, style, ncvs
            LIMIT ? OFFSET ?
        ";

        $dataStmt = mysqli_prepare($conn, $dataSql);

        $dataParams = $params;
        $dataParams[] = $length;
        $dataParams[] = $start;

        mysqli_stmt_bind_param(
            $dataStmt,
            str_repeat('s', count($params)) . 'ii',
            ...$dataParams
        );

        mysqli_stmt_execute($dataStmt);
        $result = mysqli_stmt_get_result($dataStmt);
        $rows = [];

        while ($row = mysqli_fetch_assoc($result)) {
            $rows[] = $row;
        }

        mysqli_stmt_close($dataStmt);

        respond([
            'status' => 'success',
            'recordsTotal' => $total,
            'recordsFiltered' => $filtered,
            'data' => $rows
        ]);
    }


    if ($action === 'detail') {
        $bucket = trim((string) ($_POST['bucket'] ?? ''));
        $model  = trim((string) ($_POST['model'] ?? ''));
        $style  = trim((string) ($_POST['style'] ?? ''));
        $ncvs   = trim((string) ($_POST['ncvs'] ?? ''));

        if (
            $bucket === '' || $model === '' ||
            $style === '' || $ncvs === ''
        ) {
            respond([
                'status' => 'error',
                'message' => 'Parameter kelompok tidak lengkap.'
            ], 400);
        }

        if ($userNcvs !== '' && $ncvs !== $userNcvs) {
            respond([
                'status' => 'error',
                'message' => 'Anda tidak memiliki akses ke NCVS ini.'
            ], 403);
        }

        $sql = "
        SELECT
            MIN(id_trans) AS id_trans,
            barcode,
            bucket,
            model,
            style,
            ncvs,
            GROUP_CONCAT(
                DISTINCT nm_komponen_in
                ORDER BY nm_komponen_in
                SEPARATOR ', '
            ) AS komponen,
            GROUP_CONCAT(
                DISTINCT nm_vendor
                ORDER BY nm_vendor
                SEPARATOR ', '
            ) AS nm_vendor,
            GROUP_CONCAT(
                DISTINCT CAST(lot AS UNSIGNED)
                ORDER BY CAST(lot AS UNSIGNED)
                SEPARATOR ','
            ) AS lot_values,
            GROUP_CONCAT(
                DISTINCT size
                ORDER BY size
                SEPARATOR ', '
            ) AS size,
            SUM(qty_pre_setting) AS total_qty,
            MAX(print_status) AS print_status
        FROM tbl_transactions
        WHERE print_status = 'FAILED'
          AND bucket = ?
          AND model = ?
          AND style = ?
          AND ncvs = ?
          AND barcode IS NOT NULL
          AND barcode <> ''
        GROUP BY
            barcode, bucket, model, style, ncvs
        ORDER BY barcode
    ";

        $stmt = mysqli_prepare($conn, $sql);

        mysqli_stmt_bind_param(
            $stmt,
            'ssss',
            $bucket,
            $model,
            $style,
            $ncvs
        );

        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $rows = [];

        while ($row = mysqli_fetch_assoc($result)) {
            $lots = array_values(array_unique(array_map(
                'intval',
                explode(',', (string) $row['lot_values'])
            )));
            sort($lots, SORT_NUMERIC);

            $ranges = [];
            $count = count($lots);
            $i = 0;

            while ($i < $count) {
                $startLot = $lots[$i];
                $endLot = $startLot;

                while (
                    $i + 1 < $count &&
                    $lots[$i + 1] === $endLot + 1
                ) {
                    $i++;
                    $endLot = $lots[$i];
                }

                if ($startLot === $endLot) {
                    $ranges[] = (string) $startLot;
                } else {
                    $ranges[] = $startLot . '-' . $endLot;
                }

                $i++;
            }

            $row['lot_range'] = implode(', ', $ranges);
            $row['total_qty'] = (float) $row['total_qty'];
            unset($row['lot_values']);

            $rows[] = $row;
        }

        mysqli_stmt_close($stmt);

        respond([
            'status' => 'success',
            'data' => $rows
        ]);
    }

    respond([
        'status' => 'error',
        'message' => 'Action tidak dikenal.'
    ], 400);
} catch (Throwable $e) {
    error_log('Reprint Barcode API: ' . $e->getMessage());

    respond([
        'status' => 'error',
        'message' => 'Terjadi kesalahan saat mengambil data.'
    ], 500);
}
