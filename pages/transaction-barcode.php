<?php
// menghubungkan php dengan koneksi database
require_once __DIR__ . '/../config/function.php';
require_once __DIR__ . '/../config/auth.php';
checkAuth('trans_barcode'); // cek apakah sudah login dan punya akses ke menu ini

$nik = $_SESSION['nik_user'];
$username = $_SESSION['username'];

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

  .form-control,
  .select2-container--default .select2-selection--single {
    height: 40px !important;
    border-radius: 10px !important;
    border: 1px solid #dbe2ea !important;
  }

  .btn {
    border-radius: 10px !important;
    padding: 8px 18px;
  }

  #addKomponenBtn {
    margin-top: 0px;
    margin-bottom: 5px;
  }

  .komponen-row .form-label {
    display: block;
  }

  .komponen-row .form-control {
    width: 100%;
  }

  .fade-in {
    animation: fadeIn 0.3s ease-in-out;
  }

  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(-4px);
    }

    to {
      opacity: 1;
      transform: translateY(0);
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
  <script src="https://unpkg.com/bwip-js/dist/bwip-js-min.js"></script>


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
        Create Barcode by Lot Basis
      </h1>
    </div>

    <div class="card mb-3">

      <div class="card-body" style="margin-top: 15px;">
        <form id="filterForm" class="row">
          <div class="col-md-3 mb-2">
            <label class="form-label fw-bold">Bucket <span class="text-danger">*</span></label>
            <select id="bucket" name="bucket" class="form-control select2-remote"></select>
          </div>
          <div class="col-md-3 mb-2">
            <label class="form-label fw-bold">Style</label>
            <select id="style" name="style" class="form-control select2-remote"></select>
          </div>
          <div class="col-md-3 mb-2">
            <label class="form-label fw-bold">Model</label>
            <select id="model" name="model" class="form-control select2-remote"></select>
          </div>
          <div class="col-md-3 mb-2">
            <label class="form-label fw-bold">NCVS</label>
            <select id="ncvs" name="ncvs" class="form-control select2-remote"></select>
          </div>

          <div class="col-md-12 mt-3">
            <button type="button" id="resetBtn" class="btn btn-secondary"> <i class="bi bi-arrow-counterclockwise"></i> Reset</button>
            <button type="button" id="searchBtn" class="btn btn-success" disabled><i class="bi bi-search"></i> Search</button>
          </div>
        </form>
      </div>

    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">

            <div class="card-body" style="margin-top: 10px;">

              <table id="example1" class="table table-bordered table-striped text-center align-middle nowrap" style="width:100%">
                <thead class="table-light">
                  <tr>
                    <th class="text-center">Bucket</th>
                    <th class="text-center">Model</th>
                    <th class="text-center">Style</th>
                    <th class="text-center">NCVS</th>
                    <th class="text-center">Qty Order</th>
                  </tr>
                </thead>
              </table>

            </div>
            <!-- End Table with stripped rows -->
          </div>
        </div>
      </div>
      </div>
    </section>

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

  <!-- Generate QR-Code -->
  <!-- <script src="https://cdn.jsdelivr.net/npm/qrcode/build/qrcode.min.js"></script> -->
  <!-- <script src="https://cdn.jsdelivr.net/npm/pica/dist/pica.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bwip-js@3.0.9/dist/bwip-js-min.js"></script>

  <?php include_once __DIR__ . '/../includes/notification.php'; ?>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const toastEl = document.getElementById('liveToast');
      if (toastEl) {
        const toast = new bootstrap.Toast(toastEl, {
          delay: 5000
        });
        toast.show();
      }
    });
  </script>

  <script>
    $(document).ready(function() {
      // ================================
      // Select2 dengan AJAX (untuk filter)
      // ================================
      function initSelect2(id, action, placeholder) {
        $(id).select2({
          width: "100%",
          placeholder: placeholder,
          allowClear: true,
          minimumInputLength: 1,
          ajax: {
            url: "./../config/get-data-master-option.php",
            type: "POST",
            dataType: "json",
            delay: 250,
            data: function(params) {
              return {
                action: action,
                search: params.term,
                bucket: $("#bucket").val(),
                model: $("#model").val(),
                style: $("#style").val(),
                ncvs: $("#ncvs").val()
              };
            },
            processResults: function(data) {
              return {
                results: data.results || []
              };
            }
          }
        });
      }

      // Init semua filter
      initSelect2("#bucket", "searchBucket", "Bucket");
      initSelect2("#style", "searchStyle", "Style");
      initSelect2("#model", "searchModel", "Model");
      initSelect2("#ncvs", "searchNCVS", "NCVS");

      // Auto focus search ketika Select2 dibuka
      $(document).on('select2:open', function() {
        document.querySelector('.select2-container--open .select2-search__field').focus();
      });

      // ================================
      // DataTables
      // ================================
      $(document).ready(function() {
        var table = $("#example1").DataTable({
          processing: true,
          serverSide: true,
          searching: false,
          deferLoading: 0,
          ajax: {
            url: "./../config/get-data-master.php",
            type: "POST",
            data: function(d) {
              d.bucket = $("#bucket").val();
              d.model = $("#model").val();
              d.style = $("#style").val();
              d.ncvs = $("#ncvs").val();
            }
          },
          columns: [{
              data: "bucket"
            },
            {
              data: "model"
            },
            {
              data: "style"
            },
            {
              data: "ncvs"
            },
            {
              data: "Qty_Order"
            }
          ]
        });

        // Awal tabel kosong
        table.clear().draw();

        // Disable Search kalau bucket kosong
        function toggleSearchBtn() {
          if ($("#bucket").val()) {
            $("#searchBtn").prop("disabled", false);
          } else {
            $("#searchBtn").prop("disabled", true);
          }
        }

        // Cek saat select bucket berubah
        $("#bucket").on("change", function() {
          toggleSearchBtn();
        });

        // Klik Search
        $("#searchBtn").on("click", function() {
          if (!$("#bucket").val()) {
            alert("Harap pilih Bucket terlebih dahulu!");
            return;
          }
          table.ajax.reload();
        });

        // Klik Reset
        $("#resetBtn").on("click", function() {
          $("#filterForm")[0].reset();
          $(".select2-remote").val(null).trigger("change");
          table.clear().draw();
          toggleSearchBtn();
        });

        // Jalankan sekali pas awal load
        toggleSearchBtn();
      });
    });
  </script>

</body>

</html>