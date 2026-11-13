<?php
// menghubungkan php dengan koneksi database
require_once __DIR__ . '/../config/function.php';
require_once __DIR__ . '/../config/auth.php';
checkAuth('reprint-barcode'); // cek apakah sudah login dan punya akses ke menu ini

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

  <title>iSubcont - Reports</title>
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
  $page = 'reprint-barcode';
  include_once __DIR__ . '/../includes/header.php';
  ?>
  <!-- End Header -->

  <main id="main" class="main">

    <div class="pagetitle text-black" style="background-color: #f0e6d2; padding: 10px 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
      <h1 style="font-size: 1.8rem; font-weight: 700; font-family: 'Roboto', sans-serif;">
        Cetak Ulang Struk Barcode
      </h1>
    </div>

    <section class="section mt-4">
      <div class="card">
        <div class="card-body pt-4">
          <div id="reprintAlert" class="alert alert-danger d-none"></div>

          <div class="table-responsive">
            <table id="reprintTable"
              class="table table-striped table-hover align-middle w-100">
              <thead>
                <tr>
                  <th>Bucket</th>
                  <th>Model</th>
                  <th>Style</th>
                  <th>NCVS</th>
                  <th>Komponen</th>
                  <th>Total Failed</th>
                  <th>Status</th>
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
                <h5 class="modal-title mb-1">Cetak Ulang Barcode</h5>
                <div class="text-white-50 small">
                  Pilih barcode yang ingin dicetak ulang.
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
                  <i class="bi bi-exclamation-triangle-fill"></i>
                </div>
                <div>
                  <div class="fw-bold">Barcode gagal dicetak</div>
                  <div class="text-secondary small">
                    Pilih barcode yang ingin dicetak ulang.
                  </div>
                </div>
              </div>
              <div class="reprint-count-badge">
                <span id="failedCount">0</span>
                <small>FAILED</small>
              </div>
            </div>

            <div id="detailAlert" class="alert alert-danger d-none"></div>

            <div class="reprint-table-toolbar">
              <div>
                <div class="fw-bold">Daftar Barcode</div>
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
                    <th>Total Qty</th>
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
                  <div class="fw-bold" id="selectedCount">0 barcode dipilih</div>
                  <div class="text-secondary small">
                    Pastikan pilihan sudah sesuai sebelum mencetak ulang barcode.
                  </div>
                </div>
              </div>
              <button id="btnReprint" class="btn btn-primary btn-reprint" disabled>
                <i class="bi bi-printer-fill me-2"></i>
                Cetak Ulang Barcode
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

  <script>
    $(function() {
      const apiUrl = './../config/get-data-reprint-struk.php';
      const alertBox = document.getElementById('reprintAlert');
      const detailAlert = document.getElementById('detailAlert');

      let currentGroup = null;
      let selectedIds = new Set();
      let currentRows = [];

      function getIdentityConfig() {
        const isGlobalBarcode =
          currentGroup?.last_gate === 'IN_SM_SUBCONT';

        return {
          type: isGlobalBarcode ? 'global_barcode' : 'barcode',
          label: isGlobalBarcode ? 'Global Barcode' : 'Barcode'
        };
      }

      function getRowIdentity(row) {
        const config = getIdentityConfig();

        return String(
          row.identity_value ?? row[config.type] ?? ''
        );
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

      function showAlert(element, message) {
        element.textContent = message;
        element.classList.remove('d-none');
      }

      function hideAlert(element) {
        element.textContent = '';
        element.classList.add('d-none');
      }

      async function postData(data) {
        const body = new URLSearchParams(data);
        const response = await fetch(apiUrl, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
          },
          body
        });

        const result = await response.json();

        if (!response.ok || result.status !== 'success') {
          throw new Error(result.message || 'Permintaan gagal.');
        }

        return result;
      }

      async function postReprintData(data) {
        const response = await fetch('./../config/function.php', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
          },
          body: new URLSearchParams(data)
        });

        const result = await response.json();

        if (!response.ok || result.status !== 'success') {
          throw new Error(result.message || 'Permintaan cetak ulang gagal.');
        }

        return result;
      }


      // ==========================================
      // STAGE 5 - BLUETOOTH PRINTER INFRASTRUCTURE
      // ==========================================

      let printerDevice = null;
      let printerServer = null;
      let printerCharacteristic = null;

      const PRINTER_SERVICE_UUID =
        '000018f0-0000-1000-8000-00805f9b34fb';

      const PRINTER_CHARACTERISTIC_UUID =
        '00002af1-0000-1000-8000-00805f9b34fb';

      // ------------------------------------------
      // 1. Load external library
      // ------------------------------------------

      function loadPrintLibrary(url, globalName) {
        return new Promise((resolve, reject) => {
          if (window[globalName]) {
            resolve(window[globalName]);
            return;
          }

          const existingScript = document.querySelector(
            `script[data-print-library="${globalName}"]`
          );

          if (existingScript) {
            existingScript.addEventListener('load', () => {
              if (window[globalName]) {
                resolve(window[globalName]);
              } else {
                reject(new Error(`${globalName} gagal dimuat.`));
              }
            }, {
              once: true
            });

            existingScript.addEventListener('error', () => {
              reject(new Error(`Gagal memuat ${globalName}.`));
            }, {
              once: true
            });

            return;
          }

          const script = document.createElement('script');
          script.src = url;
          script.async = true;
          script.dataset.printLibrary = globalName;

          script.onload = () => {
            if (window[globalName]) {
              resolve(window[globalName]);
            } else {
              reject(new Error(`${globalName} tidak tersedia.`));
            }
          };

          script.onerror = () => {
            reject(new Error(`Gagal memuat ${globalName}.`));
          };

          document.head.appendChild(script);
        });
      }

      async function ensurePrintLibraries() {
        const bwipjs =
          window.bwipjs || window.bwipJS ||
          await loadPrintLibrary(
            'https://cdn.jsdelivr.net/npm/bwip-js@4.5.1/dist/bwip-js-min.js',
            'bwipjs'
          );

        const html2canvas = window.html2canvas ||
          await loadPrintLibrary(
            'https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js',
            'html2canvas'
          );

        if (typeof bwipjs.toCanvas !== 'function') {
          throw new Error('Library bwip-js tidak valid.');
        }

        if (typeof html2canvas !== 'function') {
          throw new Error('Library html2canvas tidak valid.');
        }

        return {
          bwipjs,
          html2canvas
        };
      }

      // ------------------------------------------
      // 2. Bluetooth connection
      // ------------------------------------------

      async function connectReprintPrinter(device) {
        printerDevice = device;

        printerServer = await device.gatt.connect();

        const service = await printerServer.getPrimaryService(
          PRINTER_SERVICE_UUID
        );

        printerCharacteristic = await service.getCharacteristic(
          PRINTER_CHARACTERISTIC_UUID
        );

        const properties = printerCharacteristic.properties;

        if (
          !properties.write &&
          !properties.writeWithoutResponse
        ) {
          throw new Error(
            'Printer tidak mendukung Bluetooth write.'
          );
        }

        return device;
      }

      async function selectAndConnectReprintPrinter() {
        if (!navigator.bluetooth) {
          throw new Error(
            'Browser tidak mendukung Web Bluetooth. Gunakan Chrome/Edge melalui HTTPS atau localhost.'
          );
        }

        const device = await navigator.bluetooth.requestDevice({
          acceptAllDevices: true,
          optionalServices: [PRINTER_SERVICE_UUID]
        });

        await connectReprintPrinter(device);

        return device;
      }

      // ------------------------------------------
      // 3. Send data to Bluetooth printer
      // ------------------------------------------

      async function sendBluetoothData(data) {
        if (!printerCharacteristic) {
          throw new Error('Printer Bluetooth belum terhubung.');
        }

        const chunkSize = 20;

        for (let i = 0; i < data.length; i += chunkSize) {
          const chunk = data.slice(i, i + chunkSize);

          if (
            printerCharacteristic.properties.writeWithoutResponse
          ) {
            await printerCharacteristic.writeValueWithoutResponse(
              chunk
            );
          } else {
            await printerCharacteristic.writeValueWithResponse(
              chunk
            );
          }

          await new Promise(resolve => setTimeout(resolve, 15));
        }
      }

      // ------------------------------------------
      // 4. ESC/POS byte helpers
      // ------------------------------------------

      function printerTextBytes(value) {
        const normalized = String(value ?? '')
          .normalize('NFD')
          .replace(/[\u0300-\u036f]/g, '')
          .replace(/[–—]/g, '-')
          .replace(/[“”]/g, '"')
          .replace(/[‘’]/g, "'")
          .replace(/[^\x00-\x7F]/g, '?');

        return new TextEncoder().encode(normalized);
      }

      function concatPrintBytes(parts) {
        const arrays = parts.map(part =>
          part instanceof Uint8Array ?
          part :
          new Uint8Array(part)
        );

        const totalLength = arrays.reduce(
          (total, part) => total + part.length,
          0
        );

        const result = new Uint8Array(totalLength);

        let offset = 0;

        arrays.forEach(part => {
          result.set(part, offset);
          offset += part.length;
        });

        return result;
      }

      function escPosCommand(...bytes) {
        return new Uint8Array(bytes);
      }

      function escPosText(value) {
        return printerTextBytes(value);
      }

      // ------------------------------------------
      // 5. Canvas to ESC/POS raster
      // ------------------------------------------

      function barcodeCanvasToEscPos(sourceCanvas) {
        const printWidth = 384;

        if (!sourceCanvas || !sourceCanvas.width) {
          throw new Error('Canvas barcode tidak valid.');
        }

        const printHeight = Math.ceil(
          sourceCanvas.height * printWidth / sourceCanvas.width
        );

        if (printHeight > 65535) {
          throw new Error('Ukuran gambar melebihi batas printer.');
        }

        const canvas = document.createElement('canvas');
        canvas.width = printWidth;
        canvas.height = printHeight;

        const ctx = canvas.getContext('2d', {
          willReadFrequently: true
        });

        ctx.fillStyle = '#FFFFFF';
        ctx.fillRect(0, 0, printWidth, printHeight);

        ctx.drawImage(
          sourceCanvas,
          0,
          0,
          printWidth,
          printHeight
        );

        const imageData = ctx.getImageData(
          0,
          0,
          printWidth,
          printHeight
        );

        const widthBytes = Math.ceil(printWidth / 8);
        const raster = new Uint8Array(
          widthBytes * printHeight
        );

        for (let y = 0; y < printHeight; y++) {
          for (let x = 0; x < printWidth; x++) {
            const index = (y * printWidth + x) * 4;

            const gray =
              imageData.data[index] * 0.299 +
              imageData.data[index + 1] * 0.587 +
              imageData.data[index + 2] * 0.114;

            if (gray < 160) {
              const byteIndex =
                y * widthBytes + Math.floor(x / 8);

              raster[byteIndex] |=
                0x80 >> (x % 8);
            }
          }
        }

        const xL = widthBytes & 0xFF;
        const xH = (widthBytes >> 8) & 0xFF;
        const yL = printHeight & 0xFF;
        const yH = (printHeight >> 8) & 0xFF;

        return concatPrintBytes([
          escPosCommand(
            0x1D, 0x76, 0x30, 0x00,
            xL, xH, yL, yH
          ),
          raster
        ]);
      }

      // ==========================================
      // STAGE 5 - HYBRID LABEL RENDERER
      // Layout mengikuti Create Barcode
      // ==========================================

      // ------------------------------------------
      // 1. TEXT WRAPPING - 32 CHARACTERS
      // ------------------------------------------

      function wrapPrinterText(value, maxLength = 32) {
        const normalized = String(value ?? '')
          .replace(/\s+/g, ' ')
          .trim();

        if (!normalized) return [];

        const words = normalized.split(' ');
        const lines = [];
        let line = '';

        words.forEach(word => {
          // Pecah kata yang lebih panjang dari lebar printer.
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
      }


      // ------------------------------------------
      // 2. GENERATE HEADER CANVAS
      // ------------------------------------------

      async function createReprintHeaderCanvas(
        label,
        identityType,
        html2canvas
      ) {
        const isGlobalBarcode = identityType === 'global_barcode';

        const size = String(label.size ?? '-').trim() || '-';

        const quantity = String(label.total_qty ?? '0').trim() || '0';

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

        if (isGlobalBarcode) {

          // GLOBAL BARCODE:
          // Hanya menampilkan QUANTITY.

          header.innerHTML = `
            <div style="
                text-align: center;
                border-bottom: 1px dashed #000;
                padding: 4px 2px 8px;
            ">
                <div style="
                    font-size: 17px;
                    font-weight: 700;
                ">
                    TOTAL QUANTITY
                </div>

                <div style="
                    font-size: 42px;
                    font-weight: 700;
                    line-height: 1.1;
                ">
                    ${escapePrintHtml(quantity)}
                </div>
            </div>
        `;

        } else {

          // BARCODE:
          // SIZE dan QUANTITY dalam dua kolom.

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
                        ${escapePrintHtml(size)}
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
                        ${escapePrintHtml(quantity)}
                    </div>
                </div>
            </div>
        `;
        }

        document.body.appendChild(header);

        try {
          if (document.fonts && document.fonts.ready) {
            await document.fonts.ready;
          }

          return await html2canvas(header, {
            backgroundColor: '#ffffff',
            scale: 2,
            logging: false,
            useCORS: true
          });

        } finally {
          header.remove();
        }
      }


      // ------------------------------------------
      // 3. GENERATE CODE128 CANVAS
      // ------------------------------------------

      function createReprintBarcodeCanvas(identityValue, bwipjs) {
        const barcodeCanvas = document.createElement('canvas');

        bwipjs.toCanvas(barcodeCanvas, {
          bcid: 'code128',
          text: String(identityValue),
          scale: 2,
          height: 8,
          includetext: false,
          backgroundcolor: 'FFFFFF'
        });

        return barcodeCanvas;
      }


      // ------------------------------------------
      // 4. BUILD COMPLETE ESC/POS LABEL
      // ------------------------------------------

      async function buildReprintLabelBytes(
        label,
        identityType,
        libraries
      ) {
        if (!label || typeof label !== 'object') {
          throw new Error('Data label tidak valid.');
        }

        if (!['barcode', 'global_barcode'].includes(identityType)) {
          throw new Error('Jenis identitas label tidak valid.');
        }

        // Identitas mengikuti mode Reprint.
        const identityValue = String(
          label.identity_value ??
          (
            identityType === 'global_barcode' ?
            label.global_barcode :
            label.barcode
          ) ??
          ''
        ).trim();

        if (!identityValue) {
          throw new Error('Nomor identitas barcode tidak ditemukan.');
        }

        const {
          bwipjs,
          html2canvas
        } = libraries;


        // =====================================================
        // DATA LABEL
        // =====================================================

        const clean = value =>
          String(value ?? '')
          .replace(/\s+/g, ' ')
          .trim();

        const size = clean(label.size) || '-';
        const quantity = clean(label.total_qty) || '0';

        const bucket = clean(label.bucket) || '-';
        const ncvs = clean(label.ncvs) || '-';
        const model = clean(label.model) || '-';
        const style = clean(label.style) || '-';

        const totalOrder =
          label.total_qty_order !== undefined &&
          label.total_qty_order !== null ?
          Number(label.total_qty_order).toLocaleString('id-ID') :
          '-';

        const lot = clean(label.lot_range) || '-';
        const vendor = clean(label.nm_vendor) || '-';

        const mainComponentName = clean(
          label.nm_main_input ||
          label.main_component ||
          label.main_component_name ||
          label.nm_group ||
          ''
        ) || '-';

        const components = Array.isArray(label.group_components) ?
          label.group_components.map(clean).filter(Boolean) : [];


        // =====================================================
        // HELPER FORMAT TEXT
        // =====================================================

        const COLS = 32;

        const parts = [];

        const cmd = (...bytes) => {
          parts.push(escPosCommand(...bytes));
        };

        const text = value => {
          parts.push(escPosText(String(value ?? '') + '\n'));
        };

        const separator = () => {
          text('-'.repeat(COLS));
        };

        const printWrapped = (value, maxLength = COLS) => {
          wrapPrinterText(value, maxLength).forEach(line => {
            text(line);
          });
        };

        const printInfo = (labelText, value) => {
          const prefix = `${labelText} : `;
          const available = COLS - prefix.length;

          const lines = wrapPrinterText(value, available);

          if (lines.length === 0) {
            text(prefix);
            return;
          }

          text(prefix + lines[0]);

          // Baris lanjutan sejajar dengan value.
          const indent = ' '.repeat(prefix.length);

          lines.slice(1).forEach(line => {
            text(indent + line);
          });
        };


        // =====================================================
        // 1. GENERATE HEADER
        // =====================================================

        const headerCanvas = await createReprintHeaderCanvas(
          label,
          identityType,
          html2canvas
        );


        // =====================================================
        // 2. GENERATE BARCODE
        // =====================================================

        const barcodeCanvas = createReprintBarcodeCanvas(
          identityValue,
          bwipjs
        );


        // =====================================================
        // 3. PRINTER INITIALIZATION
        // =====================================================

        cmd(0x1B, 0x40); // Initialize printer
        cmd(0x1B, 0x61, 0x00); // Left alignment
        cmd(0x1B, 0x4D, 0x00); // Font A
        cmd(0x1B, 0x21, 0x00); // Normal character size
        cmd(0x1B, 0x45, 0x00); // Bold OFF
        cmd(0x1B, 0x33, 0x18); // Line spacing 24 dots


        // =====================================================
        // 4. HEADER RASTER
        // =====================================================

        parts.push(
          barcodeCanvasToEscPos(headerCanvas)
        );


        // Reset format untuk body.
        cmd(0x1B, 0x61, 0x00);
        cmd(0x1B, 0x4D, 0x00);
        cmd(0x1B, 0x21, 0x00);
        cmd(0x1B, 0x45, 0x00);
        cmd(0x1B, 0x33, 0x20);


        // =====================================================
        // 5. BODY - INFORMASI ORDER
        // =====================================================

        printWrapped(`${bucket} - ${ncvs}`);
        printWrapped(model);
        printWrapped(style);

        // Total Order.
        printInfo('Total Order', totalOrder);

        // LOT dan Vendor.
        printWrapped(`LOT : ${lot} | ${vendor}`);

        separator();


        // =====================================================
        // 6. MAIN COMPONENT - BOLD
        // =====================================================

        cmd(0x1B, 0x45, 0x01); // Bold ON

        printWrapped(mainComponentName);

        cmd(0x1B, 0x45, 0x00); // Bold OFF

        separator();


        // =====================================================
        // 7. GROUP COMPONENT
        // =====================================================

        if (components.length > 0) {
          components.forEach(component => {
            printWrapped(component);
          });
        } else {
          text('-');
        }

        separator();


        // =====================================================
        // 8. FOOTER - BARCODE CODE128
        // =====================================================

        // Barcode rata tengah.
        cmd(0x1B, 0x61, 0x01);

        parts.push(
          barcodeCanvasToEscPos(barcodeCanvas)
        );

        // Nomor identitas menggunakan Font B.
        cmd(0x1B, 0x4D, 0x01);
        cmd(0x1B, 0x45, 0x00);
        cmd(0x1B, 0x21, 0x00);

        text(identityValue);


        // =====================================================
        // 9. SELESAI
        // =====================================================

        cmd(0x1B, 0x61, 0x00);
        cmd(0x1B, 0x32); // Default line spacing

        text('');

        return concatPrintBytes(parts);
      }

      const table = $('#reprintTable').DataTable({
        processing: true,
        serverSide: true,
        pageLength: 20,
        lengthMenu: [10, 20, 50, 100],
        searching: true,
        searchDelay: 350,
        order: [],
        ajax: async function(request, callback) {
          try {
            hideAlert(alertBox);

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
            showAlert(alertBox, error.message);
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
            data: 'komponen',
            render: function(data) {
              return escapeHtml(data || '-');
            }
          },
          {
            data: 'total_failed'
          },
          {
            data: 'status_label',
            orderable: false,
            searchable: false,
            render: function(data, type, row) {

              const isPreSetting = row.last_gate === 'PRE_SETTING';

              const title = isPreSetting ?
                'Proses belum setting' :
                'Proses siap kirim warehouse';

              const badgeClass = isPreSetting ?
                'bg-warning-subtle text-warning border border-warning-subtle' :
                'bg-info-subtle text-info border border-info-subtle';

              return `
              <div class="d-flex flex-column gap-1">
                  <span class="badge rounded-pill ${badgeClass} align-self-start">
                      ${title}
                  </span>
              </div>
          `;
            }
          },
          {
            data: null,
            orderable: false,
            searchable: false,
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

      $('#reprintTable tbody').on('click', '.btn-detail', async function() {
        const row = table.row($(this).closest('tr')).data();
        if (!row) return;

        currentGroup = row;
        selectedIds = new Set();
        currentRows = [];

        hideAlert(detailAlert);

        $('#detailTable tbody').html(
          '<tr><td colspan="12" class="text-center py-4">Memuat detail...</td></tr>'
        );

        $('#failedCount').text('0');
        $('#selectedCount').text('0 barcode dipilih');
        $('#btnReprint').prop('disabled', true);
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
            last_gate: row.last_gate,
            komponen: row.komponen
          });

          currentRows = result.data;
          renderDetail();
        } catch (error) {
          $('#detailTable tbody').html(
            '<tr><td colspan="12" class="text-center py-4">Gagal memuat detail.</td></tr>'
          );
          showAlert(detailAlert, error.message);
        }
      });

      function renderDetail() {
        const tbody = $('#detailTable tbody');
        tbody.empty();

        const config = getIdentityConfig();

        const failedRows = currentRows.filter(
          row =>
          row.print_status === 'FAILED' &&
          row.last_gate === currentGroup.last_gate
        );

        $('#failedCount').text(failedRows.length);

        if (!failedRows.length) {
          tbody.html(`
            <tr>
                <td colspan="12" class="text-center py-5">
                    Tidak ada ${escapeHtml(config.label)} FAILED
                    pada kelompok ini.
                </td>
            </tr>
            `);

          updateSelection();
          return;
        }

        failedRows.forEach(function(row) {
          const id = getRowIdentity(row);

          const checked = selectedIds.has(id) ?
            'checked' :
            '';

          tbody.append(`
            <tr>
                <td class="text-center">
                    <input type="checkbox"
                        class="form-check-input row-check"
                        value="${escapeHtml(id)}"
                        aria-label="Pilih ${escapeHtml(config.label)} ${escapeHtml(id)}"
                        ${checked}>
                </td>

                <td>${escapeHtml(row.bucket)}</td>
                <td>${escapeHtml(row.model)}</td>
                <td>${escapeHtml(row.style)}</td>
                <td>${escapeHtml(row.ncvs)}</td>
                <td>${escapeHtml(row.komponen)}</td>
                <td>${escapeHtml(row.nm_vendor)}</td>
                <td class="text-nowrap">${escapeHtml(row.lot_range)}</td>
                <td>${escapeHtml(row.size)}</td>
                <td class="text-end">${escapeHtml(row.total_qty)}</td>

                <td>
                    <span class="badge rounded-pill bg-danger-subtle text-danger border border-danger-subtle px-3 py-2">
                        <i class="bi bi-x-circle me-1"></i> FAILED
                    </span>
                </td>
            </tr>
        `);
        });

        updateSelection();
      }

      function updateSelection() {
        const config = getIdentityConfig();

        const failedRows = currentRows.filter(
          row =>
          row.print_status === 'FAILED' &&
          row.last_gate === currentGroup.last_gate
        );

        const failedIds = failedRows.map(getRowIdentity);

        const selectedFailedIds = failedIds.filter(
          id => selectedIds.has(id)
        );

        selectedIds = new Set(selectedFailedIds);

        const selectedCount = selectedFailedIds.length;
        const totalFailed = failedIds.length;

        const allSelected =
          totalFailed > 0 &&
          selectedCount === totalFailed;

        $('#selectedCount').text(
          `${selectedCount} dari ${totalFailed} ${config.label} dipilih`
        );

        $('#btnReprint').prop(
          'disabled',
          selectedCount === 0
        );

        $('#btnSelectAll').prop(
          'disabled',
          totalFailed === 0
        );

        $('#btnSelectAll').html(
          allSelected ?
          '<i class="bi bi-square me-1"></i> Batalkan' :
          '<i class="bi bi-check2-square me-1"></i> Pilih Semua'
        );
      }

      $('#btnSelectAll').off('click').on('click', function() {
        const failedRows = currentRows.filter(
          row =>
          row.print_status === 'FAILED' &&
          row.last_gate === currentGroup.last_gate
        );

        const failedIds = failedRows.map(getRowIdentity);

        const allSelected =
          failedIds.length > 0 &&
          failedIds.every(id => selectedIds.has(id));

        if (allSelected) {
          selectedIds.clear();
        } else {
          selectedIds = new Set(failedIds);
        }

        renderDetail();
      });

      $('#detailTable tbody').off('change', '.row-check')
        .on('change', '.row-check', function() {
          const id = String(this.value);

          if (this.checked) {
            selectedIds.add(id);
          } else {
            selectedIds.delete(id);
          }

          updateSelection();
        });


      // ==========================================
      // STAGE 5 - REPRINT BUTTON WITH BLUETOOTH
      // ==========================================

      $('#btnReprint').on('click', async function() {
        if (!currentGroup || selectedIds.size === 0) return;

        const config = getIdentityConfig();

        const selectedIdentities = [...selectedIds];
        const lastGate = currentGroup.last_gate;

        const button = this;
        const originalHtml = button.innerHTML;

        button.disabled = true;
        button.innerHTML =
          '<span class="spinner-border spinner-border-sm me-1"></span> Menghubungkan printer...';

        try {
          hideAlert(detailAlert);

          // 1. Bluetooth request harus berasal dari klik langsung user.
          await selectAndConnectReprintPrinter();

          button.innerHTML =
            '<span class="spinner-border spinner-border-sm me-1"></span> Mengambil data...';

          // 2. Ambil data label dari backend.
          const result = await postReprintData({
            action: 'get-reprint-labels',
            identity_type: config.type,
            last_gate: lastGate,
            identities: JSON.stringify(selectedIdentities)
          });

          const labels = result.labels;

          if (!Array.isArray(labels) || labels.length === 0) {
            throw new Error(
              'Tidak ada label yang dapat dicetak ulang.'
            );
          }

          // 3. Validasi jenis identitas.
          if (result.identity_type !== config.type) {
            throw new Error(
              'Jenis identitas label tidak sesuai dengan pilihan.'
            );
          }

          const returnedIdentities = [
            ...new Set(
              labels.map(label =>
                String(label.identity_value ?? '').trim()
              )
            )
          ];

          if (
            selectedIdentities.some(
              id => !returnedIdentities.includes(id)
            ) ||
            returnedIdentities.some(
              id => !selectedIdentities.includes(id)
            )
          ) {
            throw new Error(
              'Data identitas yang diterima tidak sesuai dengan pilihan.'
            );
          }

          button.innerHTML =
            '<span class="spinner-border spinner-border-sm me-1"></span> Menyiapkan label...';

          // 4. Cetak label secara sequential.
          await printSessionLabels(
            labels,
            config.type,
            lastGate
          );

          showReprintMessage(
            'Seluruh label berhasil dikirim ke printer. Silakan periksa hasil cetak dan konfirmasi.',
            'success'
          );

        } catch (error) {
          console.error('Reprint Bluetooth error:', error);

          showAlert(
            detailAlert,
            error.message || 'Gagal melakukan cetak ulang.'
          );

        } finally {
          button.disabled = selectedIds.size === 0;
          button.innerHTML = originalHtml;
        }
      });

      let pendingPrintIdentities = [];
      let pendingPrintIdentityType = '';
      let pendingPrintGate = '';

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

      function showReprintMessage(message, type) {
        const element = document.getElementById('reprintAlert');

        if (!element) {
          alert(message);
          return;
        }

        element.textContent = message;
        element.classList.remove(
          'd-none',
          'alert-success',
          'alert-danger',
          'alert-warning'
        );
        element.classList.add(
          type === 'success' ? 'alert-success' : 'alert-danger'
        );
      }


      async function submitReprintResult(status) {
        if (!pendingPrintIdentities.length) {
          showError('Tidak ada identitas yang perlu dikonfirmasi.');
          return;
        }

        const btnSuccess = document.getElementById('btn-print-success');
        const btnFailed = document.getElementById('btn-print-failed');
        const modalElement = document.getElementById('modalPrintResult');

        const originalSuccessText = btnSuccess.innerHTML;
        const originalFailedText = btnFailed.innerHTML;

        btnSuccess.disabled = true;
        btnFailed.disabled = true;

        const activeButton =
          status === 'PRINTED' ? btnSuccess : btnFailed;

        activeButton.innerHTML = 'Memproses...';

        try {
          const formData = new FormData();

          formData.append('action', 'update-reprint-status');
          formData.append('print_status', status);
          formData.append('identity_type', pendingPrintIdentityType);
          formData.append('last_gate', pendingPrintGate);

          formData.append(
            'identities',
            JSON.stringify(pendingPrintIdentities)
          );

          const response = await fetch('./../config/function.php', {
            method: 'POST',
            body: formData
          });

          const result = await response.json();

          if (!response.ok || result.status !== 'success') {
            throw new Error(
              result.message || 'Gagal memperbarui status cetak ulang.'
            );
          }

          bootstrap.Modal.getOrCreateInstance(modalElement).hide();

          pendingPrintIdentities = [];
          pendingPrintIdentityType = '';
          pendingPrintGate = '';

          if (status === 'PRINTED') {
            showSuccess(
              'Konfirmasi berhasil. Status cetak diperbarui menjadi PRINTED.'
            );

            setTimeout(function() {
              window.location.reload();
            }, 3500);

          } else {
            showError(
              'Konfirmasi berhasil. Status cetak tetap FAILED.'
            );
          }

        } catch (error) {
          showError(
            'Status cetak ulang gagal diperbarui: ' + error.message
          );

        } finally {
          btnSuccess.disabled = false;
          btnFailed.disabled = false;

          btnSuccess.innerHTML = originalSuccessText;
          btnFailed.innerHTML = originalFailedText;
        }
      }

      document.getElementById('btn-print-success').addEventListener('click', function() {
        submitReprintResult('PRINTED');
      });

      document.getElementById('btn-print-failed').addEventListener('click', function() {
        submitReprintResult('FAILED');
      });

      // ==========================================
      // STAGE 5 - SEQUENTIAL BLUETOOTH PRINTING
      // ==========================================

      async function printSessionLabels(
        labels,
        identityType,
        lastGate
      ) {
        if (!Array.isArray(labels) || labels.length === 0) {
          throw new Error('Tidak ada label yang siap dicetak.');
        }

        if (!printerCharacteristic) {
          throw new Error('Printer Bluetooth belum terhubung.');
        }

        // Pastikan library tersedia.
        const libraries = await ensurePrintLibraries();

        // Satu label untuk setiap identity_value unik.
        const uniqueLabels = [
          ...new Map(
            labels.map(label => [
              String(label.identity_value ?? '').trim(),
              label
            ])
          ).values()
        ];

        if (!uniqueLabels.length) {
          throw new Error('Tidak ada identitas label yang valid.');
        }

        // Validasi seluruh identitas sebelum mulai mencetak.
        uniqueLabels.forEach(label => {
          const identityValue = String(
            label.identity_value ?? ''
          ).trim();

          if (!identityValue) {
            throw new Error('Ditemukan identitas barcode kosong.');
          }
        });

        console.log('Jumlah label yang akan dicetak:', uniqueLabels.length);
        console.log('Identity type:', identityType);
        console.log('Last gate:', lastGate);

        // Cetak satu per satu.
        for (let i = 0; i < uniqueLabels.length; i++) {
          const label = uniqueLabels[i];

          console.log(
            `Mencetak label ${i + 1}/${uniqueLabels.length}:`,
            label.identity_value
          );

          // Bangun byte ESC/POS untuk satu label.
          const printBytes = await buildReprintLabelBytes(
            label,
            identityType,
            libraries
          );

          // Kirim ke printer.
          await sendBluetoothData(printBytes);

          console.log(
            `Label ${i + 1}/${uniqueLabels.length} selesai dikirim.`
          );

          // Jeda antar label.
          if (i < uniqueLabels.length - 1) {
            await new Promise(resolve =>
              setTimeout(resolve, 120)
            );
          }
        }

        // Simpan identitas untuk konfirmasi Stage 4
        // hanya setelah seluruh label berhasil dikirim.
        pendingPrintIdentities = uniqueLabels.map(
          label => String(label.identity_value).trim()
        );

        pendingPrintIdentityType = identityType;
        pendingPrintGate = lastGate;

        console.log(
          'Seluruh label berhasil dikirim ke printer.'
        );

        // Tampilkan modal konfirmasi hasil cetak.
        const modal = bootstrap.Modal.getOrCreateInstance(
          document.getElementById('modalPrintResult')
        );

        modal.show();

        return uniqueLabels.length;
      }
    });
  </script>

</body>

</html>