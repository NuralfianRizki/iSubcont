<?php
require 'function.php';
/** @var mysqli $conn */

// Ambil request DataTables
$draw   = $_POST['draw'] ?? 1;
$start  = $_POST['start'] ?? 0;
$length = $_POST['length'] ?? 10;

// Filter
$bucket    = $_POST['bucket'] ?? '';
$style     = $_POST['style'] ?? '';
$model     = $_POST['model'] ?? '';
$ncvs      = $_POST['ncvs'] ?? '';

// Kalau semua filter kosong, langsung return kosong
if (empty($bucket) && empty($style) && empty($model) && empty($ncvs)) {
    echo json_encode([
        "draw" => intval($draw),
        "recordsTotal" => 0,
        "recordsFiltered" => 0,
        "data" => []
    ]);
    exit;
}

// Base query — ambil dari master
$sql = "
FROM tbl_master_data m
WHERE 1=1
";

$where = [];
$params = [];
$types = "";

// Filter dinamis
if (!empty($bucket)) {
    $where[] = "m.bucket = ?";
    $params[] = $bucket;
    $types   .= "s";
}

if (!empty($style)) {
    $where[] = "m.style = ?";
    $params[] = $style;
    $types   .= "s";
}

if (!empty($model)) {
    $where[] = "m.model = ?";
    $params[] = $model;
    $types   .= "s";
}

if (!empty($ncvs)) {
    $where[] = "m.ncvs = ?";
    $params[] = $ncvs;
    $types   .= "s";
}

if (!empty($where)) {
    $sql .= " AND " . implode(" AND ", $where);
}

// ===============================
// Hitung total unik style
// ===============================
$totalQuery = "SELECT COUNT(DISTINCT m.style) as cnt " . $sql;
$stmt = $conn->prepare($totalQuery);
if ($types) $stmt->bind_param($types, ...$params);
$stmt->execute();
$totalResult = $stmt->get_result()->fetch_assoc();
$recordsTotal = $totalResult['cnt'] ?? 0;

// ===============================
// Ambil data unik per job_order
// ===============================
$dataQuery = "
    SELECT
        m.bucket,
        MAX(m.model) AS model,
        m.style,
        m.ncvs,
        SUM(CAST(m.qty AS UNSIGNED)) AS Qty_Order
    " . $sql . "
    GROUP BY
        m.bucket,
        m.style,
        m.ncvs
    ORDER BY
        m.bucket ASC,
        m.style ASC,
        m.ncvs ASC
    LIMIT ?, ?
";

$params2 = $params;
$types2  = $types . "ii";
$params2[] = intval($start);
$params2[] = intval($length);

$stmt2 = $conn->prepare($dataQuery);
$stmt2->bind_param($types2, ...$params2);
$stmt2->execute();
$dataResult = $stmt2->get_result();

$data = [];
while ($row = $dataResult->fetch_assoc()) {

    // LINK KE DETAIL LOT BASIS
    $params = http_build_query([
        'style'  => $row['style'],
        'ncvs'   => $row['ncvs'],
        'bucket' => $row['bucket']
    ]);

    $row['style'] = '<a href="transaction-barcode-detail.php?'
        . htmlspecialchars($params, ENT_QUOTES, 'UTF-8')
        . '" class="btn btn-sm btn-outline-primary"
           target="_blank" rel="noopener noreferrer">'
        . htmlspecialchars($row['style'], ENT_QUOTES, 'UTF-8')
        . '</a>';

    $data[] = $row;
}

// Response ke DataTables
echo json_encode([
    "draw" => intval($draw),
    "recordsTotal" => $recordsTotal,
    "recordsFiltered" => $recordsTotal,
    "data" => $data
]);
