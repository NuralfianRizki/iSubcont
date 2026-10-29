
<?php
require 'function.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json; charset=utf-8');

function respondQtyFulfillment(array $data, int $httpCode = 200): void
{
    http_response_code($httpCode);
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    if (empty($_SESSION['nik_user'])) {
        respondQtyFulfillment([
            'status' => 'error',
            'message' => 'Sesi login tidak ditemukan.'
        ], 401);
    }

    if (!isset($conn) || !($conn instanceof mysqli)) {
        throw new RuntimeException('Koneksi database tidak tersedia.');
    }

    // Validasi user dan ambil NCVS dari NIK login.
    $nik = trim((string) $_SESSION['nik_user']);

    $userStmt = mysqli_prepare(
        $conn,
        "SELECT ncvs
         FROM tbl_user
         WHERE nik_user = ?
           AND is_deleted = 0
         LIMIT 1"
    );

    if (!$userStmt) {
        throw new RuntimeException(
            'Gagal menyiapkan query validasi user: ' . mysqli_error($conn)
        );
    }

    mysqli_stmt_bind_param($userStmt, 's', $nik);
    mysqli_stmt_execute($userStmt);

    $userResult = mysqli_stmt_get_result($userStmt);
    $user = mysqli_fetch_assoc($userResult);

    mysqli_stmt_close($userStmt);

    if (!$user) {
        respondQtyFulfillment([
            'status' => 'error',
            'message' => 'User tidak valid atau sudah tidak aktif.'
        ], 403);
    }

    $userNcvs = trim((string) ($user['ncvs'] ?? ''));
    $action = trim((string) ($_POST['action'] ?? ''));

    if ($action === 'detail') {
        $bucket = trim((string) ($_POST['bucket'] ?? ''));
        $model  = trim((string) ($_POST['model'] ?? ''));
        $style  = trim((string) ($_POST['style'] ?? ''));
        $ncvs   = trim((string) ($_POST['ncvs'] ?? ''));

        if (
            $bucket === '' || $model === '' ||
            $style === '' || $ncvs === ''
        ) {
            respondQtyFulfillment([
                'status' => 'error',
                'message' => 'Parameter kelompok detail tidak lengkap.'
            ], 400);
        }



        $detailSql = "
    SELECT
        MAX(id_trans) AS id_trans,
        job_order,
        bucket,
        po_code,
        po_item,
        model,
        style,
        ncvs,
        lot,
        size,
        id_komponen_in,
        nm_komponen_in,
        id_komponen_out,
        nm_komponen_out,
        id_group,
        id_vendor,
        nm_vendor,
        MAX(qty_plan) AS qty_plan,
        SUM(COALESCE(qty_pre_setting, 0)) AS qty_pre_setting,
        GREATEST(
            MAX(qty_plan) - SUM(COALESCE(qty_pre_setting, 0)),
            0
        ) AS qty_remaining
    FROM tbl_transactions
    WHERE mode = 'CUSTOM'
      AND last_gate = 'PRE_SETTING'
      AND bucket = ?
      AND model = ?
      AND style = ?
      AND ncvs = ?
      AND barcode_status = 'ACTIVE'
    GROUP BY
        job_order,
        bucket,
        po_code,
        po_item,
        model,
        style,
        ncvs,
        lot,
        size,
        id_komponen_in,
        nm_komponen_in,
        id_komponen_out,
        nm_komponen_out,
        id_group,
        id_vendor,
        nm_vendor
    HAVING GREATEST(
        MAX(qty_plan) - SUM(COALESCE(qty_pre_setting, 0)),
        0
    ) > 0
    ORDER BY lot, size
";

        $detailStmt = mysqli_prepare($conn, $detailSql);

        if (!$detailStmt) {
            throw new RuntimeException(
                'Gagal menyiapkan detail: ' . mysqli_error($conn)
            );
        }

        mysqli_stmt_bind_param(
            $detailStmt,
            'ssss',
            $bucket,
            $model,
            $style,
            $ncvs
        );


        if (!mysqli_stmt_execute($detailStmt)) {
            throw new RuntimeException(
                'Gagal mengambil detail: ' .
                    mysqli_stmt_error($detailStmt)
            );
        }

        $detailResult = mysqli_stmt_get_result($detailStmt);
        $rows = [];

        while ($row = mysqli_fetch_assoc($detailResult)) {
            $row['id_trans'] = (string) $row['id_trans'];
            $row['qty_remaining'] = (float) $row['qty_remaining'];
            $row['status_label'] = 'Belum terpenuhi';
            $rows[] = $row;
        }

        mysqli_stmt_close($detailStmt);

        respondQtyFulfillment([
            'status' => 'success',
            'data' => $rows
        ]);
    }

    if ($action !== 'list') {
        respondQtyFulfillment([
            'status' => 'error',
            'message' => 'Action tidak dikenal.'
        ], 400);
    }

    $keyword = trim((string) ($_POST['search'] ?? ''));
    $start = max(0, (int) ($_POST['start'] ?? 0));
    $length = (int) ($_POST['length'] ?? 20);

    if (!in_array($length, [10, 20, 50, 100], true)) {
        $length = 20;
    }

    $baseSql = "
        SELECT
            bucket,
            model,
            style,
            ncvs,
            SUM(qty_debt) AS total_remaining
        FROM (
            SELECT
                job_order,
                po_code,
                po_item,
                bucket,
                model,
                style,
                ncvs,
                lot,
                size,
                GREATEST(
    MAX(
        COALESCE(
            CAST(NULLIF(qty_plan, '') AS DECIMAL(10,2)),
            0
        )
    )
    -
    SUM(
        COALESCE(
            CAST(NULLIF(qty_pre_setting, '') AS DECIMAL(10,2)),
            0
        )
    ),
    0
) AS qty_debt
            FROM tbl_transactions
            WHERE mode = 'CUSTOM'
              AND (? = '' OR ncvs = ?)
            GROUP BY
                job_order,
                po_code,
                po_item,
                bucket,
                model,
                style,
                ncvs,
                lot,
                size
            HAVING qty_debt > 0
        ) AS source_debts
        GROUP BY
            bucket,
            model,
            style,
            ncvs
    ";

    // 1. Total kelompok sebelum pencarian.
    $countSql = "
        SELECT COUNT(*) AS total
        FROM ($baseSql) AS custom_groups
    ";

    $countStmt = mysqli_prepare($conn, $countSql);

    if (!$countStmt) {
        throw new RuntimeException(
            'Gagal menyiapkan total data: ' . mysqli_error($conn)
        );
    }

    mysqli_stmt_bind_param(
        $countStmt,
        'ss',
        $userNcvs,
        $userNcvs
    );

    if (!mysqli_stmt_execute($countStmt)) {
        throw new RuntimeException(
            'Gagal menghitung total data: ' .
                mysqli_stmt_error($countStmt)
        );
    }

    $countResult = mysqli_stmt_get_result($countStmt);
    $recordsTotal = (int) mysqli_fetch_assoc($countResult)['total'];

    mysqli_stmt_close($countStmt);

    // 2. Pencarian hanya pada kolom listing utama.
    $searchSql = '';
    $searchParams = [$userNcvs, $userNcvs];

    if ($keyword !== '') {
        $searchSql = "
            WHERE (
                bucket LIKE ?
                OR model LIKE ?
                OR style LIKE ?
                OR ncvs LIKE ?
            )
        ";

        $like = '%' . $keyword . '%';

        array_push(
            $searchParams,
            $like,
            $like,
            $like,
            $like
        );
    }

    $filteredSql = "
        SELECT COUNT(*) AS total
        FROM ($baseSql) AS custom_groups
        $searchSql
    ";

    $filteredStmt = mysqli_prepare($conn, $filteredSql);

    if (!$filteredStmt) {
        throw new RuntimeException(
            'Gagal menyiapkan pencarian: ' . mysqli_error($conn)
        );
    }

    mysqli_stmt_bind_param(
        $filteredStmt,
        str_repeat('s', count($searchParams)),
        ...$searchParams
    );

    if (!mysqli_stmt_execute($filteredStmt)) {
        throw new RuntimeException(
            'Gagal menghitung hasil pencarian: ' .
                mysqli_stmt_error($filteredStmt)
        );
    }

    $filteredResult = mysqli_stmt_get_result($filteredStmt);
    $recordsFiltered = (int) mysqli_fetch_assoc($filteredResult)['total'];

    mysqli_stmt_close($filteredStmt);

    // 3. Ambil data sesuai halaman DataTables.
    $dataSql = "
        SELECT
            bucket,
            model,
            style,
            ncvs,
            total_remaining
        FROM ($baseSql) AS custom_groups
        $searchSql
        ORDER BY bucket, model, style, ncvs
        LIMIT ? OFFSET ?
    ";

    $dataStmt = mysqli_prepare($conn, $dataSql);

    if (!$dataStmt) {
        throw new RuntimeException(
            'Gagal menyiapkan listing: ' . mysqli_error($conn)
        );
    }

    $dataParams = $searchParams;
    $dataParams[] = $length;
    $dataParams[] = $start;

    mysqli_stmt_bind_param(
        $dataStmt,
        str_repeat('s', count($searchParams)) . 'ii',
        ...$dataParams
    );

    if (!mysqli_stmt_execute($dataStmt)) {
        throw new RuntimeException(
            'Gagal mengambil listing: ' .
                mysqli_stmt_error($dataStmt)
        );
    }

    $dataResult = mysqli_stmt_get_result($dataStmt);
    $rows = [];

    while ($row = mysqli_fetch_assoc($dataResult)) {
        $row['total_remaining'] = (float) $row['total_remaining'];
        $rows[] = $row;
    }

    mysqli_stmt_close($dataStmt);

    respondQtyFulfillment([
        'status' => 'success',
        'recordsTotal' => $recordsTotal,
        'recordsFiltered' => $recordsFiltered,
        'data' => $rows
    ]);
} catch (Throwable $e) {
    error_log(
        'Quantity Fulfillment API: ' .
            $e->getMessage()
    );

    respondQtyFulfillment([
        'status' => 'error',
        'message' =>
        'Terjadi kesalahan saat mengambil data Quantity Fulfillment.'
    ], 500);
}
