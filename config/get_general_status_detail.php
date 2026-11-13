<?php
require 'function.php';
/** @var mysqli $conn */

header('Content-Type: application/json');

$stage      = $_POST['stage'] ?? '';

$job_order  = $_POST['job_order'] ?? '';

$bucket      = $_POST['bucket'] ?? '';

$po_code     = $_POST['po_code'] ?? '';

$po_item     = $_POST['po_item'] ?? '';

$component   = $_POST['component'] ?? '';

switch ($stage) {

    case 'SM Subcont In':

        $actualField = 'qty_sm_subcont';
        break;

    case 'SM Subcont Out':

        $actualField = 'qty_send_to_wh';
        break;

    case 'WH Subcont In':

        $actualField = 'qty_wh_from_sm';
        break;

    case 'WH Subcont Out':

        $actualField = 'qty_send_to_vendor';
        break;

    case 'Vendor Subcont In':

        $actualField = 'qty_vendor_from_wh';
        break;

    case 'Vendor Subcont Out':

        $actualField = 'qty_vendor_send_wh';
        break;

    case 'Return WH Subcont':

        $actualField = 'qty_wh_from_vendor';
        break;

    case 'Transfer to SM Subcont':

        $actualField = 'qty_wh_send_sm';
        break;

    case 'Return SM Subcont':

        $actualField = 'qty_sm_from_wh';
        break;

    case 'Transfer to NCVS':

        $actualField = 'qty_sm_send_prod';
        break;

    default:

        exit(json_encode([
            'status' => false,
            'message' => 'Stage tidak dikenali'
        ]));
}

$sql = "

SELECT

    size,

    SUM(qty_plan) plan,

    SUM($actualField) actual

FROM tbl_transactions

WHERE

job_order = ?

AND bucket = ?

AND po_code = ?

AND po_item = ?

AND nm_komponen_in = ?

GROUP BY size

ORDER BY
CAST(REPLACE(size,'T','') AS UNSIGNED),
size

";

$stmt = $conn->prepare($sql);

$stmt->bind_param(
    "sssss",
    $job_order,
    $bucket,
    $po_code,
    $po_item,
    $component
);

$stmt->execute();

$result = $stmt->get_result();

$data = [];

$totalPlan = 0;
$totalActual = 0;
$totalBalance = 0;

while ($row = $result->fetch_assoc()) {

    $balance = $row['actual'] - $row['plan'];

    $data[] = [

        "size" => $row['size'],

        "plan" => (int)$row['plan'],

        "actual" => (int)$row['actual'],

        "balance" => $balance

    ];

    $totalPlan += $row['plan'];

    $totalActual += $row['actual'];

    $totalBalance += $balance;
}

echo json_encode([

    "status" => true,

    "rows" => $data,

    "summary" => [

        "plan" => $totalPlan,

        "actual" => $totalActual,

        "balance" => $totalBalance

    ]

]);
