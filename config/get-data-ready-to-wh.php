
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

/**
 * Execute prepared statement dengan parameter dinamis.
 */
function executeReadyStmt(
    mysqli $conn,
    string $sql,
    string $types = '',
    array $params = []
): mysqli_stmt {
    $stmt = mysqli_prepare($conn, $sql);

    if (!$stmt) {
        throw new RuntimeException(
            'Prepare statement gagal: ' . mysqli_error($conn)
        );
    }

    if ($params) {
        $bindParams = [$types];

        foreach ($params as $key => $value) {
            $bindParams[] = &$params[$key];
        }

        call_user_func_array(
            'mysqli_stmt_bind_param',
            array_merge([$stmt], $bindParams)
        );
    }

    mysqli_stmt_execute($stmt);

    return $stmt;
}

try {
    // =====================================================
    // 1. VALIDASI SESSION
    // =====================================================

    if (empty($_SESSION['nik_user'])) {
        respond([
            'status' => 'error',
            'message' => 'Sesi login tidak ditemukan.'
        ], 401);
    }

    if (!isset($conn) || !($conn instanceof mysqli)) {
        throw new RuntimeException(
            'Koneksi database tidak tersedia.'
        );
    }

    $nik = trim((string) $_SESSION['nik_user']);

    // =====================================================
    // 2. VALIDASI USER DAN NCVS
    // =====================================================

    $userStmt = executeReadyStmt(
        $conn,
        "SELECT ncvs
         FROM tbl_user
         WHERE nik_user = ?
           AND is_deleted = 0
         LIMIT 1",
        's',
        [$nik]
    );

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

    // =====================================================
    // 3. ACTION LIST
    // =====================================================

    if ($action === 'list') {

        $keyword = trim((string) ($_POST['search'] ?? ''));

        $start = max(
            0,
            (int) ($_POST['start'] ?? 0)
        );

        $length = (int) ($_POST['length'] ?? 20);

        if (!in_array($length, [10, 20, 50, 100], true)) {
            $length = 20;
        }

        // ---------------------------------------------
        // Base condition Ready to Ship
        // ---------------------------------------------

        $baseSql = "
            FROM tbl_transactions
            WHERE last_gate = 'IN_SM_SUBCONT'
              AND print_status = 'PRINTED'
              AND (
                    global_barcode IS NULL
                    OR global_barcode = ''
              )
        ";

        $baseParams = [];
        $baseTypes = '';

        // Filter NCVS berdasarkan user login.
        if ($userNcvs !== '') {
            $baseSql .= " AND ncvs = ? ";
            $baseParams[] = $userNcvs;
            $baseTypes .= 's';
        }

        // ---------------------------------------------
        // TOTAL RECORDS
        // ---------------------------------------------

        $countSql = "
            SELECT COUNT(*) AS total
            FROM (
                SELECT bucket, model, style, ncvs
                $baseSql
                GROUP BY bucket, model, style, ncvs
            ) AS ready_groups
        ";

        $countStmt = executeReadyStmt(
            $conn,
            $countSql,
            $baseTypes,
            $baseParams
        );

        $countResult = mysqli_stmt_get_result($countStmt);
        $total = (int) mysqli_fetch_assoc($countResult)['total'];

        mysqli_stmt_close($countStmt);

        // ---------------------------------------------
        // SEARCH FILTER
        // ---------------------------------------------

        $searchSql = '';
        $searchParams = [];
        $searchTypes = '';

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

            $searchParams = [
                $like,
                $like,
                $like,
                $like
            ];

            $searchTypes = 'ssss';
        }

        $filteredParams = array_merge(
            $baseParams,
            $searchParams
        );

        $filteredTypes = $baseTypes . $searchTypes;

        // ---------------------------------------------
        // FILTERED RECORDS
        // ---------------------------------------------

        $filteredSql = "
            SELECT COUNT(*) AS total
            FROM (
                SELECT bucket, model, style, ncvs
                $baseSql
                $searchSql
                GROUP BY bucket, model, style, ncvs
            ) AS ready_groups
        ";

        $filteredStmt = executeReadyStmt(
            $conn,
            $filteredSql,
            $filteredTypes,
            $filteredParams
        );

        $filteredResult = mysqli_stmt_get_result($filteredStmt);

        $filtered = (int) mysqli_fetch_assoc(
            $filteredResult
        )['total'];

        mysqli_stmt_close($filteredStmt);

        // ---------------------------------------------
        // DATA LISTING
        // ---------------------------------------------

        $dataSql = "
            SELECT
                bucket,
                model,
                style,
                ncvs,
                COUNT(DISTINCT barcode) AS total_barcode
            $baseSql
            $searchSql
            GROUP BY
                bucket,
                model,
                style,
                ncvs
            ORDER BY
                bucket,
                model,
                style,
                ncvs
            LIMIT ? OFFSET ?
        ";

        $dataParams = array_merge(
            $filteredParams,
            [$length, $start]
        );

        $dataTypes = $filteredTypes . 'ii';

        $dataStmt = executeReadyStmt(
            $conn,
            $dataSql,
            $dataTypes,
            $dataParams
        );

        $result = mysqli_stmt_get_result($dataStmt);

        $rows = [];

        while ($row = mysqli_fetch_assoc($result)) {
            $row['total_barcode'] = (int) $row['total_barcode'];
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


    // =====================================================
    // 4. ACTION DETAIL
    // =====================================================

    if ($action === 'detail') {

        $bucket = trim((string) ($_POST['bucket'] ?? ''));
        $model  = trim((string) ($_POST['model'] ?? ''));
        $style  = trim((string) ($_POST['style'] ?? ''));
        $ncvs   = trim((string) ($_POST['ncvs'] ?? ''));

        // Validasi parameter kelompok.
        if (
            $bucket === '' ||
            $model === '' ||
            $style === '' ||
            $ncvs === ''
        ) {
            respond([
                'status' => 'error',
                'message' => 'Parameter kelompok tidak lengkap.'
            ], 400);
        }

        // Validasi akses NCVS.
        if ($userNcvs !== '' && $ncvs !== $userNcvs) {
            respond([
                'status' => 'error',
                'message' => 'Anda tidak memiliki akses ke NCVS ini.'
            ], 403);
        }

        // ---------------------------------------------
        // QUERY DETAIL BARCODE
        // ---------------------------------------------

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

        WHERE last_gate = 'IN_SM_SUBCONT'
          AND print_status = 'PRINTED'

          AND (
                global_barcode IS NULL
                OR global_barcode = ''
          )

          AND bucket = ?
          AND model = ?
          AND style = ?
          AND ncvs = ?

          AND barcode IS NOT NULL
          AND barcode <> ''

        GROUP BY
            barcode,
            bucket,
            model,
            style,
            ncvs

        ORDER BY
    bucket ASC,
    model ASC,
    style ASC,
    ncvs ASC,
    komponen ASC,
    CAST(lot AS UNSIGNED) ASC,
    size ASC
    ";

        $stmt = mysqli_prepare($conn, $sql);

        if (!$stmt) {
            throw new RuntimeException(
                'Gagal menyiapkan query detail: ' . mysqli_error($conn)
            );
        }

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

        // ---------------------------------------------
        // FORMAT DATA DETAIL
        // ---------------------------------------------

        while ($row = mysqli_fetch_assoc($result)) {

            $lotValues = trim((string) ($row['lot_values'] ?? ''));

            $lots = $lotValues === ''
                ? []
                : array_values(array_unique(array_map(
                    'intval',
                    explode(',', $lotValues)
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

    error_log(
        'Ready to Ship API: ' . $e->getMessage()
    );

    respond([
        'status' => 'error',
        'message' => 'Terjadi kesalahan saat mengambil data.'
    ], 500);
}
