<?php
// menghubungkan php dengan koneksi database
require_once __DIR__ . '/../config/function.php';
require_once __DIR__ . '/../config/auth.php';
checkAuth('ready-to-wh'); // cek apakah sudah login dan punya akses ke menu ini

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
  $page = 'ready-to-wh';
  include_once __DIR__ . '/../includes/header.php';
  ?>
  <!-- End Header -->

  <main id="main" class="main">

    <div class="pagetitle text-black" style="background-color: #f0e6d2; padding: 10px 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
      <h1 style="font-size: 1.8rem; font-weight: 700; font-family: 'Roboto', sans-serif;">
        Ready to Warehouse Subcont
      </h1>
    </div>


    <section class="section mt-4">
      <div class="card">
        <div class="card-body pt-4">

          <div id="readyToWhAlert" class="alert alert-danger d-none"></div>

          <div class="table-responsive">
            <table id="readyToWhTable"
              class="table table-striped table-hover align-middle w-100">
              <thead>
                <tr>
                  <th>Bucket</th>
                  <th>Model</th>
                  <th>Style</th>
                  <th>NCVS</th>
                  <th>Total Ready to Ship</th>
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
                <i class="bi bi-box-seam-fill"></i>
              </div>
              <div>
                <h5 class="modal-title mb-1">Ready to Ship</h5>
                <div class="text-white-50 small">
                  Pilih komponen yang akan dikirim dan akan digabungkan ke dalam satu bag.
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
                  <i class="bi bi-check-circle-fill"></i>
                </div>
                <div>
                  <div class="fw-bold">Komponen siap dikirim</div>
                  <div class="text-secondary small">
                    Pilih komponen siap kirim ke Warehouse Subcont.
                  </div>
                </div>
              </div>

              <div class="reprint-count-badge">
                <span id="readyCount">0</span>
                <small>DATA</small>
              </div>
            </div>

            <div id="detailAlert" class="alert alert-danger d-none"></div>

            <div class="reprint-table-toolbar">
              <div>
                <div class="fw-bold">Daftar Komponen Siap Kirim</div>
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
                    <th>Nama Vendor</th>
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
                  <div class="fw-bold" id="selectedCount">
                    0 data dipilih
                  </div>
                  <div class="text-secondary small">
                    Pastikan data yang dipilih berasal dari kelompok yang sama.
                  </div>
                </div>
              </div>

              <button id="btnReadyToShip"
                class="btn btn-primary btn-reprint" disabled>
                <i class="bi bi-box-seam-fill me-2"></i>
                Lanjutkan
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
              Konfirmasi Hasil Cetak Ready to Warehouse Subcont
            </h4>

            <p class="print-result-description">
              Apakah label Global Barcode berhasil tercetak dengan baik?
            </p>

            <div class="print-result-info">
              <i class="bi bi-info-circle-fill"></i>
              <span>
                Pilih <strong>Berhasil</strong> jika label Global Barcode
                tercetak dengan benar dan barcode dapat terbaca.
                Pilih <strong>Gagal</strong> jika label tidak tercetak
                atau hasil cetaknya bermasalah.
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

      // =====================================================
      // 1. CONFIGURATION
      // =====================================================

      const apiUrl = './../config/get-data-ready-to-wh.php';
      const functionUrl = './../config/function.php';

      const alertBox = document.getElementById('readyToWhAlert');
      const detailAlert = document.getElementById('detailAlert');
      const detailModalElement = document.getElementById('detailModal');
      const printResultModalElement = document.getElementById('modalPrintResult');

      // =====================================================
      // 2. STATE
      // =====================================================

      let currentGroup = null;
      let currentRows = [];
      let selectedIds = new Set();
      let detailRequestId = 0;

      // Print state.
      let printWindow = null;
      let pendingGlobalBarcode = null;
      let isSubmittingPrintResult = false;

      // =====================================================
      // 3. HELPER
      // =====================================================

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
        if (!element) return;

        element.textContent = message;
        element.classList.remove('d-none');
      }

      function hideAlert(element) {
        if (!element) return;

        element.textContent = '';
        element.classList.add('d-none');
      }

      function setLoadingRow(message) {
        $('#detailTable tbody').html(`
      <tr>
        <td colspan="11" class="text-center py-4">
          ${escapeHtml(message)}
        </td>
      </tr>
    `);
      }

      async function postData(url, data) {

        const response = await fetch(url, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
          },
          body: new URLSearchParams(data)
        });

        let result;

        try {
          result = await response.json();
        } catch (error) {
          throw new Error('Response server bukan JSON yang valid.');
        }

        if (!response.ok || result.status !== 'success') {
          throw new Error(result.message || 'Permintaan gagal.');
        }

        return result;
      }

      // =====================================================
      // 4. DATATABLES
      // =====================================================

      const table = $('#readyToWhTable').DataTable({

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

            const result = await postData(apiUrl, {
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

        columns: [

          {
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
            data: 'total_barcode',
            className: 'text-center',
            render: function(data) {

              return `
            <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-3 py-2">
              ${Number(data || 0).toLocaleString('id-ID')}
            </span>
          `;

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
            </button>
          `;

            }
          }

        ],

        language: {
          search: 'Cari data:',
          lengthMenu: 'Show _MENU_ Entries',
          info: 'Showing _START_ to _END_ of _TOTAL_ entries',
          infoEmpty: 'Tidak ada data',
          zeroRecords: 'Tidak ada data Ready to Ship.',
          processing: 'Memuat data...',
          paginate: {
            previous: 'Previous',
            next: 'Next'
          }
        }

      });

      // =====================================================
      // 5. OPEN DETAIL MODAL
      // =====================================================

      $('#readyToWhTable tbody').on(
        'click',
        '.btn-detail',
        async function() {

          const row = table.row($(this).closest('tr')).data();

          if (!row) return;

          currentGroup = row;
          currentRows = [];
          selectedIds.clear();

          const requestId = ++detailRequestId;

          hideAlert(detailAlert);

          setLoadingRow('Memuat detail...');

          $('#readyCount').text('0');
          $('#selectedCount').text('0 dari 0 data dipilih');

          $('#btnReadyToShip').prop('disabled', true);
          $('#btnSelectAll').prop('disabled', true);

          bootstrap.Modal.getOrCreateInstance(
            detailModalElement
          ).show();

          try {

            const result = await postData(apiUrl, {
              action: 'detail',
              bucket: row.bucket,
              model: row.model,
              style: row.style,
              ncvs: row.ncvs
            });

            if (requestId !== detailRequestId) return;

            currentRows = Array.isArray(result.data) ?
              result.data : [];

            renderDetail();

          } catch (error) {

            if (requestId !== detailRequestId) return;

            setLoadingRow('Gagal memuat detail.');

            showAlert(detailAlert, error.message);

          }

        }
      );

      // =====================================================
      // 6. RENDER DETAIL
      // =====================================================

      function renderDetail() {

        const tbody = $('#detailTable tbody');

        tbody.empty();

        const totalBarcode = currentRows.length;

        $('#readyCount').text(totalBarcode);

        if (totalBarcode === 0) {

          tbody.html(`
        <tr>
          <td colspan="11" class="text-center py-5">
            Tidak ada barcode yang tersedia untuk Ready to Ship.
          </td>
        </tr>
      `);

          updateSelection();

          return;
        }

        currentRows.forEach(function(row) {

          const barcode = String(row.barcode ?? '');
          const checked = selectedIds.has(barcode) ? 'checked' : '';

          tbody.append(`

        <tr>

          <td class="text-center">
            <input type="checkbox"
              class="form-check-input row-check"
              value="${escapeHtml(barcode)}"
              aria-label="Pilih barcode ${escapeHtml(barcode)}"
              ${checked}>
          </td>

          <td>${escapeHtml(row.bucket)}</td>

          <td>${escapeHtml(row.model)}</td>

          <td>${escapeHtml(row.style)}</td>

          <td>${escapeHtml(row.ncvs)}</td>

          <td>${escapeHtml(row.komponen)}</td>

          <td>${escapeHtml(row.nm_vendor)}</td>

          <td class="text-nowrap">
            ${escapeHtml(row.lot_range)}
          </td>

          <td>${escapeHtml(row.size)}</td>

          <td class="text-end">
            ${escapeHtml(row.total_qty)}
          </td>

          <td>
            <span class="badge rounded-pill bg-primary-subtle text-primary border border-primary-subtle px-3 py-2">
              <i class="bi bi-box-seam-fill me-1"></i>
              READY TO SHIP
            </span>
          </td>

        </tr>

      `);

        });

        updateSelection();

      }

      // =====================================================
      // 7. UPDATE SELECTION
      // =====================================================

      function updateSelection() {

        const availableIds = currentRows.map(
          row => String(row.barcode ?? '')
        );

        selectedIds = new Set(
          availableIds.filter(id => selectedIds.has(id))
        );

        const selectedCount = selectedIds.size;
        const totalCount = availableIds.length;

        const allSelected =
          totalCount > 0 &&
          selectedCount === totalCount;

        $('#selectedCount').text(
          `${selectedCount} dari ${totalCount} data dipilih`
        );

        $('#btnReadyToShip').prop(
          'disabled',
          selectedCount === 0
        );

        $('#btnSelectAll').prop(
          'disabled',
          totalCount === 0
        );

        $('#btnSelectAll').html(

          allSelected

          ?
          '<i class="bi bi-square me-1"></i> Batal Pilih Semua'

          :
          '<i class="bi bi-check2-square me-1"></i> Pilih Semua'

        );

      }

      // =====================================================
      // 8. SELECT ALL
      // =====================================================

      $('#btnSelectAll')
        .off('click')
        .on('click', function() {

          const availableIds = currentRows.map(
            row => String(row.barcode ?? '')
          );

          const allSelected =
            availableIds.length > 0 &&
            availableIds.every(id => selectedIds.has(id));

          if (allSelected) {

            selectedIds.clear();

          } else {

            selectedIds = new Set(availableIds);

          }

          renderDetail();

        });

      // =====================================================
      // 9. INDIVIDUAL CHECKBOX
      // =====================================================

      $('#detailTable tbody')
        .off('change', '.row-check')
        .on('change', '.row-check', function() {

          const barcode = String(this.value);

          if (this.checked) {
            selectedIds.add(barcode);
          } else {
            selectedIds.delete(barcode);
          }

          updateSelection();

        });


      // =====================================================
      // 10. GENERATE GLOBAL BARCODE
      // =====================================================

      $('#btnReadyToShip')
        .off('click')
        .on('click', async function() {

          if (!currentGroup || selectedIds.size === 0) {
            showAlert(detailAlert, 'Pilih minimal satu barcode.');
            return;
          }

          const selectedBarcodes = [...selectedIds];

          // Buka print window langsung dari interaksi user.
          // Ini mengikuti konsep Reprint agar tidak diblokir browser.
          const targetWindow = window.open('', '_blank');

          if (!targetWindow) {
            showAlert(
              detailAlert,
              'Jendela cetak diblokir browser. Izinkan pop-up untuk situs ini.'
            );
            return;
          }

          const button = this;
          const originalHtml = button.innerHTML;

          button.disabled = true;
          button.innerHTML = `
      <span class="spinner-border spinner-border-sm me-1"></span>
      Menyiapkan...
    `;

          let generatedGlobalBarcode = null;

          try {

            hideAlert(detailAlert);

            // ---------------------------------------------
            // A. GENERATE GLOBAL BARCODE
            // ---------------------------------------------

            const generateResult = await postData(functionUrl, {
              action: 'generate_ready_to_ship',
              barcodes: JSON.stringify(selectedBarcodes)
            });

            generatedGlobalBarcode =
              generateResult.data?.global_barcode;

            if (!generatedGlobalBarcode) {
              throw new Error(
                'Global Barcode tidak ditemukan pada response Generate.'
              );
            }

            // Simpan identitas untuk konfirmasi setelah print.
            pendingGlobalBarcode = generatedGlobalBarcode;

            // ---------------------------------------------
            // B. AMBIL DATA LABEL
            // ---------------------------------------------

            const labelResponse = await postData(functionUrl, {
              action: 'get-ready-to-ship-labels',
              global_barcode: generatedGlobalBarcode
            });

            const label = labelResponse.label;

            if (!label || !label.global_barcode) {
              throw new Error('Data label Ready to Ship tidak tersedia.');
            }

            if (label.global_barcode !== generatedGlobalBarcode) {
              throw new Error(
                'Global Barcode pada data label tidak sesuai.'
              );
            }

            // ---------------------------------------------
            // C. PRINT LABEL
            // ---------------------------------------------

            printSessionLabels(label, targetWindow);

            // Tutup modal detail setelah label berhasil disiapkan.
            bootstrap.Modal.getOrCreateInstance(
              detailModalElement
            ).hide();

            selectedIds.clear();

            // Refresh listing.
            table.ajax.reload(null, false);

          } catch (error) {

            if (targetWindow && !targetWindow.closed) {
              targetWindow.close();
            }

            if (generatedGlobalBarcode) {

              // Generate sudah berhasil.
              // Jangan mengulang Generate karena nomor sudah tersimpan.
              pendingGlobalBarcode = generatedGlobalBarcode;

              showAlert(
                detailAlert,
                `Global Barcode ${generatedGlobalBarcode} sudah berhasil dibuat, tetapi label gagal disiapkan: ${error.message}. Jangan Generate ulang.`
              );

              table.ajax.reload(null, false);

            } else {

              pendingGlobalBarcode = null;

              showAlert(detailAlert, error.message);

            }

          } finally {

            button.disabled = false;
            button.innerHTML = originalHtml;

            updateSelection();

          }

        });

      // =====================================================
      // 11. PRINT CONFIGURATION
      // =====================================================

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

      // =====================================================
      // 12. PRINT WINDOW CLOSED
      // =====================================================

      window.onPrintDialogClosed = function() {

        if (printWindow && !printWindow.closed) {
          printWindow.close();
        }

        printWindow = null;

        if (pendingGlobalBarcode && printResultModalElement) {

          bootstrap.Modal.getOrCreateInstance(
            printResultModalElement
          ).show();

        }

      };

      // =====================================================
      // 13. PRINT GLOBAL BARCODE LABEL
      // =====================================================

      function printSessionLabels(label, targetWindow) {

        if (!label || !label.global_barcode) {
          targetWindow.close();
          throw new Error('Data Global Barcode tidak tersedia.');
        }

        printWindow = targetWindow;

        const mainComponents = (
          Array.isArray(label.main_components) ?
          label.main_components : []
        ).filter(value => String(value ?? '').trim() !== '');

        const groupComponents = (
          Array.isArray(label.group_components) ?
          label.group_components : []
        ).filter(value => String(value ?? '').trim() !== '');

        const mainComponentHtml = mainComponents.map(component => `
      <div class="main-component">
        ${escapePrintHtml(component)}
      </div>
    `).join('');

        const groupComponentHtml = groupComponents.map(component => `
      <div class="component-row">
        ${escapePrintHtml(component)}
      </div>
    `).join('');

        // ---------------------------------------------
        // LABEL HTML
        // ---------------------------------------------

        const labelHtml = `
      <section class="label">

        <div class="top-section">

          <div class="total-qty">
            <div class="qty-title">Total QTY</div>

            <div class="qty-value">
              ${Number(label.total_qty || 0).toLocaleString('id-ID')}
            </div>
          </div>

          <div class="product-info">

            <div class="bucket-ncvs">
              ${escapePrintHtml(label.bucket)}
              -
              ${escapePrintHtml(label.ncvs)}
            </div>

            <div class="model">
              ${escapePrintHtml(label.model)}
            </div>

            <div class="style">
              ${escapePrintHtml(label.style)}
            </div>

          </div>

        </div>

        <div class="lot-vendor">
          ${label.lot_range
            ? 'Lot ' + escapePrintHtml(label.lot_range)
            : ''}
          ${label.nm_vendor
            ? ' | ' + escapePrintHtml(label.nm_vendor)
            : ''}
        </div>

        <div class="component-section">

          ${mainComponentHtml}

          <div class="component-list">
            ${groupComponentHtml}
          </div>

        </div>

        <div class="barcode-wrap">

          <canvas
            class="barcode"
            data-barcode="${escapePrintHtml(label.global_barcode)}">
          </canvas>

          <div class="barcode-text">
            ${escapePrintHtml(label.global_barcode)}
          </div>

        </div>

      </section>
    `;

        // ---------------------------------------------
        // PRINT DOCUMENT
        // ---------------------------------------------

        targetWindow.document.open();

        targetWindow.document.write(`
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">

        <title>
          Ready to Ship - ${escapePrintHtml(label.global_barcode)}
        </title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bwip-js/4.11.4/bwip-js-min.js"><\/script>

        <style>

          @page {
            size: 48mm auto;
            margin: 0;
          }

          * {
            box-sizing: border-box;
          }

          html,
          body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
          }

          .label {
            width: 48mm;
            min-height: 40mm;
            padding: 1.5mm;
            display: flex;
            flex-direction: column;
            page-break-after: always;
            break-after: page;
          }

          .top-section {
            display: grid;
            grid-template-columns: 15mm minmax(0, 1fr);
            gap: 3mm;
            align-items: start;
            padding-bottom: 2mm;
            border-bottom: 1px dashed #000;
          }

          .total-qty {
            text-align: center;
            font-weight: bold;
            line-height: 1.05;
          }

          .qty-title {
            font-size: 9pt;
            text-decoration: underline;
          }

          .qty-value {
            font-size: 19pt;
            margin-top: 1mm;
          }

          .product-info {
            min-width: 0;
            font-size: 10pt;
            font-weight: bold;
            line-height: 1.2;
            overflow-wrap: anywhere;
          }

          .bucket-ncvs {
            font-size: 10pt;
          }

          .model,
          .style {
            overflow-wrap: anywhere;
          }

          .lot-vendor {
            padding: 2mm 0;
            border-bottom: 1px dashed #000;
            font-size: 9pt;
            font-weight: bold;
            line-height: 1.2;
            overflow-wrap: anywhere;
          }

          .component-section {
            padding: 2mm 0;
            border-bottom: 1px dashed #000;
          }

          .main-component {
            font-size: 9pt;
            font-weight: bold;
            line-height: 1.2;
            overflow-wrap: anywhere;
          }

          .component-list {
            margin-top: 1mm;
          }

          .component-row {
            font-size: 8pt;
            font-weight: bold;
            line-height: 1.2;
            overflow-wrap: anywhere;
            white-space: normal;
          }

          .barcode-wrap {
            margin-top: 2mm;
            width: 100%;
            text-align: center;
            break-inside: avoid;
          }

          .barcode {
            display: block;
            width: 100%;
            height: 10mm;
            object-fit: contain;
            margin: 0 auto;
          }

          .barcode-text {
            font-size: 7pt;
            line-height: 1.2;
            overflow-wrap: anywhere;
          }

          @media screen {
            .label {
              border: 1px dashed #aaa;
              margin-bottom: 4mm;
            }
          }

        </style>

      </head>

      <body>

        ${labelHtml}

        <script>

          let printDialogTriggered = false;

          function renderAndPrintLabel() {

            const barcodeLibrary = window.bwipjs;
            const canvas = document.querySelector('canvas.barcode');

            if (
              !barcodeLibrary ||
              typeof barcodeLibrary.toCanvas !== 'function'
            ) {
              alert(
                'Library barcode tidak tersedia. Periksa koneksi internet.'
              );
              return;
            }

            if (!canvas || !canvas.dataset.barcode) {
              alert('Data barcode tidak tersedia.');
              return;
            }

            try {

              barcodeLibrary.toCanvas(canvas, {
                bcid: 'code128',
                text: canvas.dataset.barcode,
                scale: 2,
                height: 8,
                includetext: false
              });

              setTimeout(function() {

                window.focus();

                printDialogTriggered = true;
                window.print();

              }, 500);

            } catch (error) {

              console.error('Gagal membuat barcode:', error);

              alert(
                'Gagal membuat barcode: ' +
                (error.message || error)
              );

            }

          }

          if (document.readyState === 'complete') {
            renderAndPrintLabel();
          } else {
            window.addEventListener(
              'load',
              renderAndPrintLabel,
              { once: true }
            );
          }

          window.addEventListener('afterprint', function() {

            if (
              !printDialogTriggered ||
              !window.opener ||
              window.opener.closed
            ) {
              return;
            }

            printDialogTriggered = false;

            window.opener.onPrintDialogClosed();

          });

        <\/script>

      </body>
      </html>
    `);

        targetWindow.document.close();

      }


      // =====================================================
      // 14. CONFIRM PRINT RESULT
      // =====================================================

      async function submitReadyToShipPrintResult(status) {

        if (!pendingGlobalBarcode || isSubmittingPrintResult) {
          return;
        }

        const btnSuccess = document.getElementById('btn-print-success');
        const btnFailed = document.getElementById('btn-print-failed');

        const originalSuccessText = btnSuccess.innerHTML;
        const originalFailedText = btnFailed.innerHTML;

        isSubmittingPrintResult = true;

        btnSuccess.disabled = true;
        btnFailed.disabled = true;

        const activeButton =
          status === 'PRINTED' ? btnSuccess : btnFailed;

        activeButton.innerHTML = `
          <span class="spinner-border spinner-border-sm me-1"></span>
          Memproses...
        `;

        try {

          // ---------------------------------------------
          // A. UPDATE STATUS READY TO SHIP
          // ---------------------------------------------

          const result = await postData(functionUrl, {
            action: 'update-ready-to-wh-status',
            print_status: status,
            global_barcode: pendingGlobalBarcode
          });

          const confirmedBarcode = pendingGlobalBarcode;

          // ---------------------------------------------
          // B. TUTUP MODAL KONFIRMASI
          // ---------------------------------------------

          bootstrap.Modal.getOrCreateInstance(
            printResultModalElement
          ).hide();

          pendingGlobalBarcode = null;

          // ---------------------------------------------
          // C. NOTIFIKASI TOAST
          // ---------------------------------------------

          if (status === 'PRINTED') {

            showSuccess(
              result.message ||
              `Global Barcode ${confirmedBarcode} berhasil dikonfirmasi tercetak.`
            );

          } else {

            showError(
              result.message ||
              `Cetak Global Barcode ${confirmedBarcode} gagal. Silakan lakukan cetak ulang.`
            );

          }

          // ---------------------------------------------
          // D. REFRESH DATATABLE
          // ---------------------------------------------

          table.ajax.reload(null, false);

        } catch (error) {

          showError(
            'Gagal memperbarui status cetak: ' + error.message
          );

        } finally {

          isSubmittingPrintResult = false;

          btnSuccess.disabled = false;
          btnFailed.disabled = false;

          btnSuccess.innerHTML = originalSuccessText;
          btnFailed.innerHTML = originalFailedText;

        }

      }

      // =====================================================
      // 15. PRINT RESULT BUTTON EVENTS
      // =====================================================

      $('#btn-print-success')
        .off('click')
        .on('click', function() {
          submitReadyToShipPrintResult('PRINTED');
        });

      $('#btn-print-failed')
        .off('click')
        .on('click', function() {
          submitReadyToShipPrintResult('FAILED');
        });

      // =====================================================
      // 16. MODAL CLEANUP
      // =====================================================

      detailModalElement.addEventListener(
        'hidden.bs.modal',
        function() {

          detailRequestId++;

          currentGroup = null;
          currentRows = [];
          selectedIds.clear();

          hideAlert(detailAlert);

          $('#readyCount').text('0');
          $('#selectedCount').text('0 dari 0 barcode dipilih');

          $('#btnReadyToShip').prop('disabled', true);
          $('#btnSelectAll').prop('disabled', true);

        }
      );

    });
  </script>

</body>

</html>