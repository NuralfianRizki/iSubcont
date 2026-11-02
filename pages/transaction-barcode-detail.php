<?php
// menghubungkan php dengan koneksi database
require_once __DIR__ . '/../config/function.php';
require_once __DIR__ . '/../config/auth.php';
checkAuth('trans_barcode'); // cek apakah sudah login dan punya akses ke menu ini

$nik = $_SESSION['nik_user'];
$username = $_SESSION['username'];

$bucket = trim($_GET['bucket'] ?? '');
$style  = trim($_GET['style'] ?? '');
$ncvs   = trim($_GET['ncvs'] ?? '');

if ($bucket === '' || $style === '' || $ncvs === '') {
  die("<div class='alert alert-danger'>Bucket, Style, dan NCVS wajib tersedia.</div>");
}

$bucketEsc = $conn->real_escape_string($bucket);
$styleEsc  = $conn->real_escape_string($style);
$ncvsEsc   = $conn->real_escape_string($ncvs);

// Normalisasi size — biarkan sesuai database
function normalizeSize($s)
{
  $s = strtoupper(trim($s));

  // Jika size angka murni → pad kiri dengan 0
  if (preg_match('/^\d+$/', $s)) {
    return str_pad($s, 3, "0", STR_PAD_LEFT);
  }

  // Jika format misal 4T → jadi 04T
  if (preg_match('/^(\d+)([A-Z]+)$/', $s, $m)) {
    return str_pad($m[1], 2, "0", STR_PAD_LEFT) . $m[2];
  }

  return $s;
}

// 1️⃣ Ambil informasi umum

$infoQuery = "
    SELECT
        job_order,
        bucket,
        po_code,
        po_item,
        style,
        model,
        ncvs,
        status_lot,
        MIN(date_updated) AS doc_date
    FROM tbl_master_data
    WHERE bucket = '{$bucketEsc}'
      AND style = '{$styleEsc}'
      AND ncvs = '{$ncvsEsc}'
    GROUP BY
        job_order,
        bucket,
        po_code,
        po_item,
        style,
        model,
        ncvs,
        status_lot
    ORDER BY
    CAST(SUBSTRING_INDEX(job_order, '-', 1) AS UNSIGNED),
    CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(job_order, '-', 2), '-', -1) AS UNSIGNED),
    CAST(SUBSTRING_INDEX(job_order, '-', -1) AS UNSIGNED)
";

$infoResult = $conn->query($infoQuery);

if (!$infoResult || $infoResult->num_rows === 0) {
  die("<div class='alert alert-warning'>Data tidak ditemukan untuk kombinasi Bucket, Style, dan NCVS tersebut.</div>");
}

$jobOrders = $infoResult->fetch_all(MYSQLI_ASSOC);

// Model dipastikan sama untuk kombinasi Bucket + Style + NCVS
$info = $jobOrders[0];

$model = $conn->real_escape_string($info['model']);
$modelName = $model;

/* 1. Ambil Model dan Style untuk filter komponen */
$modelEsc = $conn->real_escape_string($info['model']);
$styleEsc = $conn->real_escape_string($info['style']);

/* 2. Ambil mapping komponen dan vendor berdasarkan Model + Style */
$komponenQuery = "
    SELECT
        kp.id_group,
        kp.id_output,
        ko.nama_komponen AS nm_output,

        main_component.id_komponen AS id_main_input,
        main_component.nama_komponen AS nm_main_input,

        GROUP_CONCAT(
            ki.id_komponen
            ORDER BY kp.is_main DESC, ki.nama_komponen ASC
            SEPARATOR '|'
        ) AS id_input_list,

        GROUP_CONCAT(
            ki.nama_komponen
            ORDER BY kp.is_main DESC, ki.nama_komponen ASC
            SEPARATOR '|'
        ) AS nm_input_list,

        GROUP_CONCAT(
            kp.is_main
            ORDER BY kp.is_main DESC, ki.nama_komponen ASC
            SEPARATOR '|'
        ) AS is_main_list,

        MAX(v.id_vendor) AS id_vendor,
        MAX(v.name_vendor) AS name_vendor

    FROM tbl_komponen_proses kp

    /* Komponen input */
    JOIN tbl_komponen ki
        ON ki.id_komponen = kp.id_input
        AND ki.is_deleted = 0

    /* Komponen output */
    JOIN tbl_komponen ko
        ON ko.id_komponen = kp.id_output
        AND ko.is_deleted = 0

    /* Komponen utama / group */
    JOIN tbl_komponen main_component
        ON main_component.id_komponen = kp.id_group
        AND main_component.is_deleted = 0

    /* Mapping proses ke vendor */
    LEFT JOIN (
        SELECT DISTINCT id_proses, id_vendor
        FROM tbl_vendor_proses
    ) vp
        ON vp.id_proses = kp.id_proses

    /* Detail nama vendor */
    LEFT JOIN tbl_vendor v
        ON v.id_vendor = vp.id_vendor
        AND v.is_deleted = 0

    WHERE
        ki.model = '{$modelEsc}'
        AND ki.style = '{$styleEsc}'

        AND ko.model = '{$modelEsc}'
        AND ko.style = '{$styleEsc}'

        AND main_component.model = '{$modelEsc}'
        AND main_component.style = '{$styleEsc}'

    GROUP BY
        kp.id_group,
        kp.id_output,
        ko.nama_komponen,
        main_component.id_komponen,
        main_component.nama_komponen

    ORDER BY
        ko.nama_komponen ASC,
        main_component.nama_komponen ASC
";

$komponenResult = $conn->query($komponenQuery);

if (!$komponenResult) {
  error_log("Query komponen gagal: " . $conn->error);
  $komponenList = [];
} else {
  $komponenList = $komponenResult->fetch_all(MYSQLI_ASSOC);
}

// 2️⃣ Ambil LOT & SIZE

$lotsResult = $conn->query("
    SELECT DISTINCT lot
    FROM tbl_master_data
    WHERE bucket = '{$bucketEsc}'
      AND style = '{$styleEsc}'
      AND ncvs = '{$ncvsEsc}'
    ORDER BY CAST(lot AS UNSIGNED)
");

$lots = $lotsResult
  ? $lotsResult->fetch_all(MYSQLI_ASSOC)
  : [];


$sizesResult = $conn->query("
    SELECT DISTINCT size
    FROM tbl_master_data
    WHERE bucket = '{$bucketEsc}'
      AND style = '{$styleEsc}'
      AND ncvs = '{$ncvsEsc}'
    ORDER BY size
");

$sizes = $sizesResult
  ? $sizesResult->fetch_all(MYSQLI_ASSOC)
  : [];


if (empty($lots)) {
  die("<div class='alert alert-warning'>Tidak ada LOT ditemukan untuk kombinasi Bucket, Style, dan NCVS tersebut.</div>");
}

if (empty($sizes)) {
  die("<div class='alert alert-warning'>Tidak ada SIZE ditemukan untuk kombinasi Bucket, Style, dan NCVS tersebut.</div>");
}

// 3️⃣ PLAN DATA (mapping ke komponen dari qty_real)

// 3. PLAN DATA per Job Order, LOT, dan SIZE
$planData = [];

$qLotSize = $conn->query("
    SELECT
        job_order,
        lot,
        size,
        SUM(qty) AS total_plan
    FROM tbl_master_data
    WHERE bucket = '{$bucketEsc}'
      AND style = '{$styleEsc}'
      AND ncvs = '{$ncvsEsc}'
    GROUP BY job_order, lot, size
    ORDER BY job_order, CAST(lot AS UNSIGNED), size
");

if ($qLotSize && $qLotSize->num_rows > 0) {
  while ($r = $qLotSize->fetch_assoc()) {
    $jobOrder = (string) $r['job_order'];
    $lot      = (string) $r['lot'];
    $size     = normalizeSize($r['size']);
    $plan     = (float) $r['total_plan'];

    $planData[$jobOrder][$lot][$size] = $plan;
  }
}

// Daftar SIZE resmi dari seluruh Job Order yang cocok
$officialSizes = [];

foreach ($planData as $jobOrder => $lotsData) {
  foreach ($lotsData as $lot => $sizesData) {
    foreach ($sizesData as $size => $qty) {
      $officialSizes[$size] = true;
    }
  }
}

$officialSizes = array_keys($officialSizes);

// Urutkan SIZE berdasarkan angka dan karakter tambahan, misalnya 07T
usort($officialSizes, function ($a, $b) {
  preg_match('/\d+/', $a, $ma);
  preg_match('/\d+/', $b, $mb);

  $na = intval($ma[0] ?? 0);
  $nb = intval($mb[0] ?? 0);

  return $na !== $nb
    ? $na <=> $nb
    : strnatcasecmp($a, $b);
});

?>

<style>
  .toast-progress {
    height: 4px;
    width: 100%;
    overflow: hidden;
    border-radius: 0 0 0.375rem 0.375rem;
  }

  .toast-progress-bar {
    height: 100%;
    animation: progressBar 3s linear forwards;
  }

  @keyframes progressBar {
    0% {
      width: 100%;
    }

    100% {
      width: 0%;
    }
  }

  .select2-container {
    width: 100% !important;
  }

  .select2-selection {
    min-height: 38px;
    /* biar seragam sama form-control bootstrap */
    display: flex;
    align-items: center;
  }

  .bg-soft-gray {
    background-color: #BFC9D1 !important;
  }

  .komponen-card {
    position: relative;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    padding: 14px 14px 14px 45px;
    background: #fff;
    transition: all 0.2s ease;
    cursor: pointer;
  }

  .komponen-card:hover {
    border-color: #0d6efd;
    background: #f8fbff;
  }

  .komponen-card input[type="checkbox"] {
    position: absolute;
    left: 14px;
    top: 18px;
    transform: scale(1.2);
  }

  .komponen-card.checked {
    border-color: #198754;
    background: #f0fff5;
    box-shadow: 0 0 0 1px #198754;
  }

  .komponen-header {
    font-weight: 600;
    font-size: 15px;
  }

  .komponen-sub {
    font-size: 13px;
    color: #6c757d;
    margin-top: 2px;
  }

  .komponen-sub .arrow {
    margin-right: 4px;
  }

  .komponen-vendor {
    font-size: 12px;
    margin-top: 6px;
    color: #0d6efd;
  }

  .group-komponen-card {
    align-items: flex-start;
  }

  .group-child-component {
    font-size: 13px;
    color: #6c757d;
    line-height: 1.45;
    padding-left: 2px;
  }

  .komponen-header {
    font-weight: 600;
    color: #333;
    line-height: 1.45;
  }

  .komponen-sub {
    color: #6c757d;
    font-size: 13px;
    line-height: 1.45;
  }

  .komponen-vendor {
    color: #0d6efd;
    font-size: 13px;
    line-height: 1.45;
  }

  /* Modal Konfirmasi Quantity Setting */
  #modalTappingSetting .modal-header {
    background: linear-gradient(135deg, #198754, #116b43);
    color: #fff;
    border-bottom: none;
    padding: 18px 22px;
  }

  #modalTappingSetting .modal-title {
    font-weight: 700;
    letter-spacing: 0.3px;
  }

  #modalTappingSetting .modal-header .btn-close {
    filter: brightness(0) invert(1);
  }

  #modalTappingSetting .modal-body {
    padding: 24px;
    background: #f7f9fb;
  }

  #modalTappingSetting .setting-info-card {
    background: #fff;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    padding: 15px 18px;
    height: 100%;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
  }

  #modalTappingSetting .setting-info-label {
    display: block;
    font-size: 12px;
    color: #6b7280;
    margin-bottom: 5px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  #modalTappingSetting .setting-info-value {
    font-size: 15px;
    font-weight: 700;
    color: #212529;
  }

  #modalTappingSetting .setting-component-card {
    background: #fff;
    border: 1px solid #e5e7eb;
    border-left: 4px solid #198754;
    border-radius: 9px;
    padding: 14px 16px;
    margin-bottom: 10px;
  }

  #modalTappingSetting .tapping-focus-card {
    background: #fff;
    border: 2px solid #198754;
    border-radius: 12px;
    padding: 20px;
    margin-top: 22px;
    box-shadow: 0 4px 14px rgba(25, 135, 84, 0.09);
  }

  #modalTappingSetting #tapping-user-id {
    height: 52px;
    font-size: 18px;
    font-weight: 600;
    border: 2px solid #ced4da;
    border-radius: 8px;
  }

  #modalTappingSetting #tapping-user-id:focus {
    border-color: #198754;
    box-shadow: 0 0 0 4px rgba(25, 135, 84, 0.14);
  }

  #modalTappingSetting .modal-footer {
    background: #fff;
    border-top: 1px solid #e9ecef;
    padding: 14px 24px;
  }

  #print-result-placeholder {
    display: none;
  }

  .print-result-modal {
    border: none;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 18px 55px rgba(0, 0, 0, 0.2);
  }

  .print-result-icon {
    width: 84px;
    height: 84px;
    margin: 28px auto 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #e8f1ff;
    color: #2563eb;
    font-size: 38px;
  }

  .print-result-title {
    font-weight: 700;
    color: #1f2937;
    margin-bottom: 10px;
  }

  .print-result-description {
    color: #5b6472;
    font-size: 15px;
    line-height: 1.6;
    margin-bottom: 20px;
  }

  .print-result-info {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    padding: 14px;
    border-radius: 12px;
    background: #f3f6fa;
    color: #4b5563;
    font-size: 13px;
    line-height: 1.6;
    text-align: left;
    margin-bottom: 24px;
  }

  .print-result-info i {
    color: #2563eb;
    font-size: 17px;
    margin-top: 2px;
  }

  .print-result-actions {
    display: flex;
    gap: 12px;
  }

  .btn-result-failed,
  .btn-result-success {
    flex: 1;
    min-height: 48px;
    border: none;
    border-radius: 12px;
    font-size: 15px;
    font-weight: 700;
    transition: transform 0.15s ease, opacity 0.15s ease;
  }

  .btn-result-failed {
    background: #dc3545;
    color: #fff;
  }

  .btn-result-success {
    background: #198754;
    color: #fff;
  }

  .btn-result-failed:hover,
  .btn-result-success:hover {
    color: #fff;
    transform: translateY(-2px);
    opacity: 0.92;
  }

  .btn-result-failed:disabled,
  .btn-result-success:disabled {
    opacity: 0.65;
    cursor: not-allowed;
  }

  @media (max-width: 400px) {
    .print-result-actions {
      flex-direction: column-reverse;
    }
  }
</style>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>iSubcont - Transactions</title>
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

  <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

  <!-- Barcode -->
  <!-- <script src="https://unpkg.com/bwip-js/dist/bwip-js-min.js"></script> -->

</head>

<body>

  <!-- Header -->
  <?php
  $page = 'trans_barcode';
  include_once __DIR__ . '/../includes/header.php';
  ?>
  <!-- End Header -->

  <main id="main" class="main">

    <div class="pagetitle text-black" style="background-color: #f0e6d2; padding: 10px 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
      <h1 style="font-size: 1.8rem; font-weight: 700; font-family: 'Roboto', sans-serif;">
        Details Create Barcode by Lot Basis
      </h1>
    </div>


    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body" style="margin-top: 10px;">

              <div id="global-data"
                data-bucket="<?= htmlspecialchars($info['bucket'], ENT_QUOTES, 'UTF-8') ?>"
                data-style="<?= htmlspecialchars($info['style'], ENT_QUOTES, 'UTF-8') ?>"
                data-ncvs="<?= htmlspecialchars($info['ncvs'], ENT_QUOTES, 'UTF-8') ?>"
                data-model="<?= htmlspecialchars($info['model'], ENT_QUOTES, 'UTF-8') ?>"
                data-job-orders="<?= htmlspecialchars(
                                    json_encode(
                                      array_values(array_unique(array_column($jobOrders, 'job_order'))),
                                      JSON_HEX_APOS | JSON_HEX_QUOT
                                    ),
                                    ENT_QUOTES,
                                    'UTF-8'
                                  ) ?>"
                data-lot-code="<?= htmlspecialchars($info['status_lot'] ?? 'N/A', ENT_QUOTES, 'UTF-8') ?>">
              </div>


              <div id="komponen-data"
                data-komponen="<?= htmlspecialchars(
                                  json_encode(
                                    $komponenList,
                                    JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_TAG
                                  ),
                                  ENT_QUOTES,
                                  'UTF-8'
                                ) ?>">
              </div>


              <div class="container mt-4">

                <?php
                $grandTotal = 0;
                $grandSizeTotals = array_fill_keys($officialSizes, 0);
                $hasJobOrder = false;
                $columnCount = count($officialSizes) + 3;

                foreach ($jobOrders as $jobInfo):
                  $jobOrder = (string) $jobInfo['job_order'];
                  $jobLots = $planData[$jobOrder] ?? [];

                  if (empty($jobLots)) {
                    continue;
                  }

                  $hasJobOrder = true;
                  $jobSizeTotals = array_fill_keys($officialSizes, 0);
                  $jobTotal = 0;
                ?>

                  <!-- Informasi Job Order: layout tetap -->
                  <div class="row g-2 mb-2">
                    <div class="col-md-3">
                      <label style="font-weight: bold;">Job Order</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars($jobInfo['job_order'] ?? '', ENT_QUOTES, 'UTF-8') ?>">
                    </div>

                    <div class="col-md-3">
                      <label style="font-weight: bold;">Bucket</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars($jobInfo['bucket'] ?? '', ENT_QUOTES, 'UTF-8') ?>">
                    </div>

                    <div class="col-md-3">
                      <label style="font-weight: bold;">PO Code</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars($jobInfo['po_code'] ?? '', ENT_QUOTES, 'UTF-8') ?>">
                    </div>

                    <div class="col-md-3">
                      <label style="font-weight: bold;">PO Item</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars($jobInfo['po_item'] ?? '', ENT_QUOTES, 'UTF-8') ?>">
                    </div>
                  </div>

                  <div class="row g-2 mt-2 mb-3">
                    <div class="col-md-3">
                      <label style="font-weight: bold;">Model</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars($jobInfo['model'] ?? '', ENT_QUOTES, 'UTF-8') ?>">
                    </div>

                    <div class="col-md-3">
                      <label style="font-weight: bold;">Style</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars($jobInfo['style'] ?? '', ENT_QUOTES, 'UTF-8') ?>">
                    </div>

                    <div class="col-md-3">
                      <label style="font-weight: bold;">NCVS</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars($jobInfo['ncvs'] ?? '', ENT_QUOTES, 'UTF-8') ?>">
                    </div>

                    <div class="col-md-3">
                      <label style="font-weight: bold;">Lot Code</label>
                      <input class="form-control" readonly
                        style="background-color: #EEEEEE;"
                        value="<?= htmlspecialchars(
                                  !empty($jobInfo['status_lot']) ? $jobInfo['status_lot'] : 'N/A',
                                  ENT_QUOTES,
                                  'UTF-8'
                                ) ?>">
                    </div>
                  </div>

                  <!-- Tabel LOT-SIZE khusus Job Order ini -->
                  <div style="overflow-x: auto;" class="mb-4">
                    <table class="table table-bordered text-center align-middle"
                      style="min-width: 1000px;">

                      <thead class="table-light">
                        <tr>
                          <th>
                            <div class="d-flex justify-content-center align-items-center">
                              <input type="checkbox"
                                class="check-all-job"
                                data-job-order="<?= htmlspecialchars($jobOrder, ENT_QUOTES, 'UTF-8') ?>">
                            </div>
                          </th>

                          <th>LOT</th>

                          <?php foreach ($officialSizes as $size): ?>
                            <th>
                              <div class="d-flex justify-content-center align-items-center gap-1">
                                <span><?= htmlspecialchars($size) ?></span>
                                <input type="checkbox"
                                  class="check-size-header"
                                  data-job-order="<?= htmlspecialchars($jobOrder, ENT_QUOTES, 'UTF-8') ?>"
                                  data-size="<?= htmlspecialchars($size, ENT_QUOTES, 'UTF-8') ?>">
                              </div>
                            </th>
                          <?php endforeach; ?>

                          <th>Total</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php foreach ($jobLots as $lot => $sizes): ?>
                          <?php
                          $lotTotal = 0;

                          foreach ($officialSizes as $size) {
                            $qty = (float) ($sizes[$size] ?? 0);
                            $lotTotal += $qty;
                            $jobSizeTotals[$size] += $qty;
                            $grandSizeTotals[$size] += $qty;
                          }

                          $jobTotal += $lotTotal;
                          $grandTotal += $lotTotal;
                          ?>

                          <tr>
                            <td>
                              <input type="checkbox"
                                class="check-lot"
                                data-job-order="<?= htmlspecialchars($jobOrder, ENT_QUOTES, 'UTF-8') ?>"
                                data-lot="<?= htmlspecialchars((string) $lot, ENT_QUOTES, 'UTF-8') ?>">
                            </td>

                            <td class="fw-bold bg-light">
                              <?= htmlspecialchars((string) $lot) ?>
                            </td>

                            <?php foreach ($officialSizes as $size):
                              $val = (float) ($sizes[$size] ?? 0);
                            ?>

                              <td class="<?= $val == 0 ? 'bg-soft-gray text-muted' : '' ?>">
                                <?php if ($val > 0): ?>
                                  <div class="d-flex justify-content-center align-items-center gap-1">
                                    <input
                                      type="number"
                                      class="form-control form-control-sm qty-input"
                                      value="<?= (int) $val ?>"
                                      min="1"
                                      max="<?= (int) $val ?>"
                                      step="1"
                                      data-plan-qty="<?= (int) $val ?>"
                                      data-last-valid="<?= (int) $val ?>"
                                      style="width: 75px; text-align: center;"
                                      aria-label="Quantity <?= htmlspecialchars($size, ENT_QUOTES, 'UTF-8') ?>">

                                    <input type="checkbox"
                                      class="check-cell"
                                      data-job-order="<?= htmlspecialchars($jobOrder, ENT_QUOTES, 'UTF-8') ?>"
                                      data-lot="<?= htmlspecialchars((string) $lot, ENT_QUOTES, 'UTF-8') ?>"
                                      data-size="<?= htmlspecialchars($size, ENT_QUOTES, 'UTF-8') ?>"
                                      data-qty="<?= (int) $val ?>"
                                      data-plan-qty="<?= (int) $val ?>">
                                  </div>
                                <?php endif; ?>
                              </td>

                            <?php endforeach; ?>

                            <td class="fw-bold text-success bg-light">
                              <?= $lotTotal ?>
                            </td>
                          </tr>
                        <?php endforeach; ?>

                        <!-- Total per SIZE untuk Job Order ini -->
                        <tr class="fw-bold table-light">
                          <td></td>
                          <td>Total</td>

                          <?php foreach ($officialSizes as $size): ?>
                            <td class="text-success">
                              <?= $jobSizeTotals[$size] ?>
                            </td>
                          <?php endforeach; ?>

                          <td class="text-success"><?= $jobTotal ?></td>
                        </tr>
                      </tbody>
                    </table>
                    <hr>
                  </div>

                <?php endforeach; ?>

                <?php if (!$hasJobOrder): ?>
                  <div class="alert alert-warning">
                    Tidak ada data LOT-SIZE untuk Job Order ini.
                  </div>
                <?php endif; ?>

                <!-- Grand Total seluruh Job Order -->
                <?php if ($hasJobOrder): ?>
                  <div style="overflow-x: auto;">
                    <table class="table table-bordered text-center align-middle"
                      style="min-width: 1000px;">

                      <tbody>
                        <tr class="fw-bold table-light">
                          <td></td>
                          <td>GTT</td>

                          <?php foreach ($officialSizes as $size): ?>
                            <td class="text-success">
                              <?= $grandSizeTotals[$size] ?>
                            </td>
                          <?php endforeach; ?>

                          <td class="text-success"><?= $grandTotal ?></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                <?php endif; ?>

                <div id="selection-panel" class="alert alert-info d-none">
                  <span id="selection-info"></span>
                  <button class="btn btn-primary btn-sm" id="btn-next">
                    Lanjutkan
                  </button>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <div class="modal fade" id="modalKonfirmasi" tabindex="-1">
      <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content shadow">

          <!-- HEADER -->
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title d-flex align-items-center" id="tambahUserModalLabel">
              <i class="bi bi-card-checklist me-2"></i> Konfirmasi Detail Create Barcode
            </h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">

            <!-- ===================== -->
            <!-- GLOBAL INFO (CARD) -->
            <!-- ===================== -->
            <div class="card border-0 shadow-sm mb-3">
              <div class="card-body p-3">


                <div class="row text-center">

                  <div class="col-md-3">
                    <div class="small text-muted">Bucket</div>
                    <div class="fw-bold" id="m-bucket"></div>
                  </div>

                  <div class="col-md-3">
                    <div class="small text-muted">Model</div>
                    <div class="fw-bold" id="m-model"></div>
                  </div>

                  <div class="col-md-3">
                    <div class="small text-muted">Style</div>
                    <div class="fw-bold" id="m-style"></div>
                  </div>

                  <div class="col-md-3">
                    <div class="small text-muted">NCVS</div>
                    <div class="fw-bold text-primary" id="m-ncvs"></div>
                  </div>

                </div>
              </div>
            </div>

            <!-- ===================== -->
            <!-- SUMMARY -->
            <!-- ===================== -->
            <div class="mb-3">
              <h6 class="fw-bold mb-2">
                Detail Pilihan:
              </h6>

              <div id="m-summary"></div>
            </div>

            <!-- ===================== -->
            <!-- KOMPONEN -->
            <!-- ===================== -->
            <div>
              <h6 class="fw-bold mb-2">
                Pilih Komponen:
              </h6>

              <div id="m-komponen" class="row g-2"></div>
            </div>

          </div>

          <!-- FOOTER -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
              <i class="bi bi-x-circle me-1"></i> Batal
            </button>
            <button type="button" class="btn btn-success" id="btn-submit-barcode">
              <i class="bi bi-check-circle me-1"></i> Konfirmasi
            </button>
          </div>

        </div>
      </div>
    </div>

    <div class="modal fade" id="modalTappingSetting"
      tabindex="-1" aria-hidden="true">

      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

          <!-- Header -->
          <div class="modal-header">
            <h5 class="modal-title fw-bold">
              <i class="bi bi-check-circle-fill me-2"></i>
              KONFIRMASI QUANTITY SETTING
            </h5>

          </div>

          <!-- Body -->
          <div class="modal-body p-4">

            <!-- Informasi utama -->
            <div class="row g-3 mb-4">
              <div class="col-md-6">
                <div class="setting-info-card">
                  <span class="setting-info-label">Bucket - NCVS</span>
                  <div class="setting-info-value" id="t-bucket-ncvs">-</div>
                </div>
              </div>

              <div class="col-md-6">
                <div class="setting-info-card">
                  <span class="setting-info-label">Model - Style</span>
                  <div class="setting-info-value" id="t-model-style">-</div>
                </div>
              </div>
            </div>

            <!-- Ringkasan komponen -->
            <div id="t-komponen-summary" class="mb-3"></div>

            <div
              id="tapping-validation-message"
              class="alert d-none mb-3"
              role="alert"
              aria-live="polite">
            </div>

            <!-- Fokus tapping ID -->
            <div class="tapping-focus-card">
              <label for="tapping-user-id" class="form-label fw-bold">
                <i class="bi bi-person-badge me-2"></i>
                Tapping ID Card
              </label>

              <input
                type="text"
                id="tapping-user-id"
                class="form-control"
                placeholder="Tap kartu ID di sini"
                autocomplete="off" />
            </div>

            <!-- <button type="button"
                class="btn btn-primary"
                onclick="testPrintRPP02N()">
              TEST PRINT BLUETOOTH
            </button> -->

          </div>

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-success px-4"
              id="btn-tapping-next">
              Lanjutkan <i class="bi bi-arrow-right ms-1"></i>
            </button>
          </div>

        </div>
      </div>
    </div>

    <div class="modal fade" id="modalPrintResult" tabindex="-1"
      data-bs-backdrop="static" data-bs-keyboard="false"
      aria-labelledby="modalPrintResultTitle" aria-hidden="true">

      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content print-result-modal">

          <div class="print-result-icon">
            <i class="bi bi-printer-fill"></i>
          </div>

          <div class="modal-body text-center px-4 pt-0 pb-4">

            <h4 class="print-result-title" id="modalPrintResultTitle">
              Konfirmasi Hasil Print Struk
            </h4>

            <p class="print-result-description">
              Apakah seluruh struk barcode berhasil tercetak dengan baik?
            </p>

            <div class="print-result-info">
              <i class="bi bi-info-circle-fill"></i>
              <span>
                Pilih <strong>Berhasil</strong> jika semua struk barcode tercetak
                dengan benar. Pilih <strong>Gagal</strong> jika ada struk barcode
                yang tidak tercetak atau hasilnya bermasalah.
              </span>
            </div>

            <div class="d-flex justify-content-center gap-2">
              <button type="button"
                class="btn btn-danger"
                id="btn-print-failed">
                <i class="bi bi-x-circle me-1"></i>
                Gagal
              </button>

              <button type="button"
                class="btn btn-success"
                id="btn-print-success">
                <i class="bi bi-check-circle me-1"></i>
                Berhasil
              </button>
            </div>

          </div>
        </div>
      </div>
    </div>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <?php include_once __DIR__ . '/../includes/footer.php' ?>
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../assets/vendor/echarts/echarts.min.js"></script>
  <script src="../assets/vendor/quill/quill.min.js"></script>
  <script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

  <!-- Select2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Select2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

  <!-- DataTables core -->
  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap4.min.js"></script>

  <!-- Responsive extension -->
  <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>

  <!-- Buttons extension -->
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap4.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js"></script>

  <!-- Barcode Generate -->
  <script src="https://cdn.jsdelivr.net/npm/bwip-js@3.0.9/dist/bwip-js-min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

  
  <script>

  let printerDevice = null;
  let printerServer = null;
  let printerCharacteristic = null;

    async function sendBluetoothData(data) {
      if (!printerCharacteristic) {
          throw new Error('Printer Bluetooth belum terhubung.');
      }

      const chunkSize = 20;

      for (let i = 0; i < data.length; i += chunkSize) {
          const chunk = data.slice(i, i + chunkSize);

          if (printerCharacteristic.properties.writeWithoutResponse) {
              await printerCharacteristic.writeValueWithoutResponse(chunk);
          } else {
              await printerCharacteristic.writeValueWithResponse(chunk);
          }

          // Beri jeda agar buffer printer tidak penuh.
          await new Promise(resolve => setTimeout(resolve, 15));
      }
    }

    // Ubah canvas BARCODE saja menjadi data raster ESC/POS.
    // Teks label dikirim sebagai perintah teks printer agar ukuran data jauh lebih kecil.
    function barcodeCanvasToEscPos(sourceCanvas) {
      const printWidth = 384; // 48 mm pada 203 DPI
      const printHeight = Math.max(1, Math.round(sourceCanvas.height * printWidth / sourceCanvas.width));
      if (printHeight > 65535) throw new Error('Tinggi barcode melebihi batas raster printer.');

      const canvas = document.createElement('canvas');
      canvas.width = printWidth;
      canvas.height = printHeight;
      const ctx = canvas.getContext('2d', { willReadFrequently: true });
      ctx.fillStyle = '#FFFFFF';
      ctx.fillRect(0, 0, printWidth, printHeight);
      ctx.drawImage(sourceCanvas, 0, 0, printWidth, printHeight);

      const pixels = ctx.getImageData(0, 0, printWidth, printHeight).data;
      const widthBytes = Math.ceil(printWidth / 8);
      const raster = new Uint8Array(widthBytes * printHeight);

      for (let y = 0; y < printHeight; y++) {
        for (let x = 0; x < printWidth; x++) {
          const i = (y * printWidth + x) * 4;
          const gray = (pixels[i] * 299 + pixels[i + 1] * 587 + pixels[i + 2] * 114) / 1000;
          if (gray < 160) raster[y * widthBytes + Math.floor(x / 8)] |= (0x80 >> (x % 8));
        }
      }

      const header = new Uint8Array([
        0x1D, 0x76, 0x30, 0x00,
        widthBytes & 0xFF, (widthBytes >> 8) & 0xFF,
        printHeight & 0xFF, (printHeight >> 8) & 0xFF
      ]);
      const result = new Uint8Array(header.length + raster.length);
      result.set(header, 0);
      result.set(raster, header.length);
      return result;
    }

    function printerTextBytes(value) {
      // ESC/POS text mode umumnya memakai code page 8-bit, bukan UTF-8.
      // Normalisasi karakter agar teks tidak berubah menjadi simbol acak.
      const text = String(value ?? '')
        .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
        .replace(/[–—]/g, '-').replace(/[“”]/g, '"').replace(/[‘’]/g, "'")
        .replace(/[^\x20-\x7E\n\r\t]/g, '?');
      return new TextEncoder().encode(text);
    }

    function concatPrintBytes(parts) {
      const total = parts.reduce((sum, part) => sum + part.length, 0);
      const output = new Uint8Array(total);
      let offset = 0;
      for (const part of parts) { output.set(part, offset); offset += part.length; }
      return output;
    }

    function escPosText(value) { return printerTextBytes(value + '\n'); }
    function escPosCommand(...bytes) { return new Uint8Array(bytes); }

    async function printHybridLabel(label, bwipjs) {
      const parts = [];
      const cmd = (...bytes) => parts.push(new Uint8Array(bytes));
      const text = value => parts.push(printerTextBytes(String(value ?? '') + '\n'));
      const clean = value => String(value ?? '').replace(/\s+/g, ' ').trim();
      const escapeHtml = value => String(value ?? '').replace(/[&<>"']/g, char => ({
        '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;'
      })[char]);

      // 1. HEADER: HTML/CSS dirender menjadi bitmap untuk printer.
      const header = document.createElement('div');
      header.style.cssText = `
        position: fixed; left: -10000px; top: 0;
        width: 384px; box-sizing: border-box;
        padding: 14px 20px 12px;
        background: #ffffff; color: #000000;
        font-family: Arial, sans-serif;
      `;

      const lotVendor = [
        label.lot_range ? `LOT ${label.lot_range}` : '',
        label.nm_vendor || ''
      ].filter(Boolean).join(' | ');

      const mainComponentName = clean(
        label.nm_main_input || label.main_component ||
        label.main_component_name || label.nm_group || ''
      );

      header.innerHTML = `
        <div style="display:grid;grid-template-columns:115px minmax(0,1fr);column-gap:12px;align-items:start;">
          <div style="text-align:center;">
            <div style="font-size:48px;font-weight:700;line-height:1.18;">${escapeHtml(label.size)}</div>
            <div style="font-size:48px;font-weight:700;line-height:1.18;margin-top:8px;">${escapeHtml(label.total_qty)}</div>
          </div>
          <div style="min-width:0;font-size:22px;font-weight:700;line-height:1.35;overflow-wrap:anywhere;">
            <div>${escapeHtml([clean(label.bucket), clean(label.ncvs)].filter(Boolean).join(' - '))}</div>
            <div>${escapeHtml(label.model)}</div>
            <div>${escapeHtml(label.style)}</div>
          </div>
        </div>
        ${lotVendor ? `<div style="margin-top:14px;font-size:22px;font-weight:700;line-height:1.35;overflow-wrap:anywhere;">${escapeHtml(lotVendor)}</div>` : ''}
        ${mainComponentName ? `<div style="margin-top:14px;font-size:27px;font-weight:700;line-height:1.3;overflow-wrap:anywhere;">${escapeHtml(mainComponentName)}</div>` : ''}
      `;

      document.body.appendChild(header);
      try {
        if (document.fonts && document.fonts.ready) await document.fonts.ready;
        const headerCanvas = await html2canvas(header, {
          backgroundColor: '#ffffff', scale: 2,
          logging: false, useCORS: true
        });
        cmd(0x1B, 0x40);
        cmd(0x1B, 0x61, 0x00);
        parts.push(barcodeCanvasToEscPos(headerCanvas));
      } finally {
        header.remove();
      }

      // Garis pemisah Header dan Body
      cmd(0x1B, 0x4D, 0x01); // Font B
      cmd(0x1B, 0x61, 0x00); // Rata kiri
      text('-'.repeat(42));

      // 2. BODY: daftar komponen dicetak sebagai teks ESC/POS biasa.
      cmd(0x1B, 0x61, 0x00);
      cmd(0x1B, 0x4D, 0x00);
      cmd(0x1B, 0x21, 0x00);
      cmd(0x1B, 0x45, 0x00);

      const components = Array.isArray(label.group_components) ? label.group_components : [];
      const COMPONENT_COLS = 30;

      const wrapComponent = value => {
        const normalized = clean(value);
        if (!normalized) return [];
        const words = normalized.split(' ');
        const lines = [];
        let line = '';

        words.forEach(word => {
          if (word.length > COMPONENT_COLS) {
            if (line) { lines.push(line); line = ''; }
            for (let i = 0; i < word.length; i += COMPONENT_COLS) {
              lines.push(word.slice(i, i + COMPONENT_COLS));
            }
            return;
          }
          const candidate = line ? `${line} ${word}` : word;
          if (candidate.length <= COMPONENT_COLS) line = candidate;
          else {
            if (line) lines.push(line);
            line = word;
          }
        });
        if (line) lines.push(line);
        return lines;
      };

      components.forEach(component => {
        wrapComponent(component).forEach(line => text('  ' + line));
      });
      
      // Garis pemisah Body dan Footer
      cmd(0x1B, 0x4D, 0x01); // Font B
      cmd(0x1B, 0x61, 0x00); // Rata kiri
      text('-'.repeat(42));

      // 3. FOOTER: barcode Code128 sebagai gambar, nomor sebagai teks.
      const barcodeCanvas = document.createElement('canvas');
      bwipjs.toCanvas(barcodeCanvas, {
        bcid: 'code128',
        text: String(label.barcode),
        scale: 2,
        height: 8,
        includetext: false,
        backgroundcolor: 'FFFFFF'
      });

      cmd(0x1B, 0x61, 0x01);
      parts.push(barcodeCanvasToEscPos(barcodeCanvas));
      cmd(0x1B, 0x4D, 0x00);
      cmd(0x1B, 0x21, 0x00);
      cmd(0x1B, 0x45, 0x00);
      text(String(label.barcode));

      cmd(0x1B, 0x61, 0x00);
      cmd(0x1B, 0x32);
      text('');

      await sendBluetoothData(concatPrintBytes(parts));
    }

  // async function testPrintRPP02N() {
  //   try {
  //       if (!printerCharacteristic) {
  //           throw new Error('Printer belum terhubung.');
  //       }

  //       const encoder = new TextEncoder();

  //       const init = new Uint8Array([0x1B, 0x40]);

  //       const text = encoder.encode(
  //           'ISUBCONT\n' +
  //           'BLUETOOTH PRINT TEST\n' +
  //           'RONGTA RPP02N\n' +
  //           '--------------------------\n' +
  //           'Printer BLE berhasil!\n\n\n'
  //       );

  //       const data = new Uint8Array([
  //           ...init,
  //           ...text
  //       ]);

  //       await sendBluetoothData(data);

  //       alert('Data tes berhasil dikirim ke printer.');

  //   } catch (error) {
  //       console.error('Gagal mencetak:', error);
  //       alert('Gagal mencetak: ' + error.message);
  //   }
  // }


  const PRINTER_SERVICE_UUID =
      '000018f0-0000-1000-8000-00805f9b34fb';

  const PRINTER_CHARACTERISTIC_UUID =
      '00002af1-0000-1000-8000-00805f9b34fb';

  async function connectBluetoothPrinter(device) {
      printerDevice = device;

      printerServer = await device.gatt.connect();

      printerCharacteristic = await (
          await printerServer.getPrimaryService(PRINTER_SERVICE_UUID)
      ).getCharacteristic(PRINTER_CHARACTERISTIC_UUID);
      console.log('Printer:', device.name);
      console.log('Service UUID:', PRINTER_SERVICE_UUID);
      console.log('Characteristic UUID:', PRINTER_CHARACTERISTIC_UUID);
      console.log('Characteristic properties:', printerCharacteristic.properties);

      if (
          !printerCharacteristic.properties.write &&
          !printerCharacteristic.properties.writeWithoutResponse
      ) {
          throw new Error('Characteristic printer tidak mendukung pengiriman data.');
      }

      console.log('Printer Bluetooth terhubung:', device.name);
  }
  </script>

  <script>
    $(function() {
      $("#example1").DataTable({
        "responsive": true,
        "lengthChange": false,
        "autoWidth": false,
        // "buttons": ["copy", "excel"]
      }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
      });
    });
  </script>

  <script>
    $(document).ready(function() {
      $('#example1').DataTable({
        scrollX: true,
        destroy: true // biar gak error reinit
      });
    });
  </script>

  <!-- Notification print Struk -->
  <?php include_once __DIR__ . '/../includes/notification.php'; ?>

  <script>
    function showSuccess(message) {
      const toastEl = document.getElementById('toastSuccess');
      const toastMsg = document.getElementById('toastSuccessMsg');

      if (!toastEl || !toastMsg) {
        console.error('Komponen success toast tidak ditemukan.');
        return;
      }

      toastMsg.innerText = message;

      bootstrap.Toast.getOrCreateInstance(toastEl, {
        delay: 3000
      }).show();
    }

    function showError(message) {
      const toastEl = document.getElementById('toastError');
      const toastMsg = document.getElementById('toastErrorMsg');

      if (!toastEl || !toastMsg) {
        console.error('Komponen error toast tidak ditemukan.');
        return;
      }

      toastMsg.innerText = message;

      bootstrap.Toast.getOrCreateInstance(toastEl, {
        delay: 5000
      }).show();
    }
  </script>

  <script>
    // GLOBAL DATA
    const komponenEl = document.getElementById('komponen-data');

    const komponenList = komponenEl ?
      JSON.parse(komponenEl.dataset.komponen || '[]') : [];

    const globalEl = document.getElementById('global-data');

    if (!globalEl) {
      throw new Error('Element global-data tidak ditemukan');
    }

    const globalData = {
      job_orders: JSON.parse(globalEl.dataset.jobOrders || '[]'),
      bucket: globalEl.dataset.bucket,
      model: globalEl.dataset.model,
      style: globalEl.dataset.style,
      ncvs: globalEl.dataset.ncvs,
      lot_code: globalEl.dataset.lotCode
    };

    // STATE UPDATE FUNCTION 


    function getPlanQty(cell) {
      return Number(cell.dataset.planQty ?? cell.dataset.qty ?? 0);
    }

    function getFinalQty(cell) {
      const input = cell.closest('td')?.querySelector('.qty-input');

      if (!input) {
        return Number(cell.dataset.qty) || 0;
      }

      const value = Number(input.value);
      const planQty = getPlanQty(cell);

      // Jika input belum valid, gunakan nilai valid terakhir.
      if (
        !Number.isInteger(value) ||
        value < 1 ||
        value > planQty
      ) {
        return Number(input.dataset.lastValid) || planQty;
      }

      return value;
    }

    function getSelectionMode() {
      let mode = 'PLAN';

      $('.check-cell:checked').each(function() {
        if (getFinalQty(this) !== getPlanQty(this)) {
          mode = 'CUSTOM';
          return false;
        }
      });

      return mode;
    }

    function getCellsForLot(jobOrder, lot) {
      return $('.check-cell').filter(function() {
        return this.dataset.jobOrder === String(jobOrder) &&
          this.dataset.lot === String(lot);
      });
    }

    function updateLotState(jobOrder, lot) {
      const $cells = getCellsForLot(jobOrder, lot);
      const total = $cells.length;
      const checked = $cells.filter(':checked').length;

      const $lot = $('.check-lot').filter(function() {
        return this.dataset.jobOrder === String(jobOrder) &&
          this.dataset.lot === String(lot);
      });

      $lot.prop('checked', total > 0 && checked === total);
      $lot.prop('indeterminate', checked > 0 && checked < total);
    }

    function updateAllState() {
      $('.check-all-job').each(function() {
        const jobOrder = this.dataset.jobOrder;

        const $cells = $('.check-cell').filter(function() {
          return this.dataset.jobOrder === String(jobOrder);
        });

        const total = $cells.length;
        const checked = $cells.filter(':checked').length;

        this.checked = total > 0 && checked === total;
        this.indeterminate = checked > 0 && checked < total;
      });
    }

    function updateSizeHeaderState() {
      $('.check-size-header').each(function() {
        const jobOrder = this.dataset.jobOrder;
        const size = this.dataset.size;

        const $cells = $('.check-cell').filter(function() {
          return this.dataset.jobOrder === String(jobOrder) &&
            this.dataset.size === String(size);
        });

        const total = $cells.length;
        const checked = $cells.filter(':checked').length;

        this.checked = total > 0 && checked === total;
        this.indeterminate = checked > 0 && checked < total;
      });
    }

    function updateSelectionPanel() {
      const $cells = $('.check-cell:checked');

      if ($cells.length === 0) {
        $('#selection-panel').addClass('d-none');
        $('#selection-info').text('');
        return;
      }

      const lots = new Set();
      const sizes = new Set();
      let totalQty = 0;

      $cells.each(function() {
        const jobOrder = this.dataset.jobOrder;
        const lot = this.dataset.lot;
        const size = this.dataset.size;
        const qty = getFinalQty(this);

        // LOT dengan nomor sama di JO berbeda dihitung terpisah.
        lots.add(`${jobOrder}::${lot}`);
        sizes.add(size);
        totalQty += qty;
      });

      $('#selection-info').text(
        `${lots.size} LOT | ${sizes.size} SIZE | ` +
        `${$cells.length} item | Qty: ${totalQty} | ` +
        `Mode: ${getSelectionMode()}`
      );

      $('#selection-panel').removeClass('d-none');
    }

    function refreshState() {
      updateAllState();
      updateSizeHeaderState();
      updateSelectionPanel();
    }


    function showQtyTooltip(input, message) {
      let tooltip = bootstrap.Tooltip.getInstance(input);

      if (!tooltip) {
        tooltip = new bootstrap.Tooltip(input, {
          trigger: 'manual',
          placement: 'top',
          container: 'body',
          title: message
        });
      } else {
        tooltip.setContent({
          '.tooltip-inner': message
        });
      }

      tooltip.show();
    }

    function hideQtyTooltip(input) {
      const tooltip = bootstrap.Tooltip.getInstance(input);

      if (tooltip) {
        tooltip.hide();
      }
    }

    $(document).on('input', '.qty-input', function() {
      const input = this;
      const value = Number(input.value);
      const planQty = Number(input.dataset.planQty);

      const isValid =
        input.value.trim() !== '' &&
        Number.isInteger(value) &&
        value >= 1 &&
        value <= planQty;

      if (!isValid) {
        let message = 'Qty harus bilangan bulat minimal 1.';

        if (value > planQty) {
          message = `Qty tidak boleh melebihi PLAN QTY ${planQty}.`;
        } else if (value < 1) {
          message = 'Qty minimal 1.';
        } else if (!Number.isInteger(value)) {
          message = 'Qty harus berupa bilangan bulat.';
        }

        showQtyTooltip(input, message);
        input.classList.add('is-invalid');
        updateSelectionPanel();
        return;
      }

      hideQtyTooltip(input);
      input.classList.remove('is-invalid');
      input.dataset.lastValid = String(value);

      updateSelectionPanel();
    });

    $(document).on('blur', '.qty-input', function() {
      const input = this;
      const value = Number(input.value);
      const planQty = Number(input.dataset.planQty);

      const isValid =
        input.value.trim() !== '' &&
        Number.isInteger(value) &&
        value >= 1 &&
        value <= planQty;

      if (!isValid) {
        input.value = input.dataset.lastValid || String(planQty);
        input.classList.remove('is-invalid');
        hideQtyTooltip(input);
        updateSelectionPanel();
      }
    });

    // Pilih satu kombinasi LOT-SIZE.
    $(document).on('change', '.check-cell', function() {
      updateLotState(this.dataset.jobOrder, this.dataset.lot);
      refreshState();
    });

    // Pilih seluruh SIZE dalam satu LOT dan satu Job Order.
    $(document).on('change', '.check-lot', function() {
      const jobOrder = this.dataset.jobOrder;
      const lot = this.dataset.lot;
      const isChecked = this.checked;

      getCellsForLot(jobOrder, lot).prop('checked', isChecked);

      refreshState();
    });

    // Pilih semua LOT-SIZE hanya dalam tabel Job Order terkait.
    $(document).on('change', '.check-all-job', function() {
      const jobOrder = this.dataset.jobOrder;
      const isChecked = this.checked;

      $('.check-cell').filter(function() {
        return this.dataset.jobOrder === String(jobOrder);
      }).prop('checked', isChecked);

      $('.check-lot').filter(function() {
        return this.dataset.jobOrder === String(jobOrder);
      }).prop('checked', isChecked).prop('indeterminate', false);

      refreshState();
    });

    // Pilih satu SIZE hanya dalam Job Order terkait.
    $(document).on('change', '.check-size-header', function() {
      const jobOrder = this.dataset.jobOrder;
      const size = this.dataset.size;
      const isChecked = this.checked;

      const $cells = $('.check-cell').filter(function() {
        return this.dataset.jobOrder === String(jobOrder) &&
          this.dataset.size === String(size);
      });

      $cells.prop('checked', isChecked);

      const affectedLots = new Set();

      $cells.each(function() {
        affectedLots.add(this.dataset.lot);
      });

      affectedLots.forEach(function(lot) {
        updateLotState(jobOrder, lot);
      });

      refreshState();
    });

    // Struktur detail: Job Order -> LOT -> SIZE -> Qty.
    function getSelectionDetail() {
      const result = {};

      $('.check-cell:checked').each(function() {
        const jobOrder = this.dataset.jobOrder;
        const lot = this.dataset.lot;
        const size = this.dataset.size;
        const qty = getFinalQty(this);

        if (!result[jobOrder]) {
          result[jobOrder] = {};
        }

        if (!result[jobOrder][lot]) {
          result[jobOrder][lot] = {};
        }

        result[jobOrder][lot][size] = qty;
      });

      return result;
    }

    function getSelectionPlanDetail() {
      const result = {};

      $('.check-cell:checked').each(function() {
        const jobOrder = this.dataset.jobOrder;
        const lot = this.dataset.lot;
        const size = this.dataset.size;

        if (!result[jobOrder]) result[jobOrder] = {};
        if (!result[jobOrder][lot]) result[jobOrder][lot] = {};

        result[jobOrder][lot][size] = getPlanQty(this);
      });

      return result;
    }

    function getSizeSummary() {
      const result = {};

      $('.check-cell:checked').each(function() {
        const size = this.dataset.size;
        const qty = getFinalQty(this);

        if (!result[size]) {
          result[size] = 0;
        }

        result[size] += qty;
      });

      return result;
    }


    // Struktur ringkasan: Job Order -> LOT -> Total Qty.
    function getLotSummary() {
      const result = {};

      $('.check-cell:checked').each(function() {
        const jobOrder = this.dataset.jobOrder;
        const lot = this.dataset.lot;
        const qty = getFinalQty(this);

        if (!result[jobOrder]) {
          result[jobOrder] = {};
        }

        if (!result[jobOrder][lot]) {
          result[jobOrder][lot] = 0;
        }

        result[jobOrder][lot] += qty;
      });

      return result;
    }

    function getSelectedJobOrders() {
      const selected = new Set();

      $('.check-cell:checked').each(function() {
        selected.add(this.dataset.jobOrder);
      });

      return Array.from(selected);
    }


    function escapeHtml(value) {
      return String(value ?? '')
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
    }


    // SHOW MODAL
    $('#btn-next').on('click', function() {

      const sizeSummary = getSizeSummary();

      // =========================
      // 1. Isi GLOBAL INFO
      // =========================
      $('#m-bucket').text(globalData.bucket);
      $('#m-model').text(globalData.model);
      $('#m-style').text(globalData.style);
      $('#m-ncvs').text(globalData.ncvs);

      // =========================
      // 2. Render SUMMARY SIZE
      // =========================
      let html = '<div class="row g-2">';

      Object.keys(sizeSummary)
        .sort((a, b) => a.localeCompare(b, undefined, {
          numeric: true
        }))
        .forEach(size => {

          html += `
        <div class="col-md-2">
          <div class="border rounded p-2 text-center bg-light">

            <div style="font-size:12px; color:#888;">
              SIZE
            </div>

            <div style="font-weight:bold; font-size:16px;">
              ${escapeHtml(size)}
            </div>

            <div style="font-size:12px; color:#888;">
              TOTAL QTY
            </div>

            <div style="color:green; font-weight:bold; font-size:18px;">
              ${sizeSummary[size].toLocaleString('id-ID')}
            </div>

          </div>
        </div>
      `;
        });

      html += '</div>';

      $('#m-summary').html(html);

      // =========================
      // 3. Render KOMPONEN
      // =========================
      let komponenHtml = '<div class="row g-2">';

      if (!komponenList || komponenList.length === 0) {

        komponenHtml = `
    <div class="alert alert-danger text-center fw-semibold">
      Belum ada data komponen untuk model yang dipilih. <br>
      <small>Silahkan hubungi admin</small>
    </div>
  `;

        // disable tombol submit
        $('#btn-submit-barcode').prop('disabled', true);

      } else {

        komponenHtml = '<div class="row g-2">';

        komponenList.forEach(k => {

          const inputNames =
            String(k.nm_input_list || '')
            .split('|')
            .filter(Boolean);

          const inputIds =
            String(k.id_input_list || '')
            .split('|')
            .filter(Boolean);

          const isMainList =
            String(k.is_main_list || '')
            .split('|')
            .filter(Boolean);

          let childDetailHtml = '';

          inputNames.forEach(function(name, index) {

            const isMain =
              Number(isMainList[index] || 0);

            if (isMain !== 1) {

              childDetailHtml += `
        <div class="group-child-component">
          → ${escapeHtml(name)}
        </div>
      `;

            }

          });

          komponenHtml += `
    <div class="col-md-6">
      <div class="komponen-card group-komponen-card">

        <input 
          class="check-komponen"
          type="checkbox"

          data-id-group="${k.id_group}"
          data-nm-group="${k.nm_main_input}"

          data-id-main-input="${k.id_main_input}"
          data-nm-main-input="${k.nm_main_input}"

          data-id-input-list="${inputIds.join('|')}"
          data-nm-input-list="${inputNames.join('|')}"
          data-is-main-list="${isMainList.join('|')}"

          data-id-output="${k.id_output}"
          data-nm-output="${k.nm_output}"

          data-id-vendor="${k.id_vendor || ''}"
          data-nm-vendor="${k.name_vendor || ''}"
        >

        <div class="komponen-content">

          <div class="komponen-header">
            ${escapeHtml(k.nm_main_input)}
            <span class="text-danger fw-bold ms-1">*</span>
          </div>

          ${childDetailHtml}

          <div class="komponen-sub mt-1">
            to "${escapeHtml(k.nm_output)}"
          </div>

          <div class="komponen-vendor">
            → ${escapeHtml(k.name_vendor ?? '-')}
          </div>

        </div>

      </div>
    </div>
  `;

        });

        komponenHtml += '</div>';

        // default tetap disable (nunggu user pilih)
        $('#btn-submit-barcode').prop('disabled', true);
      }

      $('#m-komponen').html(komponenHtml);

      // =========================
      // 4. OPEN MODAL
      // =========================
      const modal = new bootstrap.Modal(document.getElementById('modalKonfirmasi'));
      modal.show();

    });

    let tappingMode = 'PLAN';
    let tappingStage = 'USER';
    let tappingValidationInProgress = false;

    function showTappingSettingModal(mode) {
      tappingMode = mode === 'CUSTOM' ? 'CUSTOM' : 'PLAN';
      tappingStage = 'USER';

      const detail = getSelectionDetail();
      const selectedKomponen = [];

      // Ambil komponen yang dipilih.
      $('.check-komponen:checked').each(function() {
        selectedKomponen.push({
          nm_main_input: $(this).data('nm-main-input'),
          nm_vendor: $(this).data('nm-vendor') || '-'
        });
      });

      // Hitung total Qty seluruh LOT-SIZE.
      let totalQty = 0;

      Object.values(detail).forEach(lots => {
        Object.values(lots).forEach(sizes => {
          Object.values(sizes).forEach(qty => {
            totalQty += Number(qty) || 0;
          });
        });
      });

      // Isi informasi modal.
      $('#t-bucket-ncvs').text(
        `${globalData.bucket} - ${globalData.ncvs}`
      );

      $('#t-model-style').text(
        `${globalData.model} - ${globalData.style}`
      );

      let html = '';

      selectedKomponen.forEach(k => {
        html += `
            <div class="setting-component-card">
                <div class="fw-semibold">
                    ${escapeHtml(k.nm_main_input)}
                </div>
                <div>
                    Qty dikonfirmasi:
                    <strong>${totalQty.toLocaleString('id-ID')}</strong>
                </div>
                <div class="text-muted small">
                    Vendor: ${escapeHtml(k.nm_vendor)}
                </div>
            </div>
        `;
      });

      $('#t-komponen-summary').html(html);

      // Reset ke tahap Tapping ID User.
      $('#tapping-user-id')
        .val('')
        .attr('placeholder', 'Tap atau input ID User');

      $('#modalTappingSetting label[for="tapping-user-id"]').html(
        '<i class="bi bi-person-badge me-2"></i>' +
        'Tapping ID User'
      );

      $('#btn-tapping-next').html(
        'Lanjutkan <i class="bi bi-arrow-right ms-1"></i>'
      );

      // Tutup modal pertama, lalu buka modal tapping.
      const firstModalEl = document.getElementById('modalKonfirmasi');
      const firstModal = bootstrap.Modal.getInstance(firstModalEl);

      if (firstModal && firstModalEl.classList.contains('show')) {
        firstModalEl.addEventListener('hidden.bs.modal', function onHidden() {
          firstModalEl.removeEventListener('hidden.bs.modal', onHidden);

          bootstrap.Modal
            .getOrCreateInstance(
              document.getElementById('modalTappingSetting'), {
                backdrop: 'static',
                keyboard: false
              }
            )
            .show();
        });

        firstModal.hide();
      } else {
        bootstrap.Modal
          .getOrCreateInstance(
            document.getElementById('modalTappingSetting'), {
              backdrop: 'static',
              keyboard: false
            }
          )
          .show();
      }
    }
    window.onBluetoothPrintCompleted = function() {
        const modal = bootstrap.Modal.getOrCreateInstance(
            document.getElementById('modalPrintResult')
        );

        modal.show();

        showSuccess('Data label berhasil dikirim ke printer Bluetooth. Periksa hasil cetaknya.');
    };

    window.onBluetoothPrintFailed = function(message) {
        console.error('Pencetakan gagal:', message);

        const modal = bootstrap.Modal.getOrCreateInstance(
            document.getElementById('modalPrintResult')
        );

        modal.show();

        showError('Pengiriman label gagal: ' + message);
    };

    // Fokus input setiap kali modal tapping selesai ditampilkan.
    // Daftarkan sekali saja, di luar fungsi showTappingSettingModal().
    $('#modalTappingSetting')
      .off('shown.bs.modal.tappingFocus')
      .on('shown.bs.modal.tappingFocus', function() {
        const tappingInput = document.getElementById('tapping-user-id');

        if (tappingInput) {
          tappingInput.focus();
        }
      });

    const tappingModalEl = document.getElementById('modalTappingSetting');

    bootstrap.Modal.getOrCreateInstance(tappingModalEl, {
      backdrop: 'static',
      keyboard: false
    });

    $('#btn-submit-barcode').on('click', function() {

      const lotSummary = getLotSummary();

      const selectedKomponen = [];

      $('.check-komponen:checked').each(function() {

        selectedKomponen.push({

          id_group: $(this).data('id-group'),

          nm_group: $(this).data('nm-group'),

          id_main_input: $(this).data('id-main-input'),

          nm_main_input: $(this).data('nm-main-input'),

          id_input_list: String(
              $(this).data('id-input-list') || ''
            )
            .split('|')
            .filter(Boolean),

          nm_input_list: String(
              $(this).data('nm-input-list') || ''
            )
            .split('|')
            .filter(Boolean),

          is_main_list: String(
              $(this).data('is-main-list') || ''
            )
            .split('|')
            .filter(Boolean),

          id_output: $(this).data('id-output'),

          nm_output: $(this).data('nm-output'),

          id_vendor: $(this).data('id-vendor'),

          nm_vendor: $(this).data('nm-vendor')

        });

      });

      const payload = {
        global: globalData,
        mode: getSelectionMode(),
        detail: getSelectionDetail(),
        plan_detail: getSelectionPlanDetail(),
        komponen: selectedKomponen
      };

      $.ajax({
        url: './../config/function.php',
        method: 'POST',
        data: {
          action: 'create-barcode',
          data: JSON.stringify(payload)
        },

        success: function(res) {
          let r;

          try {
            r = typeof res === 'object' ? res : JSON.parse(res);
          } catch (e) {
            console.error('Invalid JSON:', res);
            showError('Respons server tidak valid. Transaksi belum dapat dikonfirmasi.');
            return;
          }

          // Simpan gagal dari backend.
          if (r.status === 'error') {
            showError(r.message || 'Transaksi gagal disimpan.');
            return;
          }

          // Simpan berhasil.
          if (r.status === 'done' && Number(r.success) > 0) {
            showSuccess(
              `Konfirmasi transaksi berhasil disimpan (${r.success} data). Lanjutkan tapping ID User.`
            );

            // Beri waktu agar toast sempat terlihat sebelum modal dibuka.
            setTimeout(function() {
              showTappingSettingModal(payload.mode);
            }, 400);

            return;
          }

          // Respons valid, tetapi tidak ada transaksi yang tersimpan.
          showError('Tidak ada transaksi yang berhasil disimpan.');
        },

        error: function(xhr, status, error) {

          console.error('Tapping validation error:', error);
          console.error('Server response:', xhr.responseText);

          $message
            .removeClass('d-none alert-success alert-info')
            .addClass('alert-danger')
            .text(
              'Gagal menghubungi server. ' +
              'Silakan tap ulang kartu.'
            );

          $input.val('');
        },

      });

    });

    $(document).on('change', '.check-komponen', function() {
      const card = $(this).closest('.komponen-card');

      if ($(this).is(':checked')) {
        card.addClass('checked');
      } else {
        card.removeClass('checked');
      }

      const checked = $('.check-komponen:checked').length;

      $('#btn-submit-barcode').prop('disabled', checked === 0);
    });


    $('#btn-tapping-next').addClass('d-none');

    $('#tapping-user-id')
      .off('keydown.tappingValidation')
      .on('keydown.tappingValidation', function(e) {
        if (e.key !== 'Enter') {
          return;
        }

        e.preventDefault();

        if (tappingValidationInProgress) {
          return;
        }

        const idCard = $(this).val().trim();
        const $input = $(this);
        const $message = $('#tapping-validation-message');

        if (!idCard) {
          return;
        }


        const isFinalTapping =
          (tappingMode === 'PLAN' && tappingStage === 'USER') ||
          (tappingMode === 'CUSTOM' && tappingStage === 'LEADER');

        let printerSelectionPromise = null;

        if (isFinalTapping) {
            if (!navigator.bluetooth) {
                alert('Browser tidak mendukung Web Bluetooth. Gunakan Chrome atau Edge melalui HTTPS/localhost.');
                return;
            }

            // Dipanggil langsung saat RFID terakhir ditekan.
            printerSelectionPromise = navigator.bluetooth.requestDevice({
                acceptAllDevices: true,
                optionalServices: [
                    PRINTER_SERVICE_UUID,
                    '00001800-0000-1000-8000-00805f9b34fb',
                    '00001801-0000-1000-8000-00805f9b34fb'
                ]
            });
        }

        tappingValidationInProgress = true;
        $input.prop('disabled', true);

        $message
          .removeClass('d-none alert-success')
          .addClass('alert-info')
          .text('Memvalidasi ID Card...');

        $.ajax({
          url: './../config/function.php',
          method: 'POST',
          dataType: 'json',
          data: {
            action: 'validate-tapping',
            id_card: idCard,
            mode: tappingMode,
            stage: tappingStage
          },

          success: function(res) {
            if (res.status !== 'success') {

              $message
                .removeClass('d-none alert-success alert-info')
                .addClass('alert-danger')
                .text(res.message || 'Validasi tapping gagal.');

              $input.val('');
              return;
            }

            if (res.next_stage === 'LEADER') {
              tappingStage = 'LEADER';

              $('#modalTappingSetting label[for="tapping-user-id"]')
                .html(
                  '<i class="bi bi-person-badge-fill me-2"></i>' +
                  'Tapping ID Team Leader'
                );

              $message
                .removeClass('d-none alert-danger alert-info')
                .addClass('alert-success')
                .text(
                  'Team Member berhasil divalidasi. ' +
                  'Silakan tap kartu Team Leader.'
                );

              $input
                .val('')
                .attr(
                  'placeholder',
                  'Tap ID Card Team Leader'
                );

              return;
            }

            tappingStage = 'DONE';

            $message
              .removeClass('d-none alert-danger alert-info')
              .addClass('alert-success')
              .text('Validasi selesai. Menyiapkan label untuk dicetak...');

            $input.val('');

            // Ambil label yang siap dicetak untuk sesi ini.
            $.ajax({
              url: './../config/function.php',
              method: 'POST',
              dataType: 'json',
              data: {
                action: 'get-print-labels'
              },

              success: async function(printRes) {
                try {
                    if (printRes.status !== 'success') {
                        throw new Error(printRes.message || 'Gagal mengambil data label.');
                    }

                    const labels = printRes.labels || [];
                    if (labels.length === 0) {
                        throw new Error('Tidak ada label yang siap dicetak.');
                    }
                    pendingPrintBarcodes = [...new Map(labels.map(x => [String(x.barcode || ''), x])).values()]
                      .map(x => String(x.barcode || '')).filter(Boolean);

                    const device = await printerSelectionPromise;

                    await connectBluetoothPrinter(device);

                    console.log('Printer siap. Mulai mencetak', labels.length, 'label.');
                    await printSessionLabels(labels);
                    $('#tapping-validation-message').text('Data label berhasil dikirim ke printer. Konfirmasi hasil cetak pada dialog berikutnya.');
                } catch (error) {
                    console.error('Bluetooth printer/print error:', error);
                    window.onBluetoothPrintFailed(error.message || String(error));
                    $('#tapping-validation-message').removeClass('alert-success alert-info').addClass('alert-danger').text('Cetak Bluetooth gagal: ' + (error.message || error));
                    $('#tapping-user-id').prop('disabled', false).val('').trigger('focus');
                }
            },


              error: function(xhr, status, error) {
                console.error('Get print labels HTTP status:', xhr.status);
                console.error('AJAX status:', status);
                console.error('Error:', error);
                console.error('Response server:', xhr.responseText);

                let message = 'Gagal mengambil data label.';

                if (xhr.responseJSON && xhr.responseJSON.message) {
                  message += ' ' + xhr.responseJSON.message;
                } else if (xhr.responseText) {
                  message += ' Periksa Console untuk detail respons server.';
                }

                $message
                  .removeClass('alert-success alert-info')
                  .addClass('alert-danger')
                  .text(message);
              }

            });

          },

          error: function(xhr, status, error) {
            console.error('Tapping validation error:', error);
            console.error('Server response:', xhr.responseText);

            $message
              .removeClass('d-none alert-success alert-info')
              .addClass('alert-danger')
              .text(
                'Gagal menghubungi server. ' +
                'Silakan tap ulang kartu.'
              );

            $input.val('');
          },

          complete: function() {
            tappingValidationInProgress = false;

            if (tappingStage !== 'DONE') {
              $input.prop('disabled', false).trigger('focus');
            }
          }
        });
      });

    let pendingPrintBarcodes = [];

    function escapePrintHtml(value) {
      return String(value ?? '').replace(/[&<>"']/g, function(char) {
        return {
          '&': '&amp;',
          '<': '&lt;',
          '>': '&gt;',
          '"': '&quot;',
          "'": '&#39;'
        } [char];
      });
    }
async function submitPrintResult(status) {
      if (pendingPrintBarcodes.length === 0) {
        showError('Tidak ada barcode yang menunggu konfirmasi.');
        return;
      }

      const btnSuccess = document.getElementById('btn-print-success');
      const btnFailed = document.getElementById('btn-print-failed');
      const modalElement = document.getElementById('modalPrintResult');

      const originalSuccessText = btnSuccess.innerHTML;
      const originalFailedText = btnFailed.innerHTML;

      btnSuccess.disabled = true;
      btnFailed.disabled = true;

      const activeButton = status === 'PRINTED' ? btnSuccess : btnFailed;
      activeButton.innerHTML = 'Memproses...';

      try {
        const formData = new FormData();
        formData.append('action', 'update-print-status');
        formData.append('print_status', status);
        formData.append('barcodes', JSON.stringify(pendingPrintBarcodes));

        const response = await fetch('./../config/function.php', {
          method: 'POST',
          body: formData
        });

        const result = await response.json();

        if (!response.ok || result.status !== 'success') {
          throw new Error(
            result.message || 'Gagal memperbarui status cetak.'
          );
        }

        console.log('Hasil update status cetak:', result);

        // Tutup modal setelah backend menyatakan sukses.
        bootstrap.Modal.getOrCreateInstance(modalElement).hide();

        pendingPrintBarcodes = [];

        // Tampilkan toast sesuai status yang dipilih.
        if (status === 'PRINTED') {
          showSuccess(
            'Konfirmasi berhasil. Status barcode telah diperbarui menjadi PRINTED.'
          );
        } else {
          showError(
            'Status barcode telah diperbarui menjadi FAILED.'
          );
        }

        // Refresh setelah toast sempat terlihat.
        setTimeout(() => {
          window.location.reload();
        }, 3000);

      } catch (error) {
        console.error('Gagal menyimpan hasil cetak:', error);

        showError('Status cetak gagal diperbarui: ' + error.message);

      } finally {
        btnSuccess.disabled = false;
        btnFailed.disabled = false;

        btnSuccess.innerHTML = originalSuccessText;
        btnFailed.innerHTML = originalFailedText;
      }
    }

    document.getElementById('btn-print-success').addEventListener('click', function() {
      submitPrintResult('PRINTED');
    });

    document.getElementById('btn-print-failed').addEventListener('click', function() {
      submitPrintResult('FAILED');
    });

    // Pastikan library render label tersedia. Jika CDN utama gagal dimuat,
    // coba alamat alternatif sebelum proses cetak dibatalkan.
    function loadPrintLibrary(url, globalName) {
      return new Promise((resolve, reject) => {
        const existing = document.querySelector('script[data-print-library="' + globalName + '"]');
        if (existing && window[globalName]) { resolve(window[globalName]); return; }
        const script = document.createElement('script');
        script.src = url;
        script.async = true;
        script.dataset.printLibrary = globalName;
        script.onload = () => window[globalName]
          ? resolve(window[globalName])
          : reject(new Error(globalName + ' tidak ditemukan setelah dimuat.'));
        script.onerror = () => reject(new Error('Gagal memuat ' + globalName + ' dari ' + url));
        document.head.appendChild(script);
      });
    }

    async function ensureBarcodeLibrary() {
      let lib = window.bwipjs || window.bwipJS;
      const errors = [];
      if (!lib) {
        for (const url of [
          'https://cdn.jsdelivr.net/npm/bwip-js@4.5.1/dist/bwip-js-min.js',
          'https://unpkg.com/bwip-js@4.5.1/dist/bwip-js-min.js'
        ]) {
          try { lib = await loadPrintLibrary(url, 'bwipjs'); break; }
          catch (e) { errors.push(e.message); }
        }
      }
      lib = lib || window.bwipjs || window.bwipJS;
      if (!lib || typeof lib.toCanvas !== 'function') {
        throw new Error('Library barcode Code128 tidak tersedia. ' + errors.join(' | '));
      }
      return lib;
    }

    async function printSessionLabels(labels) {
      if (!Array.isArray(labels) || labels.length === 0) {
        throw new Error('Tidak ada label yang siap dicetak.');
      }
      const bwipjs = await ensureBarcodeLibrary();
      const uniqueLabels = [...new Map(labels.map(x => [String(x.barcode || ''), x])).values()]
        .filter(x => String(x.barcode || '').trim() !== '');
      if (!uniqueLabels.length) throw new Error('Data barcode kosong.');

      pendingPrintBarcodes = uniqueLabels.map(x => String(x.barcode));
      try {
        for (let i = 0; i < uniqueLabels.length; i++) {
          await printHybridLabel(uniqueLabels[i], bwipjs);
          // Jeda pendek antar-label agar mekanisme feed printer stabil.
          if (i < uniqueLabels.length - 1) await new Promise(resolve => setTimeout(resolve, 120));
        }
        window.onBluetoothPrintCompleted();
      } catch (error) {
        window.onBluetoothPrintFailed(error.message || String(error));
        throw error;
      }
    }

  </script>


</body>

</html>