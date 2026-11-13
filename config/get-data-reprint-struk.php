
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
 * Binding parameter dinamis.
 * Menggunakan reference agar kompatibel dengan mysqli_stmt_bind_param.
 */
function reprintBindParams(
    mysqli_stmt $stmt,
    string $types,
    array &$params
): void {
    if (empty($params)) {
        return;
    }

    $bindParams = [$types];

    foreach ($params as $key => &$value) {
        $bindParams[] = &$value;
    }

    unset($value);

    array_unshift($bindParams, $stmt);

    call_user_func_array(
        'mysqli_stmt_bind_param',
        $bindParams
    );
}

try {

    // 1. VALIDASI SESSION
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

    // 2. VALIDASI USER DAN NCVS
    $userStmt = mysqli_prepare(
        $conn,
        "SELECT ncvs
         FROM tbl_user
         WHERE nik_user = ?
           AND is_deleted = 0
         LIMIT 1"
    );

    if (!$userStmt) {
        throw new RuntimeException('Gagal menyiapkan validasi user.');
    }

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

    // 3. FILTER NCVS
    $ncvsSql = '';
    $baseParams = [];
    $baseTypes = '';

    if ($userNcvs !== '') {
        $ncvsSql = ' AND ncvs = ? ';
        $baseParams[] = $userNcvs;
        $baseTypes .= 's';
    }

    /*
     * 4. ACTION LIST
     *
     * Listing dikelompokkan berdasarkan:
     * bucket, model, style, ncvs, last_gate.
     *
     * PRE_SETTING:
     * COUNT DISTINCT barcode.
     *
     * IN_SM_SUBCONT:
     * COUNT DISTINCT global_barcode.
     */
    if ($action === 'list') {

        $keyword = trim((string) ($_POST['search'] ?? ''));

        $start = max(0, (int) ($_POST['start'] ?? 0));
        $length = (int) ($_POST['length'] ?? 20);

        if (!in_array($length, [10, 20, 50, 100], true)) {
            $length = 20;
        }

        $searchSql = '';
        $params = $baseParams;
        $types = $baseTypes;

        if ($keyword !== '') {

            $searchSql = "
                AND (
                    bucket LIKE ?
                    OR model LIKE ?
                    OR style LIKE ?
                    OR ncvs LIKE ?
                    OR nm_komponen_in LIKE ?
                )
            ";

            $like = '%' . $keyword . '%';

            $params[] = $like;
            $params[] = $like;
            $params[] = $like;
            $params[] = $like;
            $params[] = $like;

            $types .= 'sssss';
        }

        $failedCondition = "
            print_status = 'FAILED'
            AND (
                (
                    last_gate = 'PRE_SETTING'
                    AND barcode IS NOT NULL
                    AND barcode <> ''
                )
                OR
                (
                    last_gate = 'IN_SM_SUBCONT'
                    AND global_barcode IS NOT NULL
                    AND global_barcode <> ''
                )
            )
        ";

        // 4A. Total seluruh kelompok sebelum pencarian.
        $countSql = "
            SELECT COUNT(*) AS total
            FROM (
                SELECT
                    bucket,
                    model,
                    style,
                    ncvs,
                    last_gate,
                    nm_komponen_in
                FROM tbl_transactions
                WHERE $failedCondition
                $ncvsSql
                GROUP BY
                    bucket,
                    model,
                    style,
                    ncvs,
                    last_gate,
                    nm_komponen_in
            ) AS failed_groups
        ";

        $countStmt = mysqli_prepare($conn, $countSql);

        if (!$countStmt) {
            throw new RuntimeException('Gagal menyiapkan total data.');
        }

        $countParams = $baseParams;
        $countTypes = $baseTypes;

        reprintBindParams(
            $countStmt,
            $countTypes,
            $countParams
        );

        if (!mysqli_stmt_execute($countStmt)) {
            throw new RuntimeException('Gagal menghitung total data.');
        }

        $countResult = mysqli_stmt_get_result($countStmt);
        $total = (int) mysqli_fetch_assoc($countResult)['total'];

        mysqli_stmt_close($countStmt);

        // 4B. Total kelompok setelah pencarian.
        $filteredSql = "
            SELECT COUNT(*) AS total
            FROM (
                SELECT
                    bucket,
                    model,
                    style,
                    ncvs,
                    last_gate,
                    nm_komponen_in
                FROM tbl_transactions
                WHERE $failedCondition
                $ncvsSql
                $searchSql
                GROUP BY
                    bucket,
                    model,
                    style,
                    ncvs,
                    last_gate,
                    nm_komponen_in
            ) AS failed_groups
        ";

        $filteredStmt = mysqli_prepare($conn, $filteredSql);

        if (!$filteredStmt) {
            throw new RuntimeException('Gagal menyiapkan filter data.');
        }

        $filteredParams = $params;
        $filteredTypes = $types;

        reprintBindParams(
            $filteredStmt,
            $filteredTypes,
            $filteredParams
        );

        if (!mysqli_stmt_execute($filteredStmt)) {
            throw new RuntimeException('Gagal menghitung data filter.');
        }

        $filteredResult = mysqli_stmt_get_result($filteredStmt);
        $filtered = (int) mysqli_fetch_assoc($filteredResult)['total'];

        mysqli_stmt_close($filteredStmt);

        // 4C. Ambil data listing.
        $dataSql = "
            SELECT
                bucket,
                model,
                style,
                ncvs,
                last_gate,
                nm_komponen_in AS komponen,

                CASE
                    WHEN last_gate = 'PRE_SETTING'
                        THEN 'Failed Pre-Setting'
                    WHEN last_gate = 'IN_SM_SUBCONT'
                        THEN 'Failed In SM Subcont'
                    ELSE 'Unknown'
                END AS status_label,

                COUNT(
                    DISTINCT CASE
                        WHEN last_gate = 'PRE_SETTING'
                            THEN barcode
                        WHEN last_gate = 'IN_SM_SUBCONT'
                            THEN global_barcode
                    END
                ) AS total_failed

            FROM tbl_transactions

            WHERE $failedCondition
            $ncvsSql
            $searchSql

            GROUP BY
                bucket,
                model,
                style,
                ncvs,
                last_gate,
                nm_komponen_in

            ORDER BY
                bucket,
                model,
                style,
                ncvs,
                last_gate,
                nm_komponen_in

            LIMIT ? OFFSET ?
        ";

        $dataStmt = mysqli_prepare($conn, $dataSql);

        if (!$dataStmt) {
            throw new RuntimeException('Gagal menyiapkan listing.');
        }

        $dataParams = $params;
        $dataTypes = $types . 'ii';

        $dataParams[] = $length;
        $dataParams[] = $start;

        reprintBindParams(
            $dataStmt,
            $dataTypes,
            $dataParams
        );

        if (!mysqli_stmt_execute($dataStmt)) {
            throw new RuntimeException('Gagal mengambil listing.');
        }

        $result = mysqli_stmt_get_result($dataStmt);
        $rows = [];

        while ($row = mysqli_fetch_assoc($result)) {
            $row['total_failed'] = (int) $row['total_failed'];
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

    /*
     * 5. ACTION DETAIL
     *
     * PRE_SETTING:
     * Group by barcode.
     *
     * IN_SM_SUBCONT:
     * Group by global_barcode.
     */
    if ($action === 'detail') {

        $bucket = trim((string) ($_POST['bucket'] ?? ''));
        $model = trim((string) ($_POST['model'] ?? ''));
        $style = trim((string) ($_POST['style'] ?? ''));
        $ncvs = trim((string) ($_POST['ncvs'] ?? ''));
        $lastGate = trim((string) ($_POST['last_gate'] ?? ''));
        $komponen = trim((string) ($_POST['komponen'] ?? ''));

        if (
            $bucket === '' ||
            $model === '' ||
            $style === '' ||
            $ncvs === '' ||
            $lastGate === '' ||
            $komponen === ''
        ) {
            respond([
                'status' => 'error',
                'message' => 'Parameter kelompok tidak lengkap.'
            ], 400);
        }

        // Validasi gate.
        if (!in_array(
            $lastGate,
            ['PRE_SETTING', 'IN_SM_SUBCONT'],
            true
        )) {
            respond([
                'status' => 'error',
                'message' => 'Gate transaksi tidak valid.'
            ], 400);
        }

        // Validasi akses NCVS.
        if ($userNcvs !== '' && $ncvs !== $userNcvs) {
            respond([
                'status' => 'error',
                'message' => 'Anda tidak memiliki akses ke NCVS ini.'
            ], 403);
        }

        // Tentukan identitas berdasarkan gate.
        $identityColumn = $lastGate === 'PRE_SETTING'
            ? 'barcode'
            : 'global_barcode';

        // Tentukan sumber qty berdasarkan gate.
        $qtyColumn = $lastGate === 'PRE_SETTING'
            ? 'qty_pre_setting'
            : 'qty_sm_subcont';

        $statusLabel = $lastGate === 'PRE_SETTING'
            ? 'Failed Pre-Setting'
            : 'Failed In SM Subcont';

        // Filter NCVS detail.
        $detailNcvsSql = '';

        if ($userNcvs !== '') {
            $detailNcvsSql = ' AND ncvs = ? ';
        }

        $sql = "
            SELECT
                MIN(id_trans) AS id_trans,

                $identityColumn AS identity_value,

                barcode,
                global_barcode,

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

                SUM(COALESCE($qtyColumn, 0)) AS total_qty,

                MAX(print_status) AS print_status

            FROM tbl_transactions

            WHERE print_status = 'FAILED'
              AND last_gate = ?
              AND bucket = ?
              AND model = ?
              AND style = ?
              AND ncvs = ?
              AND nm_komponen_in = ?
              AND $identityColumn IS NOT NULL
              AND $identityColumn <> ''

              $detailNcvsSql

            GROUP BY
                $identityColumn,
                bucket,
                model,
                style,
                ncvs

            ORDER BY $identityColumn
        ";

        $stmt = mysqli_prepare($conn, $sql);

        if (!$stmt) {
            throw new RuntimeException('Gagal menyiapkan detail data.');
        }

        $detailParams = [
            $lastGate,
            $bucket,
            $model,
            $style,
            $ncvs,
            $komponen
        ];

        $detailTypes = 'ssssss';

        if ($userNcvs !== '') {
            $detailParams[] = $userNcvs;
            $detailTypes .= 's';
        }

        reprintBindParams(
            $stmt,
            $detailTypes,
            $detailParams
        );

        if (!mysqli_stmt_execute($stmt)) {
            throw new RuntimeException('Gagal mengambil detail data.');
        }

        $result = mysqli_stmt_get_result($stmt);
        $rows = [];

        while ($row = mysqli_fetch_assoc($result)) {

            // Format lot menjadi rentang.
            $lots = array_values(array_unique(array_filter(
                array_map(
                    'intval',
                    explode(',', (string) ($row['lot_values'] ?? ''))
                ),
                static fn($value) => $value > 0
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

            $row['identity_type'] = $identityColumn;
            $row['last_gate'] = $lastGate;
            $row['status_label'] = $statusLabel;
            $row['lot_range'] = implode(', ', $ranges);
            $row['total_qty'] = (float) $row['total_qty'];

            unset($row['lot_values']);

            $rows[] = $row;
        }

        mysqli_stmt_close($stmt);

        respond([
            'status' => 'success',
            'identity_type' => $identityColumn,
            'last_gate' => $lastGate,
            'status_label' => $statusLabel,
            'data' => $rows
        ]);
    }

    // 6. ACTION TIDAK DIKENAL.
    respond([
        'status' => 'error',
        'message' => 'Action tidak dikenal.'
    ], 400);
} catch (Throwable $e) {

    error_log('Reprint Barcode API: ' . $e->getMessage());

    respond([
        'status' => 'error',
        'message' => $e instanceof RuntimeException
            ? $e->getMessage()
            : 'Terjadi kesalahan saat mengambil data.'
    ], 500);
}
