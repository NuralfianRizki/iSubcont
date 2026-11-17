
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

    // =====================================================
    // 1. VALIDASI SESSION
    // =====================================================

    if (empty($_SESSION['nik_user'])) {
        respondQtyFulfillment([
            'status' => 'error',
            'message' => 'Sesi login tidak ditemukan.'
        ], 401);
    }

    if (!isset($conn) || !($conn instanceof mysqli)) {
        throw new RuntimeException(
            'Koneksi database tidak tersedia.'
        );
    }

    // =====================================================
    // 2. VALIDASI USER DAN NCVS
    // =====================================================

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

    // =====================================================
    // 3. ACTION DETAIL
    // =====================================================

    if ($action === 'detail') {

        $bucket = trim((string) ($_POST['bucket'] ?? ''));
        $model  = trim((string) ($_POST['model'] ?? ''));
        $style  = trim((string) ($_POST['style'] ?? ''));
        $ncvs   = trim((string) ($_POST['ncvs'] ?? ''));

        $mainComponent = trim(
            (string) ($_POST['main_component'] ?? '')
        );

        // ---------------------------------------------
        // VALIDASI PARAMETER KELOMPOK
        // ---------------------------------------------

        if (
            $bucket === '' ||
            $model === '' ||
            $style === '' ||
            $ncvs === '' ||
            $mainComponent === ''
        ) {
            respondQtyFulfillment([
                'status' => 'error',
                'message' => 'Parameter kelompok atau Main Component tidak lengkap.'
            ], 400);
        }

        // ---------------------------------------------
        // VALIDASI AKSES NCVS
        // ---------------------------------------------

        if ($userNcvs !== '' && $ncvs !== $userNcvs) {
            respondQtyFulfillment([
                'status' => 'error',
                'message' => 'Anda tidak memiliki akses ke NCVS ini.'
            ], 403);
        }

        // ---------------------------------------------
        // QUERY DETAIL
        // ---------------------------------------------

        $detailSql = "
    SELECT
        k.id_trans,
        t.job_order,
        t.bucket,
        t.po_code,
        t.po_item,
        t.model,
        t.style,
        t.ncvs,
        k.lot,
        k.size,
        k.id_komponen AS id_komponen_in,
        k.nm_komponen AS komponen,
        t.id_komponen_out,
        t.nm_komponen_out,
        k.id_group,
        t.id_vendor,
        t.nm_vendor,

        CAST(
            NULLIF(k.qty_kekurangan, '')
            AS DECIMAL(10,2)
        ) AS qty_remaining

    FROM tbl_transaksi_kekurangan k

    INNER JOIN tbl_transactions t
        ON t.id_trans = k.id_trans

    WHERE k.status = 'pending'
      AND k.gate = 'PRE_SETTING'
      AND t.bucket = ?
      AND t.model = ?
      AND t.style = ?
      AND t.ncvs = ?
      AND k.nm_komponen = ?

    ORDER BY
        CAST(k.lot AS UNSIGNED) ASC,
        k.size ASC
";

        $detailStmt = mysqli_prepare($conn, $detailSql);

        if (!$detailStmt) {
            throw new RuntimeException(
                'Gagal menyiapkan detail: ' . mysqli_error($conn)
            );
        }

        mysqli_stmt_bind_param(
            $detailStmt,
            'sssss',
            $bucket,
            $model,
            $style,
            $ncvs,
            $mainComponent
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

    // =====================================================
    // 4. VALIDASI ACTION LIST
    // =====================================================

    if ($action !== 'list') {
        respondQtyFulfillment([
            'status' => 'error',
            'message' => 'Action tidak dikenal.'
        ], 400);
    }

    // =====================================================
    // 5. PARAMETER DATATABLES
    // =====================================================

    $keyword = trim((string) ($_POST['search'] ?? ''));

    $start = max(
        0,
        (int) ($_POST['start'] ?? 0)
    );

    $length = (int) ($_POST['length'] ?? 20);

    if (!in_array($length, [10, 20, 50, 100], true)) {
        $length = 20;
    }

    // =====================================================
    // 6. BASE QUERY - SOURCE DEBT
    // =====================================================

    $baseSql = "
    SELECT
        t.bucket,
        t.model,
        t.style,
        t.ncvs,
        k.nm_komponen AS main_component,

        SUM(
            COALESCE(
                CAST(
                    NULLIF(k.qty_kekurangan, '')
                    AS DECIMAL(10,2)
                ),
                0
            )
        ) AS total_remaining

    FROM tbl_transaksi_kekurangan k

    INNER JOIN tbl_transactions t
        ON t.id_trans = k.id_trans

    WHERE k.status = 'pending'
      AND k.gate = 'PRE_SETTING'
      AND (? = '' OR t.ncvs = ?)

    GROUP BY
        t.bucket,
        t.model,
        t.style,
        t.ncvs,
        k.nm_komponen

    HAVING total_remaining > 0
";

    // =====================================================
    // 7. TOTAL RECORDS
    // =====================================================

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

    $recordsTotal = (int) mysqli_fetch_assoc(
        $countResult
    )['total'];

    mysqli_stmt_close($countStmt);

    // =====================================================
    // 8. SEARCH FILTER
    // =====================================================

    $searchSql = '';

    $searchParams = [
        $userNcvs,
        $userNcvs
    ];

    if ($keyword !== '') {

        $searchSql = "
            WHERE (
                bucket LIKE ?
                OR model LIKE ?
                OR style LIKE ?
                OR ncvs LIKE ?
                OR main_component LIKE ?
            )
        ";

        $like = '%' . $keyword . '%';

        array_push(
            $searchParams,
            $like,
            $like,
            $like,
            $like,
            $like
        );
    }

    // =====================================================
    // 9. FILTERED RECORDS
    // =====================================================

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

    $recordsFiltered = (int) mysqli_fetch_assoc(
        $filteredResult
    )['total'];

    mysqli_stmt_close($filteredStmt);

    // =====================================================
    // 10. DATA LISTING
    // =====================================================

    $dataSql = "
        SELECT
            bucket,
            model,
            style,
            ncvs,
            main_component,
            total_remaining

        FROM ($baseSql) AS custom_groups

        $searchSql

        ORDER BY
            bucket ASC,
            model ASC,
            style ASC,
            ncvs ASC,
            main_component ASC

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

    // =====================================================
    // 11. RESPONSE LIST
    // =====================================================

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
