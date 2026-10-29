<?php
header('Content-Type: application/json');
require_once "function.php";
/** @var mysqli $conn */

$action = $_POST['action'] ?? "";
$search = $_POST['search'] ?? "";
$data   = ["results" => []];

try {
    switch ($action) {
        case "searchBucket":
            $sql = "SELECT DISTINCT bucket AS id, bucket AS text FROM tbl_master_data WHERE bucket LIKE ?";
            $params = ["%$search%"];
            $types  = "s";

            if (!empty($_POST['style'])) {
                $sql .= " AND style = ?";
                $params[] = $_POST['style'];
                $types .= "s";
            }

            if (!empty($_POST['model'])) {
                $sql .= " AND model = ?";
                $params[] = $_POST['model'];
                $types .= "s";
            }

            if (!empty($_POST['ncvs'])) {
                $sql .= " AND ncvs = ?";
                $params[] = $_POST['ncvs'];
                $types .= "s";
            }

            $sql .= " ORDER BY bucket ASC LIMIT 20";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param($types, ...$params);
            break;

        case "searchStyle":
            $sql = "SELECT DISTINCT style AS id, style AS text FROM tbl_master_data WHERE style LIKE ?";
            $params = ["%$search%"];
            $types  = "s";

            if (!empty($_POST['bucket'])) {
                $sql .= " AND bucket = ?";
                $params[] = $_POST['bucket'];
                $types .= "s";
            }
            if (!empty($_POST['model'])) {
                $sql .= " AND model = ?";
                $params[] = $_POST['model'];
                $types .= "s";
            }
            if (!empty($_POST['ncvs'])) {
                $sql .= " AND ncvs = ?";
                $params[] = $_POST['ncvs'];
                $types .= "s";
            }

            $sql .= " ORDER BY style ASC LIMIT 20";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param($types, ...$params);
            break;

        case "searchModel":
            $sql = "SELECT DISTINCT model AS id, model AS text FROM tbl_master_data WHERE model LIKE ?";
            $params = ["%$search%"];
            $types  = "s";

            if (!empty($_POST['bucket'])) {
                $sql .= " AND bucket = ?";
                $params[] = $_POST['bucket'];
                $types .= "s";
            }
            if (!empty($_POST['style'])) {
                $sql .= " AND style = ?";
                $params[] = $_POST['style'];
                $types .= "s";
            }
            if (!empty($_POST['ncvs'])) {
                $sql .= " AND ncvs = ?";
                $params[] = $_POST['ncvs'];
                $types .= "s";
            }

            $sql .= " ORDER BY model ASC LIMIT 20";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param($types, ...$params);
            break;

        case "searchNCVS":
            $sql = "SELECT DISTINCT ncvs AS id, ncvs AS text FROM tbl_master_data WHERE ncvs LIKE ?";
            $params = ["%$search%"];
            $types  = "s";

            if (!empty($_POST['bucket'])) {
                $sql .= " AND bucket = ?";
                $params[] = $_POST['bucket'];
                $types .= "s";
            }
            if (!empty($_POST['po_code'])) {
                $sql .= " AND po_code = ?";
                $params[] = $_POST['po_code'];
                $types .= "s";
            }
            if (!empty($_POST['job_order'])) {
                $sql .= " AND job_order = ?";
                $params[] = $_POST['job_order'];
                $types .= "s";
            }

            $sql .= " ORDER BY ncvs ASC LIMIT 20";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param($types, ...$params);
            break;

        default:
            echo json_encode($data);
            exit;
    }

    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $data['results'][] = $row;
    }
    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $data['error'] = $e->getMessage();
}

echo json_encode($data);
