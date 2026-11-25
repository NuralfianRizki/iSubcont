
<?php

require_once __DIR__ . '/function.php';

// ==========================================
// CONFIGURATION
// ==========================================

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

$previewData = $_SESSION['import_komponen_preview'] ?? [];
$previewTime = $_SESSION['import_komponen_preview_time'] ?? 0;

$updatedBy = $_SESSION['username'] ?? 'unknown';


// ==========================================
// HELPER
// ==========================================

function normalizeImportValue($value)
{
    return mb_strtoupper(trim((string) $value), 'UTF-8');
}


// ==========================================
// VALIDATE REQUEST & SESSION
// ==========================================

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    exit('Invalid request.');
}

if (empty($previewData) || !is_array($previewData)) {
    exit('Data preview tidak ditemukan. Silakan upload ulang file Excel.');
}

// Preview berlaku selama 30 menit
if (time() - $previewTime > 1800) {

    unset(
        $_SESSION['import_komponen_preview'],
        $_SESSION['import_komponen_preview_time']
    );

    exit('Sesi preview telah kedaluwarsa. Silakan upload ulang file Excel.');
}


// ==========================================
// REVALIDATE DATABASE
// ==========================================

try {

    $masterDataPairs = [];
    $existingPairs = [];
    $vendorMap = [];

    // Check Model + Style in tbl_master_data
    $resultMaster = $conn->query("
        SELECT DISTINCT model, style
        FROM tbl_master_data
    ");

    while ($row = $resultMaster->fetch_assoc()) {

        $key = normalizeImportValue($row['model'])
            . '|'
            . normalizeImportValue($row['style']);

        $masterDataPairs[$key] = true;
    }


    // Check existing Main Component in tbl_komponen
    // Including records with is_deleted = 1
    $resultExisting = $conn->query("
    SELECT DISTINCT
        k.model,
        k.style,
        k.nama_komponen AS main_component
    FROM tbl_komponen_proses kp
    JOIN tbl_komponen k
        ON k.id_komponen = kp.id_input
    WHERE kp.is_main = 1
");

    while ($row = $resultExisting->fetch_assoc()) {

        $key = normalizeImportValue($row['model'])
            . '|'
            . normalizeImportValue($row['style'])
            . '|'
            . normalizeImportValue($row['main_component']);

        $existingPairs[$key] = true;
    }


    // Recheck active vendors
    $resultVendor = $conn->query("
        SELECT id_vendor, code_vendor
        FROM tbl_vendor
        WHERE is_deleted = 0
    ");

    while ($row = $resultVendor->fetch_assoc()) {

        $code = normalizeImportValue($row['code_vendor']);

        $vendorMap[$code][] = (int) $row['id_vendor'];
    }



    // Revalidate every row
    foreach ($previewData as $row) {

        $modelKey = normalizeImportValue($row['model']);
        $styleKey = normalizeImportValue($row['style']);
        $mainKey = normalizeImportValue($row['main_component']);

        $pairKey = $modelKey . '|' . $styleKey;

        $mainComponentKey = $pairKey . '|' . $mainKey;

        // Check Model + Style
        if (!isset($masterDataPairs[$pairKey])) {
            throw new Exception(
                "Model + Style tidak ditemukan lagi di tbl_master_data: "
                    . $row['model'] . " / " . $row['style']
            );
        }

        // Check existing Main Component
        if (isset($existingPairs[$mainComponentKey])) {
            throw new Exception(
                "Main Component sudah pernah terdaftar untuk Model + Style ini: "
                    . $row['model'] . " / "
                    . $row['style'] . " / "
                    . $row['main_component']
            );
        }

        // Recheck active vendors
        $vendorCode = normalizeImportValue($row['vendor_code']);

        $matchedVendors = $vendorMap[$vendorCode] ?? [];

        if (count($matchedVendors) !== 1) {
            throw new Exception(
                "Vendor Code tidak ditemukan atau ambigu: "
                    . $row['vendor_code']
            );
        }

        // Update vendor ID with latest database result
        $row['id_vendor'] = $matchedVendors[0];
    }

    // ==========================================
    // PREPARE GROUPS
    // ==========================================

    $groups = [];

    foreach ($previewData as $row) {

        $model = trim($row['model']);
        $style = trim($row['style']);
        $main = trim($row['main_component']);

        $groupKey = normalizeImportValue($model)
            . '|'
            . normalizeImportValue($style)
            . '|'
            . normalizeImportValue($main);

        if (!isset($groups[$groupKey])) {

            $groups[$groupKey] = [
                'model' => $model,
                'style' => $style,
                'main_component' => $main,
                'output_component' => trim($row['output_component']),
                'inputs' => []
            ];
        }

        $groups[$groupKey]['inputs'][] = $row;
    }


    // ==========================================
    // START DATABASE TRANSACTION
    // ==========================================

    $conn->begin_transaction();

    $insertedGroups = 0;
    $insertedInputs = 0;
    $insertedProcesses = 0;
    $insertedLogs = 0;


    // Prepared statements
    $stmtInsertKomponen = $conn->prepare("
        INSERT INTO tbl_komponen
        (
            model,
            style,
            nama_komponen,
            is_deleted,
            updated_by
        )
        VALUES (?, ?, ?, 0, ?)
    ");

    $stmtInsertProses = $conn->prepare("
        INSERT INTO tbl_komponen_proses
        (
            id_group,
            id_input,
            id_output,
            is_main
        )
        VALUES (?, ?, ?, ?)
    ");

    $stmtInsertVendor = $conn->prepare("
        INSERT INTO tbl_vendor_proses
        (
            id_vendor,
            id_proses
        )
        VALUES (?, ?)
    ");

    $stmtInsertLog = $conn->prepare("
        INSERT INTO tlog_komponen
        (
            id_komponen,
            updated_by,
            action_type,
            old_data,
            new_data
        )
        VALUES (?, ?, ?, NULL, ?)
    ");


    // ==========================================
    // PROCESS EACH COMPONENT GROUP
    // ==========================================

    foreach ($groups as $group) {

        $model = $group['model'];
        $style = $group['style'];
        $mainComponent = $group['main_component'];
        $outputComponent = $group['output_component'];

        // --------------------------------------
        // INSERT OUTPUT COMPONENT
        // --------------------------------------

        $stmtInsertKomponen->bind_param(
            "ssss",
            $model,
            $style,
            $outputComponent,
            $updatedBy
        );

        $stmtInsertKomponen->execute();

        $idOutput = $conn->insert_id;

        $insertedGroups++;


        // --------------------------------------
        // INSERT INPUT COMPONENTS
        // --------------------------------------

        $inputIds = [];

        foreach ($group['inputs'] as $input) {

            $inputComponent = trim($input['input_component']);

            $stmtInsertKomponen->bind_param(
                "ssss",
                $model,
                $style,
                $inputComponent,
                $updatedBy
            );

            $stmtInsertKomponen->execute();

            $idInput = $conn->insert_id;

            $inputIds[] = [
                'id_input' => $idInput,
                'input_component' => $inputComponent,
                'id_vendor' => (int) $input['id_vendor']
            ];

            $insertedInputs++;
        }


        // --------------------------------------
        // FIND MAIN COMPONENT ID
        // --------------------------------------

        $idMain = null;

        foreach ($inputIds as $input) {

            if (
                normalizeImportValue($input['input_component']) ===
                normalizeImportValue($mainComponent)
            ) {

                $idMain = $input['id_input'];
                break;
            }
        }

        if ($idMain === null) {
            throw new Exception(
                "Main Component tidak ditemukan: {$mainComponent}"
            );
        }


        // --------------------------------------
        // INSERT PROCESS & VENDOR RELATIONS
        // --------------------------------------

        foreach ($inputIds as $input) {

            $idInput = $input['id_input'];
            $idVendor = $input['id_vendor'];

            $isMain = (
                normalizeImportValue($input['input_component']) ===
                normalizeImportValue($mainComponent)
            ) ? 1 : 0;

            $stmtInsertProses->bind_param(
                "iiii",
                $idMain,
                $idInput,
                $idOutput,
                $isMain
            );

            $stmtInsertProses->execute();

            $idProses = $conn->insert_id;

            $insertedProcesses++;


            // Vendor per process
            $stmtInsertVendor->bind_param(
                "ii",
                $idVendor,
                $idProses
            );

            $stmtInsertVendor->execute();


            // ----------------------------------
            // AUDIT LOG
            // ----------------------------------

            $actionType = 'IMPORT';

            $logData = json_encode([
                'model' => $model,
                'style' => $style,
                'main_component' => $mainComponent,
                'input_component' => $input['input_component'],
                'output_component' => $outputComponent,
                'id_vendor' => $idVendor,
                'id_proses' => $idProses
            ], JSON_UNESCAPED_UNICODE);

            $stmtInsertLog->bind_param(
                "isss",
                $idInput,
                $updatedBy,
                $actionType,
                $logData
            );

            $stmtInsertLog->execute();

            $insertedLogs++;
        }
    }


    // ==========================================
    // COMMIT
    // ==========================================

    $conn->commit();


    // ==========================================
    // CLEAR PREVIEW SESSION
    // ==========================================

    unset(
        $_SESSION['import_komponen_preview'],
        $_SESSION['import_komponen_preview_time']
    );


    $_SESSION['green_notif'] =
        "Import berhasil. "
        . "<strong>{$insertedGroups}</strong> grup komponen, "
        . "<strong>{$insertedInputs}</strong> input komponen, "
        . "<strong>{$insertedProcesses}</strong> proses, dan "
        . "<strong>{$insertedLogs}</strong> log berhasil disimpan.";


    header("Location: ./../pages/master-komponen.php");
    exit;
} catch (Throwable $e) {

    if ($conn->errno === 0 || $conn->ping()) {
        try {
            $conn->rollback();
        } catch (Throwable $rollbackError) {
            // Ignore rollback exception
        }
    }

    $_SESSION['red_notif'] =
        "Import gagal. Tidak ada data yang disimpan. "
        . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8');

    header("Location: ./../pages/master-komponen.php");
    exit;
}
