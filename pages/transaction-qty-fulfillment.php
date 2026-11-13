<?php
// menghubungkan php dengan koneksi database
require_once __DIR__ . '/../config/function.php';
require_once __DIR__ . '/../config/auth.php';
checkAuth('qty_fulfillment'); // cek apakah sudah login dan punya akses ke menu ini

$nik = $_SESSION['nik_user'];
$username = $_SESSION['username']; // Query ringkasan per job_order

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

  .card {
    border: none !important;
    border-radius: 16px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  }

  .btn {
    border-radius: 10px !important;
    padding: 8px 18px;
  }

  /* Modal Reprint Barcode */
  #detailModal .reprint-modal {
    border: 0;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 20px 60px rgba(15, 23, 42, 0.22);
  }

  #detailModal .reprint-modal-header {
    background: #0d6efd;
    color: #fff;
    padding: 22px 26px;
    border: 0;
  }

  #detailModal .reprint-header-icon {
    width: 48px;
    height: 48px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 14px;
    background: rgba(255, 255, 255, 0.16);
    font-size: 23px;
  }

  #detailModal .reprint-modal-body {
    padding: 26px;
    background: #f8fafc;
  }

  #detailModal .summary-card {
    height: 100%;
    background: #fff;
    border: 1px solid #e7edf5;
    border-radius: 14px;
    padding: 15px 17px;
    box-shadow: 0 3px 10px rgba(15, 23, 42, 0.025);
  }

  #detailModal .summary-label {
    display: block;
    color: #7b8798;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.7px;
    text-transform: uppercase;
    margin-bottom: 7px;
  }

  #detailModal .summary-value {
    color: #243b70;
    font-weight: 700;
    overflow-wrap: anywhere;
  }

  #detailModal .reprint-status-panel {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    padding: 17px 20px;
    background: #fff8f0;
    border: 1px solid #ffe3c2;
    border-radius: 14px;
  }

  #detailModal .reprint-status-icon {
    width: 42px;
    height: 42px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #b45309;
    background: #ffedd5;
    border-radius: 12px;
    font-size: 19px;
  }

  #detailModal .reprint-count-badge {
    min-width: 76px;
    text-align: center;
    padding: 8px 12px;
    border-radius: 12px;
    background: #fee2e2;
    color: #b91c1c;
    font-weight: 800;
    font-size: 20px;
  }

  #detailModal .reprint-count-badge small {
    display: block;
    font-size: 10px;
    letter-spacing: 1px;
  }

  #detailModal .reprint-table-toolbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin-bottom: 14px;
  }

  #detailModal .btn-select-all {
    border-radius: 10px;
    font-weight: 600;
    white-space: nowrap;
  }

  #detailModal .reprint-detail-table-wrap {
    background: #fff;
    border: 1px solid #e4eaf2;
    border-radius: 14px;
    overflow-x: auto;
  }

  #detailModal .reprint-detail-table {
    min-width: 760px;
  }

  #detailModal .reprint-detail-table thead th {
    background: #eef3f9;
    color: #52627a;
    padding: 15px 12px;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.45px;
    border-bottom: 1px solid #dce5f0;
    white-space: nowrap;
  }

  #detailModal .reprint-detail-table tbody td {
    padding: 14px 12px;
    border-bottom: 1px solid #edf1f6;
    font-size: 13px;
  }

  #detailModal .reprint-detail-table tbody tr:last-child td {
    border-bottom: 0;
  }

  #detailModal .reprint-detail-table tbody tr:hover {
    background: #f5f8fd;
  }

  #detailModal .reprint-detail-table .form-check-input {
    width: 18px;
    height: 18px;
    cursor: pointer;
  }

  #detailModal .reprint-detail-table .form-check-input:checked {
    background-color: #3566a8;
    border-color: #3566a8;
  }

  #detailModal .reprint-selection-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    padding: 17px 20px;
    background: #fff;
    border: 1px solid #e4eaf2;
    border-radius: 14px;
  }

  #detailModal .selection-icon {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #3566a8;
    background: #eaf2ff;
    border-radius: 12px;
    font-size: 20px;
  }

  #detailModal .btn-reprint {
    padding: 12px 20px;
    border-radius: 10px !important;
    font-weight: 700;
    white-space: nowrap;
  }

  #detailModal .btn-reprint:disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }

  @media (max-width: 576px) {

    #detailModal .reprint-modal-header,
    #detailModal .reprint-modal-body {
      padding: 17px;
    }

    #detailModal .reprint-table-toolbar,
    #detailModal .reprint-selection-footer {
      align-items: stretch;
      flex-direction: column;
    }

    #detailModal .btn-select-all,
    #detailModal .btn-reprint {
      width: 100%;
    }
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

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">

</head>

<body>

  <!-- Header -->
  <?php
  $page = 'qty_fulfillment';
  include_once __DIR__ . '/../includes/header.php';
  ?>
  <!-- End Header -->

  <main id="main" class="main">

    <div class="pagetitle text-black" style="background-color: #f0e6d2; padding: 10px 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
      <h1 style="font-size: 1.8rem; font-weight: 700; font-family: 'Roboto', sans-serif;">
        Quantity Fulfillment
      </h1>
    </div>

    <section class="section mt-4">
      <div class="card">
        <div class="card-body pt-4">

          <div id="qtyFulfillmentAlert" class="alert alert-danger d-none"></div>

          <div class="table-responsive">

            <table id="qtyFulfillmentTable"
              class="table table-striped table-hover align-middle w-100">
              <thead>
                <tr>
                  <th>Bucket</th>
                  <th>Model</th>
                  <th>Style</th>
                  <th>NCVS</th>
                  <th>Komponen</th>
                  <th>Total Remaining</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>

          </div>

        </div>
      </div>
    </section>

    <div class="modal fade" id="detailModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content reprint-modal">

          <div class="modal-header reprint-modal-header">
            <div class="d-flex align-items-center gap-3">
              <div class="reprint-header-icon">
                <i class="bi bi-printer-fill"></i>
              </div>
              <div>
                <h5 class="modal-title mb-1">Pemenuhan Sisa Quantity</h5>
                <div class="text-white-50 small">
                  Pilih data yang masih memiliki sisa quantity.
                </div>
              </div>
            </div>
            <button type="button" class="btn-close btn-close-white"
              data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body reprint-modal-body">

            <div class="reprint-status-panel mb-4">
              <div class="d-flex align-items-center gap-3">
                <div class="reprint-status-icon">
                  <i class="bi bi-box-seam"></i>
                </div>
                <div>
                  <div class="fw-bold">Data Belum Terpenuhi</div>
                  <div class="text-secondary small">
                    Pilih lot dan komponen yang masih memiliki sisa quantity.
                  </div>
                </div>
              </div>

              <div class="reprint-count-badge">
                <span id="remainingCount">0</span>
                <small>DATA</small>
              </div>
            </div>

            <div id="detailAlert" class="alert alert-danger d-none"></div>

            <div class="reprint-table-toolbar">
              <div>
                <div class="fw-bold">Daftar Data Belum Terpenuhi :</div>
              </div>
              <button type="button" id="btnSelectAll"
                class="btn btn-outline-primary btn-select-all">
                <i class="bi bi-check2-square me-1"></i>
                Pilih Semua
              </button>
            </div>

            <div class="table-responsive reprint-detail-table-wrap">
              <table id="detailTable"
                class="table align-middle mb-0 reprint-detail-table">
                <thead>
                  <tr>
                    <th class="text-center">Pilih</th>
                    <th>Bucket</th>
                    <th>Model</th>
                    <th>Style</th>
                    <th>NCVS</th>
                    <th>Komponen</th>
                    <th>Vendor</th>
                    <th>Lot</th>
                    <th>Size</th>
                    <th>Qty Remaining</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>

            <div class="reprint-selection-footer mt-3">
              <div class="d-flex align-items-center gap-3">
                <div class="selection-icon">
                  <i class="bi bi-check2-circle"></i>
                </div>
                <div>
                  <div class="fw-bold" id="selectedCount">0 data dipilih</div>
                  <div class="text-secondary small">
                    Pastikan data yang dipilih adalah data yang akan dipenuhi kekurangan quantity nya.
                  </div>
                </div>
              </div>
              <button id="btnFulfillment"
                type="button"
                class="btn btn-primary btn-reprint"
                disabled>
                <i class="bi bi-check2-circle me-2"></i>
                Proses
              </button>
            </div>

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
              Konfirmasi Hasil Cetak Ulang Struk
            </h4>

            <p class="print-result-description">
              Apakah seluruh struk barcode berhasil tercetak ulang dengan baik?
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
  <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

  <!-- Responsive extension -->
  <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>

  <!-- Buttons extension -->
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap5.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js"></script>

  <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

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

  <script src="https://cdn.jsdelivr.net/npm/bwip-js@3.0.9/dist/bwip-js-min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>

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
      const ctx = canvas.getContext('2d', {
        willReadFrequently: true
      });
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
      for (const part of parts) {
        output.set(part, offset);
        offset += part.length;
      }
      return output;
    }

    function escPosText(value) {
      return printerTextBytes(value + '\n');
    }

    function escPosCommand(...bytes) {
      return new Uint8Array(bytes);
    }

    async function printHybridLabel(label, bwipjs) {
      const parts = [];

      const COLS = 32;

      const cmd = (...bytes) => {
        parts.push(new Uint8Array(bytes));
      };

      const text = value => {
        parts.push(
          printerTextBytes(String(value ?? '') + '\n')
        );
      };

      const clean = value => {
        return String(value ?? '')
          .replace(/\s+/g, ' ')
          .trim();
      };

      const escapeHtml = value => {
        return String(value ?? '').replace(/[&<>"']/g, char => ({
          '&': '&amp;',
          '<': '&lt;',
          '>': '&gt;',
          '"': '&quot;',
          "'": '&#39;'
        })[char]);
      };

      const formatQty = value => {
        const number = Number(value ?? 0);

        if (!Number.isFinite(number)) {
          return String(value ?? '0');
        }

        return number.toLocaleString('id-ID');
      };

      // Membungkus teks agar tidak melebihi lebar printer.
      const wrapText = (value, maxLength = COLS) => {
        const normalized = clean(value);

        if (!normalized) return [];

        const words = normalized.split(' ');
        const lines = [];
        let line = '';

        words.forEach(word => {
          if (word.length > maxLength) {
            if (line) {
              lines.push(line);
              line = '';
            }

            for (let i = 0; i < word.length; i += maxLength) {
              lines.push(word.slice(i, i + maxLength));
            }

            return;
          }

          const candidate = line ?
            `${line} ${word}` :
            word;

          if (candidate.length <= maxLength) {
            line = candidate;
          } else {
            if (line) lines.push(line);
            line = word;
          }
        });

        if (line) lines.push(line);

        return lines;
      };

      // Informasi dengan format LABEL : VALUE.
      const printInfo = (labelText, value) => {
        const prefix = `${labelText} : `;
        const available = COLS - prefix.length;

        const lines = wrapText(value, available);

        if (!lines.length) {
          text(prefix);
          return;
        }

        text(prefix + lines[0]);

        const indent = ' '.repeat(prefix.length);

        lines.slice(1).forEach(line => {
          text(indent + line);
        });
      };

      // Garis separator menggunakan Font A.
      const separator = () => {
        cmd(0x1B, 0x4D, 0x00); // Font A
        cmd(0x1B, 0x21, 0x00);
        cmd(0x1B, 0x45, 0x00);
        cmd(0x1B, 0x61, 0x00);

        text('-'.repeat(COLS));
      };

      // =====================================================
      // 1. HEADER
      // =====================================================

      const header = document.createElement('div');

      header.style.cssText = `
        position: fixed;
        left: -10000px;
        top: 0;
        width: 384px;
        box-sizing: border-box;
        padding: 6px 12px;
        background: #ffffff;
        color: #000000;
        font-family: Arial, sans-serif;
    `;

      header.innerHTML = `
        <div style="
            display: grid;
            grid-template-columns: 1fr 1fr;
            text-align: center;
            border-bottom: 1px dashed #000;
        ">
            <div style="
                padding: 4px 2px;
                border-right: 1px dashed #000;
            ">
                <div style="
                    font-size: 17px;
                    font-weight: 700;
                ">
                    SIZE
                </div>

                <div style="
                    font-size: 42px;
                    font-weight: 700;
                    line-height: 1.1;
                ">
                    ${escapeHtml(label.size || '-')}
                </div>
            </div>

            <div style="padding: 4px 2px;">
                <div style="
                    font-size: 17px;
                    font-weight: 700;
                ">
                    QUANTITY
                </div>

                <div style="
                    font-size: 42px;
                    font-weight: 700;
                    line-height: 1.1;
                ">
                    ${escapeHtml(formatQty(label.total_qty))}
                </div>
            </div>
        </div>
    `;

      document.body.appendChild(header);

      try {
        if (document.fonts && document.fonts.ready) {
          await document.fonts.ready;
        }

        const headerCanvas = await html2canvas(header, {
          backgroundColor: '#ffffff',
          scale: 2,
          logging: false,
          useCORS: true
        });

        // Printer initialization.
        cmd(0x1B, 0x40);
        cmd(0x1B, 0x61, 0x00);
        cmd(0x1B, 0x4D, 0x00);
        cmd(0x1B, 0x21, 0x00);
        cmd(0x1B, 0x45, 0x00);
        cmd(0x1B, 0x33, 0x18);

        parts.push(barcodeCanvasToEscPos(headerCanvas));

      } finally {
        header.remove();
      }

      // =====================================================
      // 2. BODY
      // =====================================================

      // Reset konfigurasi printer untuk body.
      cmd(0x1B, 0x61, 0x00);
      cmd(0x1B, 0x4D, 0x00);
      cmd(0x1B, 0x21, 0x00);
      cmd(0x1B, 0x45, 0x00);
      cmd(0x1B, 0x33, 0x20);

      // Informasi produk.
      const bucket = clean(label.bucket);
      const ncvs = clean(label.ncvs);

      // Bucket - NCVS
      text([bucket, ncvs].filter(Boolean).join(' - ') || '-');

      // Model
      text(label.model || '-');

      // Style
      text(label.style || '-');

      // Total Order.
      printInfo(
        'Total Order',
        formatQty(label.total_qty_order ?? 0)
      );

      // Lot dan Vendor.
      const lot = clean(label.lot_range);
      const vendor = clean(label.nm_vendor);

      const lotVendor = [
        lot ? `LOT : ${lot}` : '',
        vendor ? vendor : ''
      ].filter(Boolean).join(' | ');

      if (lotVendor) {
        wrapText(lotVendor).forEach(line => text(line));
      }

      separator();

      // =====================================================
      // 3. MAIN COMPONENT
      // =====================================================

      const mainComponent = clean(
        label.nm_main_input ||
        label.main_component ||
        label.main_component_name ||
        label.nm_group ||
        ''
      );

      // Main Component dicetak tebal.
      cmd(0x1B, 0x4D, 0x00);
      cmd(0x1B, 0x21, 0x00);
      cmd(0x1B, 0x45, 0x01);
      cmd(0x1B, 0x61, 0x00);

      if (mainComponent) {
        wrapText(mainComponent).forEach(line => {
          text(line);
        });
      } else {
        text('-');
      }

      // Kembalikan font normal.
      cmd(0x1B, 0x45, 0x00);

      separator();

      // =====================================================
      // 4. GROUP COMPONENTS
      // =====================================================

      const components = Array.isArray(label.group_components) ?
        label.group_components : [];

      cmd(0x1B, 0x4D, 0x00);
      cmd(0x1B, 0x21, 0x00);
      cmd(0x1B, 0x45, 0x00);
      cmd(0x1B, 0x61, 0x00);

      if (components.length > 0) {
        components.forEach(component => {
          const componentName = clean(
            typeof component === 'object' ?
            (
              component.nm_komponen_in ||
              component.name ||
              component.nama ||
              ''
            ) :
            component
          );

          if (!componentName) return;

          wrapText(componentName).forEach(line => {
            text(line);
          });
        });
      } else {
        text('-');
      }

      separator();

      // =====================================================
      // 5. FOOTER - BARCODE CODE128
      // =====================================================

      const barcodeCanvas = document.createElement('canvas');

      bwipjs.toCanvas(barcodeCanvas, {
        bcid: 'code128',
        text: String(label.barcode ?? ''),
        scale: 2,
        height: 8,
        includetext: false,
        backgroundcolor: 'FFFFFF'
      });

      // Barcode rata tengah.
      cmd(0x1B, 0x61, 0x01);

      parts.push(barcodeCanvasToEscPos(barcodeCanvas));

      // Nomor barcode menggunakan Font B.
      cmd(0x1B, 0x4D, 0x01);
      cmd(0x1B, 0x21, 0x00);
      cmd(0x1B, 0x45, 0x00);

      text(String(label.barcode ?? ''));

      // Reset printer.
      cmd(0x1B, 0x61, 0x00);
      cmd(0x1B, 0x32);

      text('');

      // =====================================================
      // 6. SEND TO PRINTER
      // =====================================================

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
    let fulfillmentPrinterReady = false;

    async function selectAndConnectFulfillmentPrinter() {
      if (!navigator.bluetooth) {
        throw new Error('Browser ini tidak mendukung Bluetooth Web. Gunakan Chrome/Edge melalui HTTPS atau localhost.');
      }
      const device = await navigator.bluetooth.requestDevice({
        acceptAllDevices: true,
        optionalServices: [PRINTER_SERVICE_UUID]
      });
      await connectBluetoothPrinter(device);
      fulfillmentPrinterReady = true;
      return device;
    }

    function loadPrintLibrary(url, globalName) {
      return new Promise((resolve, reject) => {
        const existing = document.querySelector('script[data-print-library="' + globalName + '"]');
        if (existing && (window[globalName] || window.bwipJS)) {
          resolve(window[globalName] || window.bwipJS);
          return;
        }
        const script = document.createElement('script');
        script.src = url;
        script.async = true;
        script.dataset.printLibrary = globalName;
        script.onload = () => (window[globalName] || window.bwipJS) ? resolve(window[globalName] || window.bwipJS) : reject(new Error(globalName + ' tidak ditemukan setelah dimuat.'));
        script.onerror = () => reject(new Error('Gagal memuat library cetak.'));
        document.head.appendChild(script);
      });
    }

    async function ensureFulfillmentBarcodeLibrary() {
      let lib = window.bwipjs || window.bwipJS;
      if (!lib) {
        const urls = ['https://cdn.jsdelivr.net/npm/bwip-js@4.5.1/dist/bwip-js-min.js', 'https://unpkg.com/bwip-js@4.5.1/dist/bwip-js-min.js'];
        for (const url of urls) {
          try {
            lib = await loadPrintLibrary(url, 'bwipjs');
            break;
          } catch (e) {}
        }
      }
      if (!lib || typeof lib.toCanvas !== 'function') throw new Error('Library barcode Code128 tidak tersedia.');
      return lib;
    }

    async function printFulfillmentLabels(labels) {
      if (!Array.isArray(labels) || labels.length === 0) throw new Error('Data berhasil disimpan, tetapi server tidak mengirim result.labels untuk dicetak.');
      if (!printerCharacteristic) throw new Error('Printer Bluetooth belum terhubung.');
      const lib = await ensureFulfillmentBarcodeLibrary();
      const uniqueLabels = [...new Map(labels.filter(x => x && String(x.barcode || '').trim()).map(x => [String(x.barcode), x])).values()];
      if (!uniqueLabels.length) throw new Error('Data label tidak memiliki nilai barcode.');
      for (let i = 0; i < uniqueLabels.length; i++) {
        await printHybridLabel(uniqueLabels[i], lib);
        if (i < uniqueLabels.length - 1) await new Promise(resolve => setTimeout(resolve, 120));
      }
      return uniqueLabels.length;
    }

    $(function() {
      const apiUrl = './../config/get-data-qty-fulfillment.php';
      const alertBox = document.getElementById('qtyFulfillmentAlert');

      let currentRows = [];
      const selectedIds = new Set();
      let pendingFulfillmentBarcodes = [];

      const detailModalEl = document.getElementById('detailModal');
      const printResultModalEl = document.getElementById('modalPrintResult');

      function showPrintResultModal(message = '') {
        const description = printResultModalEl.querySelector(
          '.print-result-description'
        );

        if (description) {
          description.textContent = message ||
            'Apakah seluruh label barcode berhasil tercetak dengan baik?';
        }

        const detailModalInstance =
          bootstrap.Modal.getOrCreateInstance(detailModalEl);

        const resultModalInstance =
          bootstrap.Modal.getOrCreateInstance(printResultModalEl);

        // Tutup detail terlebih dahulu agar Bootstrap tidak bentrok
        // ketika menampilkan modal hasil cetak.
        if (detailModalEl.classList.contains('show')) {
          detailModalEl.addEventListener(
            'hidden.bs.modal',
            function() {
              resultModalInstance.show();
            }, {
              once: true
            }
          );

          detailModalInstance.hide();
        } else {
          resultModalInstance.show();
        }
      }

      function showAlert(message) {
        alertBox.textContent = message;
        alertBox.classList.remove('d-none');
      }

      function hideAlert() {
        alertBox.textContent = '';
        alertBox.classList.add('d-none');
      }

      function escapeHtml(value) {
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

      async function postData(data) {
        const response = await fetch(apiUrl, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
          },
          body: new URLSearchParams(data)
        });

        const result = await response.json();

        if (!response.ok || result.status !== 'success') {
          throw new Error(
            result.message || 'Gagal mengambil data Quantity Fulfillment.'
          );
        }

        return result;
      }

      // =====================================================
      // 1. LISTING QUANTITY FULFILLMENT
      // =====================================================

      const fulfillmentTable = $('#qtyFulfillmentTable').DataTable({
        processing: true,
        serverSide: true,
        pageLength: 20,
        lengthMenu: [10, 20, 50, 100],
        searching: true,
        searchDelay: 350,
        order: [],

        ajax: async function(request, callback) {
          try {
            hideAlert();

            const result = await postData({
              action: 'list',
              search: request.search.value,
              start: request.start,
              length: request.length
            });

            callback({
              draw: request.draw,
              recordsTotal: result.recordsTotal,
              recordsFiltered: result.recordsFiltered,
              data: result.data
            });
          } catch (error) {
            showAlert(error.message);

            callback({
              draw: request.draw,
              recordsTotal: 0,
              recordsFiltered: 0,
              data: []
            });
          }
        },

        columns: [{
            data: 'bucket'
          },
          {
            data: 'model'
          },
          {
            data: 'style'
          },
          {
            data: 'ncvs'
          },
          {
            data: 'main_component',
            render: function(data) {
              return escapeHtml(data || '-');
            }
          },
          {
            data: 'total_remaining',
            className: 'fw-bold',
            render: function(data) {
              return Number(data || 0).toLocaleString('id-ID');
            }
          },
          {
            data: null,
            orderable: false,
            searchable: false,
            className: 'text-center',
            render: function() {
              return `
              <button type="button"
                class="btn btn-sm btn-outline-primary btn-detail"
                title="Lihat detail">
                <i class="bi bi-eye"></i>
              </button>`;
            }
          }
        ],

        language: {
          search: 'Cari data:',
          lengthMenu: 'Show _MENU_ Entries',
          info: 'Showing _START_ to _END_ of _TOTAL_ entries',
          infoEmpty: 'Tidak ada data',
          zeroRecords: 'Tidak ada data.',
          processing: 'Memuat data...',
          paginate: {
            previous: 'Previous',
            next: 'Next'
          }
        }
      });

      // =====================================================
      // 2. BUKA MODAL DETAIL
      // =====================================================

      $('#qtyFulfillmentTable tbody').on(
        'click',
        '.btn-detail',
        async function() {
          const row = fulfillmentTable.row($(this).closest('tr')).data();

          if (!row) return;

          currentRows = [];
          selectedIds.clear();

          $('#detailAlert').addClass('d-none').text('');
          $('#detailTable tbody').html(
            '<tr><td colspan="11" class="text-center py-4">' +
            'Memuat detail...</td></tr>'
          );

          $('#remainingCount').text('0');
          $('#selectedCount').text('0 data dipilih');
          $('#btnFulfillment').prop('disabled', true);
          $('#btnSelectAll').prop('disabled', true);

          bootstrap.Modal.getOrCreateInstance(
            document.getElementById('detailModal')
          ).show();

          try {
            const result = await postData({
              action: 'detail',
              bucket: row.bucket,
              model: row.model,
              style: row.style,
              ncvs: row.ncvs,
              main_component: row.main_component

            });

            currentRows = result.data || [];
            renderFulfillmentDetail();
          } catch (error) {
            $('#detailTable tbody').html(
              '<tr><td colspan="11" class="text-center py-4">' +
              'Gagal memuat detail.</td></tr>'
            );

            $('#detailAlert')
              .text(error.message)
              .removeClass('d-none');
          }
        }
      );

      // =====================================================
      // 3. TAMPILKAN DETAIL
      // =====================================================

      function renderFulfillmentDetail() {
        const tbody = $('#detailTable tbody');

        tbody.empty();
        $('#remainingCount').text(currentRows.length);

        if (currentRows.length === 0) {
          tbody.html(
            '<tr><td colspan="11" class="text-center py-5">' +
            'Tidak ada data dengan sisa quantity.</td></tr>'
          );

          updateFulfillmentSelection();
          return;
        }

        currentRows.forEach(function(row) {
          const id = String(row.id_trans);
          const checked = selectedIds.has(id) ? 'checked' : '';

          tbody.append(`
          <tr>
            <td class="text-center">
              <input type="checkbox"
                class="form-check-input row-check"
                value="${escapeHtml(id)}"
                ${checked}>
            </td>
            <td>${escapeHtml(row.bucket)}</td>
            <td>${escapeHtml(row.model)}</td>
            <td>${escapeHtml(row.style)}</td>
            <td>${escapeHtml(row.ncvs)}</td>
            <td>${escapeHtml(row.komponen)}</td>
            <td>${escapeHtml(row.nm_vendor)}</td>
            <td>${escapeHtml(row.lot)}</td>
            <td>${escapeHtml(row.size)}</td>
            <td class="text-end fw-bold">
              ${escapeHtml(row.qty_remaining)}
            </td>
            <td>
              <span class="badge rounded-pill bg-warning-subtle
                text-warning-emphasis border border-warning-subtle px-3 py-2">
                Belum terpenuhi
              </span>
            </td>
          </tr>
        `);
        });

        updateFulfillmentSelection();
      }

      // =====================================================
      // 4. KELOLA PILIHAN DATA
      // =====================================================

      function updateFulfillmentSelection() {
        const selectedCount = selectedIds.size;
        const totalCount = currentRows.length;
        const allSelected =
          totalCount > 0 && selectedCount === totalCount;

        $('#selectedCount').text(
          `${selectedCount} dari ${totalCount} data dipilih`
        );

        $('#btnFulfillment').prop('disabled', selectedCount === 0);
        $('#btnSelectAll').prop('disabled', totalCount === 0);

        $('#btnSelectAll').html(
          allSelected ?
          '<i class="bi bi-square me-1"></i> Batalkan' :
          '<i class="bi bi-check2-square me-1"></i> Pilih Semua'
        );
      }

      $('#detailTable tbody')
        .on('change', '.row-check', function() {
          const id = String(this.value);

          if (this.checked) {
            selectedIds.add(id);
          } else {
            selectedIds.delete(id);
          }

          updateFulfillmentSelection();
        });

      $('#btnSelectAll').on('click', function() {
        const allSelected =
          currentRows.length > 0 &&
          currentRows.every(row => selectedIds.has(String(row.id_trans)));

        if (allSelected) {
          selectedIds.clear();
        } else {
          currentRows.forEach(row => {
            selectedIds.add(String(row.id_trans));
          });
        }

        renderFulfillmentDetail();
      });

      // =====================================================
      // 5. SIMPAN QUANTITY FULFILLMENT
      // =====================================================

      $('#btnFulfillment').on('click', async function() {
        if (selectedIds.size === 0) {
          $('#detailAlert')
            .text('Pilih minimal satu data untuk disimpan.')
            .removeClass('d-none');
          return;
        }

        const button = this;
        const originalHtml = button.innerHTML;
        const ids = Array.from(selectedIds);

        hideAlert();
        $('#detailAlert').addClass('d-none').text('');

        button.disabled = true;

        try {
          // 1. Hubungkan printer dari aksi langsung pengguna.
          button.innerHTML = `
      <span class="spinner-border spinner-border-sm me-2"></span>
      Menghubungkan printer...
    `;

          await selectAndConnectFulfillmentPrinter();

          // 2. Simpan data ke backend.
          button.innerHTML = `
      <span class="spinner-border spinner-border-sm me-2"></span>
      Menyimpan...
    `;

          const response = await fetch('./../config/function.php', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
            },
            body: new URLSearchParams({
              action: 'save-qty-fulfillment',
              ids: JSON.stringify(ids)
            })
          });

          const result = await response.json();

          if (!response.ok || result.status !== 'success') {
            throw new Error(
              result.message || 'Gagal menyimpan Quantity Fulfillment.'
            );
          }

          console.log('Hasil penyimpanan fulfillment:', result);

          // Simpan barcode untuk proses konfirmasi status cetak.
          pendingFulfillmentBarcodes = result.barcodes || [];

          if (pendingFulfillmentBarcodes.length === 0) {
            throw new Error(
              'Data berhasil disimpan, tetapi daftar barcode tidak tersedia.'
            );
          }

          // 3. Cetak label. detailModal TIDAK ditutup.
          button.innerHTML = `
      <span class="spinner-border spinner-border-sm me-2"></span>
      Mencetak label...
    `;

          try {
            const printedCount = await printFulfillmentLabels(
              result.labels || []
            );

            // 4. Semua data cetak berhasil dikirim ke printer.
            showPrintResultModal(
              `${printedCount} label telah dikirim ke printer. Apakah seluruh label barcode berhasil tercetak dengan baik?`
            );

          } catch (printError) {
            console.error('Proses cetak gagal:', printError);

            // Data database sudah tersimpan.
            // User tetap harus mengonfirmasi status cetak.
            showPrintResultModal(
              `Terjadi kendala saat proses cetak: ${printError.message || printError}. Silakan periksa hasil cetak sebelum memilih status.`
            );
          }

        } catch (error) {
          console.error('Gagal memproses fulfillment:', error);

          // Error koneksi Bluetooth atau penyimpanan.
          // detailModal tetap terbuka.
          $('#detailAlert')
            .text(error.message || 'Terjadi kesalahan saat memproses data.')
            .removeClass('d-none');

        } finally {
          button.innerHTML = originalHtml;
          button.disabled = selectedIds.size === 0;
        }
      });

      async function updateFulfillmentPrintStatus(printStatus) {
        if (pendingFulfillmentBarcodes.length === 0) {
          showError('Daftar barcode fulfillment tidak tersedia.');
          return;
        }

        const successButton = $('#btn-print-success');
        const failedButton = $('#btn-print-failed');

        successButton.prop('disabled', true);
        failedButton.prop('disabled', true);

        const originalSuccessHtml = successButton.html();
        const originalFailedHtml = failedButton.html();

        const selectedButton = printStatus === 'PRINTED' ?
          successButton :
          failedButton;

        selectedButton.html(`
    <span class="spinner-border spinner-border-sm me-1"></span>
    Menyimpan...
  `);

        try {
          const response = await fetch('./../config/function.php', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
            },
            body: new URLSearchParams({
              action: 'update-print-status-fulfillment',
              print_status: printStatus,
              barcodes: JSON.stringify(pendingFulfillmentBarcodes)
            })
          });

          const result = await response.json();

          if (!response.ok || result.status !== 'success') {
            throw new Error(
              result.message || 'Gagal memperbarui status cetak.'
            );
          }

          console.log('Update status fulfillment:', result);

          // Tutup modal hasil cetak setelah update backend berhasil.
          bootstrap.Modal.getOrCreateInstance(
            printResultModalEl
          ).hide();

          // Refresh tabel setelah status berhasil diperbarui.
          fulfillmentTable.ajax.reload(null, false);

          pendingFulfillmentBarcodes = [];

          showSuccess(result.message);

        } catch (error) {
          console.error('Update status cetak gagal:', error);
          showError(error.message || 'Gagal memperbarui status cetak.');

        } finally {
          successButton.html(originalSuccessHtml);
          failedButton.html(originalFailedHtml);

          successButton.prop('disabled', false);
          failedButton.prop('disabled', false);
        }
      }

      $('#btn-print-success').on('click', function() {
        updateFulfillmentPrintStatus('PRINTED');
      });

      $('#btn-print-failed').on('click', function() {
        updateFulfillmentPrintStatus('FAILED');
      });

    });
  </script>

</body>

</html>