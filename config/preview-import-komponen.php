<?php

use PhpOffice\PhpSpreadsheet\IOFactory;

require_once __DIR__ . '/function.php';

// ==========================================
// CONFIGURATION
// ==========================================

$maxRows = 200;

$expectedHeader = [
    'model',
    'style',
    'main component',
    'input component',
    'output component',
    'vendor code'
];

$errors = [];
$validRows = [];
$displayRows = [];

// ==========================================
// HELPER
// ==========================================

function normalizeKomponen($value)
{
    return mb_strtoupper(trim((string) $value), 'UTF-8');
}

function h($value)
{
    return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
}

// ==========================================
// VALIDATE REQUEST
// ==========================================

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    exit('Invalid request.');
}

if (!isset($_FILES['file_import_komponen'])) {
    exit('File Excel tidak ditemukan.');
}

$file = $_FILES['file_import_komponen'];

if ($file['error'] !== UPLOAD_ERR_OK) {
    exit('Upload file gagal. Silakan coba kembali.');
}

$fileName = $file['name'];
$fileTmp  = $file['tmp_name'];

$fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

if ($fileExt !== 'xlsx') {
    exit('Format file tidak valid. Gunakan file .xlsx.');
}

if ($file['size'] > 5 * 1024 * 1024) {
    exit('Ukuran file maksimal 5 MB.');
}

// ==========================================
// READ EXCEL
// ==========================================

try {

    $reader = IOFactory::createReader('Xlsx');
    $reader->setReadDataOnly(true);

    $spreadsheet = $reader->load($fileTmp);

    $sheet = $spreadsheet->getSheetByName('IMPORT_KOMPONEN');

    if (!$sheet) {
        throw new Exception('Sheet IMPORT_KOMPONEN tidak ditemukan.');
    }
} catch (Throwable $e) {

    exit('File Excel tidak dapat dibaca: ' . h($e->getMessage()));
}

// ==========================================
// VALIDATE HEADER
// ==========================================

$header = $sheet->rangeToArray(
    'A1:F1',
    null,
    true,
    true,
    false
)[0];

$header = array_map(function ($value) {
    return strtolower(trim((string) $value));
}, $header);

if ($header !== $expectedHeader) {
    exit('Struktur header Excel tidak sesuai template.');
}

// ==========================================
// READ ROWS
// ==========================================

$highestRow = $sheet->getHighestDataRow();

$rawRows = [];
$totalRows = 0;

for ($rowNumber = 2; $rowNumber <= $highestRow; $rowNumber++) {

    $row = $sheet->rangeToArray(
        "A{$rowNumber}:F{$rowNumber}",
        null,
        true,
        true,
        false
    )[0];

    $row = array_map(function ($value) {
        return trim((string) ($value ?? ''));
    }, $row);

    // Abaikan baris yang sepenuhnya kosong
    if (count(array_filter($row, function ($value) {
        return $value !== '';
    })) === 0) {
        continue;
    }

    $totalRows++;

    $rawRows[] = [
        'excel_row' => $rowNumber,
        'data' => $row
    ];
}

if ($totalRows === 0) {
    exit('Tidak ada data yang ditemukan dalam file Excel.');
}

if ($totalRows > $maxRows) {
    exit("Maksimal {$maxRows} baris data per upload. File memiliki {$totalRows} baris.");
}

// ==========================================
// VALIDATE REQUIRED FIELDS & DATA LENGTH
// ==========================================

foreach ($rawRows as $item) {

    $excelRow = $item['excel_row'];
    $data = $item['data'];

    [
        $model,
        $style,
        $mainComponent,
        $inputComponent,
        $outputComponent,
        $vendorCode
    ] = $data;

    $rowErrors = [];

    $fields = [
        'Model' => $model,
        'Style' => $style,
        'Main Component' => $mainComponent,
        'Input Component' => $inputComponent,
        'Output Component' => $outputComponent,
        'Vendor Code' => $vendorCode
    ];

    foreach ($fields as $fieldName => $value) {
        if ($value === '') {
            $rowErrors[] = "{$fieldName} wajib diisi.";
        }
    }

    $lengthRules = [
        'Model' => [$model, 50],
        'Style' => [$style, 15],
        'Main Component' => [$mainComponent, 200],
        'Input Component' => [$inputComponent, 200],
        'Output Component' => [$outputComponent, 200],
        'Vendor Code' => [$vendorCode, 20]
    ];

    foreach ($lengthRules as $fieldName => [$value, $maxLength]) {

        if (mb_strlen($value, 'UTF-8') > $maxLength) {
            $rowErrors[] = "{$fieldName} melebihi batas {$maxLength} karakter.";
        }
    }

    $displayRows[] = [
        'excel_row' => $excelRow,
        'model' => $model,
        'style' => $style,
        'main_component' => $mainComponent,
        'input_component' => $inputComponent,
        'output_component' => $outputComponent,
        'vendor_code' => $vendorCode,
        'errors' => $rowErrors
    ];
}

// ==========================================
// VALIDATE MODEL + STYLE
// ==========================================

// Ambil seluruh kombinasi Model + Style
// dari tbl_master_data sebagai referensi.

$masterDataPairs = [];

$resultMaster = $conn->query("
    SELECT DISTINCT model, style
    FROM tbl_master_data
");

while ($row = $resultMaster->fetch_assoc()) {

    $key = normalizeKomponen($row['model'])
        . '|'
        . normalizeKomponen($row['style']);

    $masterDataPairs[$key] = true;
}


// Ambil seluruh kombinasi dari tbl_komponen.
// Tidak menggunakan filter is_deleted,
// karena record yang sudah dihapus tetap ditolak.

$existingPairs = [];

$resultExisting = $conn->query("
    SELECT DISTINCT model, style
    FROM tbl_komponen
");

while ($row = $resultExisting->fetch_assoc()) {

    $key = normalizeKomponen($row['model'])
        . '|'
        . normalizeKomponen($row['style']);

    $existingPairs[$key] = true;
}

// ==========================================
// VALIDATE VENDOR CODE
// ==========================================

$vendorMap = [];

$resultVendor = $conn->query("
    SELECT id_vendor, code_vendor
    FROM tbl_vendor
    WHERE is_deleted = 0
");

while ($vendor = $resultVendor->fetch_assoc()) {

    $code = normalizeKomponen($vendor['code_vendor']);

    $vendorMap[$code][] = (int) $vendor['id_vendor'];
}


// ==========================================
// VALIDATE GROUP & DUPLICATE INPUT
// ==========================================

$groups = [];
$seenInputs = [];
$seenModelStyles = [];

foreach ($displayRows as $index => &$row) {

    $excelRow = $row['excel_row'];

    $modelKey = normalizeKomponen($row['model']);
    $styleKey = normalizeKomponen($row['style']);

    $mainKey = normalizeKomponen($row['main_component']);
    $inputKey = normalizeKomponen($row['input_component']);
    $outputKey = normalizeKomponen($row['output_component']);
    $vendorKey = normalizeKomponen($row['vendor_code']);

    $pairKey = $modelKey . '|' . $styleKey;

    $groupKey = $pairKey . '|' . $mainKey;

    // ==========================================
    // CHECK MASTER DATA
    // ==========================================

    if (
        $modelKey !== '' &&
        $styleKey !== '' &&
        !isset($masterDataPairs[$pairKey])
    ) {
        $row['errors'][] =
            'Model + Style tidak ditemukan di tbl_master_data.';
    }


    // ==========================================
    // CHECK MASTER KOMPONEN
    // ==========================================

    if (
        $modelKey !== '' &&
        $styleKey !== '' &&
        isset($existingPairs[$pairKey])
    ) {
        $row['errors'][] =
            'Model + Style sudah pernah terdaftar di tbl_komponen.';
    }

    // Vendor validation
    if ($vendorKey !== '') {

        $matchedVendors = $vendorMap[$vendorKey] ?? [];

        if (count($matchedVendors) === 0) {

            $row['errors'][] = 'Vendor Code tidak ditemukan atau vendor tidak aktif.';
        } elseif (count($matchedVendors) > 1) {

            $row['errors'][] = 'Vendor Code ditemukan lebih dari satu kali pada vendor aktif.';
        } else {

            $row['id_vendor'] = $matchedVendors[0];
        }
    }

    // Duplicate Input Component in same group
    if ($inputKey !== '') {

        $inputUniqueKey = $groupKey . '|' . $inputKey;

        if (isset($seenInputs[$inputUniqueKey])) {

            $row['errors'][] = 'Input Component duplikat dalam grup yang sama.';
        } else {

            $seenInputs[$inputUniqueKey] = true;
        }
    }

    // Group consistency
    if (!isset($groups[$groupKey])) {

        $groups[$groupKey] = [
            'output' => $outputKey,
            'main_found' => false,
            'rows' => []
        ];
    } elseif ($groups[$groupKey]['output'] !== $outputKey) {

        $row['errors'][] = 'Output Component tidak konsisten dalam grup yang sama.';
    }

    // Main Component must exist as Input Component
    if ($mainKey !== '' && $inputKey !== '' && $mainKey === $inputKey) {

        $groups[$groupKey]['main_found'] = true;
    }

    $groups[$groupKey]['rows'][] = $index;

    // Duplicate Model + Style is intentionally allowed
    // because multiple component rows belong to one Style.

}

unset($row);


// ==========================================
// VALIDATE MAIN COMPONENT
// ==========================================

foreach ($groups as $group) {

    if (!$group['main_found']) {

        foreach ($group['rows'] as $index) {

            $displayRows[$index]['errors'][] =
                'Main Component harus sama dengan salah satu Input Component dalam grup.';
        }
    }
}


// ==========================================
// BUILD VALIDATION RESULT
// ==========================================

$validCount = 0;
$failedCount = 0;

foreach ($displayRows as $row) {

    if (empty($row['errors'])) {

        $validCount++;

        $validRows[] = [
            'model' => $row['model'],
            'style' => $row['style'],
            'main_component' => $row['main_component'],
            'input_component' => $row['input_component'],
            'output_component' => $row['output_component'],
            'vendor_code' => $row['vendor_code'],
            'id_vendor' => $row['id_vendor']
        ];
    } else {

        $failedCount++;

        foreach ($row['errors'] as $error) {
            $errors[] = "Baris Excel {$row['excel_row']}: {$error}";
        }
    }
}


// ==========================================
// SAVE PREVIEW TO SESSION IF ALL VALID
// ==========================================

if ($failedCount === 0) {

    $_SESSION['import_komponen_preview'] = $validRows;

    $_SESSION['import_komponen_preview_time'] = time();
} else {

    unset(
        $_SESSION['import_komponen_preview'],
        $_SESSION['import_komponen_preview_time']
    );
}

$spreadsheet->disconnectWorksheets();


// ==========================================
// DISPLAY PREVIEW RESULT
// ==========================================

?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>iSubcont - Preview Import Komponen</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../assets/img/Logo-Stg.png" rel="icon">
    <link href="../assets/img/Logo-Stg.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet">

    <!-- Tambahkan pustaka Select2 di bagian <head> -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Pastikan jQuery ada -->

    <!-- Select2 CSS & JS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.bootstrap5.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

</head>

<body class="bg-light">

    <div class="container py-4">

        <div class="card shadow-sm">

            <div class="card-header bg-success text-white">
                <h5 class="mb-0">
                    <i class="bi bi-file-earmark-excel me-2"></i>
                    Preview Import Master Komponen
                </h5>
            </div>

            <div class="card-body">

                <h6>File: <?= h($fileName) ?></h6>

                <div class="row g-3 my-3">

                    <div class="col-md-4">
                        <div class="border rounded p-3">
                            <small class="text-muted">Total Baris</small>
                            <h4><?= $totalRows ?></h4>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="border rounded p-3">
                            <small class="text-muted">Valid</small>
                            <h4 class="text-success"><?= $validCount ?></h4>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="border rounded p-3">
                            <small class="text-muted">Bermasalah</small>
                            <h4 class="text-danger"><?= $failedCount ?></h4>
                        </div>
                    </div>

                </div>

                <?php if ($failedCount > 0): ?>

                    <div class="alert alert-danger">
                        <strong>
                            <i class="bi bi-exclamation-triangle me-1"></i>
                            Validasi gagal.
                        </strong>

                        <p class="mb-2">
                            Tidak ada data yang disimpan. Perbaiki kesalahan berikut:
                        </p>

                        <ul class="mb-0">
                            <?php foreach ($errors as $error): ?>
                                <li><?= h($error) ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>

                <?php else: ?>

                    <div class="alert alert-success">
                        <i class="bi bi-check-circle me-1"></i>
                        Seluruh data lolos validasi awal dan siap untuk tahap konfirmasi import.
                    </div>

                <?php endif; ?>


                <div class="table-responsive">

                    <table class="table table-bordered table-striped table-sm align-middle">

                        <thead class="table-light">
                            <tr>
                                <th>Excel Row</th>
                                <th>Model</th>
                                <th>Style</th>
                                <th>Main Component</th>
                                <th>Input Component</th>
                                <th>Output Component</th>
                                <th>Vendor Code</th>
                                <th>Status</th>
                            </tr>
                        </thead>

                        <tbody>

                            <?php foreach ($displayRows as $row): ?>

                                <tr>
                                    <td><?= $row['excel_row'] ?></td>
                                    <td><?= h($row['model']) ?></td>
                                    <td><?= h($row['style']) ?></td>
                                    <td><?= h($row['main_component']) ?></td>
                                    <td><?= h($row['input_component']) ?></td>
                                    <td><?= h($row['output_component']) ?></td>
                                    <td><?= h($row['vendor_code']) ?></td>

                                    <td>
                                        <?php if (empty($row['errors'])): ?>

                                            <span class="badge bg-success">Valid</span>

                                        <?php else: ?>

                                            <span class="badge bg-danger">
                                                <?= count($row['errors']) ?> Error
                                            </span>

                                        <?php endif; ?>
                                    </td>
                                </tr>

                            <?php endforeach; ?>

                        </tbody>

                    </table>

                </div>


                <div class="d-flex justify-content-between mt-3">

                    <button type="button"
                        class="btn btn-secondary"
                        onclick="history.back()">

                        <i class="bi bi-arrow-left me-1"></i>
                        Kembali

                    </button>

                    <?php if ($failedCount === 0): ?>

                        <form action="./import-komponen.php" method="POST"
                            onsubmit="return confirm('Apakah Anda yakin ingin mengimport seluruh data ini?');">

                            <button type="submit" class="btn btn-success">

                                <i class="bi bi-check-circle me-1"></i>
                                Import

                            </button>

                        </form>

                    <?php endif; ?>

                </div>

                <small class="text-muted d-block mt-3">
                    Tahap ini hanya melakukan pembacaan dan validasi.
                    Belum ada perubahan data pada database.
                </small>

            </div>
        </div>

    </div>

</body>

</html>