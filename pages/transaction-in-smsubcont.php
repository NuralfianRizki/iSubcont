<?php
// menghubungkan php dengan koneksi database
require_once __DIR__ . '/../config/function.php';
require_once __DIR__ . '/../config/auth.php';
checkAuth('scan_in_smsubcont'); // cek apakah sudah login dan punya akses ke menu ini

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

  .fade-in {
    animation: fadeIn 0.4s ease;
  }

  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(10px);
    }

    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .success-card {
    border-radius: 18px;
    overflow: hidden;
  }

  .success-icon {
    font-size: 50px;
    color: #198754;
    line-height: 1;
  }

  .flow-box {
    background: #f8f9fa;
    border-radius: 16px;
    padding: 20px;
    text-align: center;
  }

  .flow-prev {
    color: #6c757d;
    font-size: 14px;
  }

  .flow-arrow {
    font-size: 22px;
    color: #0d6efd;
    margin: 8px 0;
  }

  .flow-current {
    font-size: 22px;
    font-weight: 700;
    color: #0d6efd;
  }

  .detail-box {
    background: #f8f9fa;
    border-radius: 14px;
    padding: 18px;
    text-align: center;
    height: 100%;
  }

  .detail-label {
    font-size: 13px;
    color: #6c757d;
    margin-bottom: 8px;
  }

  .detail-value {
    font-size: 22px;
    font-weight: 700;
    color: #212529;
  }

  .qty-highlight {
    color: #198754;
    font-size: 30px;
  }

  .size-wrapper {
    background: #f8f9fa;
    border-radius: 16px;
    padding: 20px;
  }

  .size-title {
    font-size: 18px;
    font-weight: 700;
    color: #212529;
  }

  .scan-info {
    border-top: 1px solid #eee;
    padding-top: 15px;

    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;

    color: #6c757d;
    font-size: 14px;
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

</head>

<body>

  <!-- Header -->
  <?php
  $page = 'scan_in_smsubcont';
  include_once __DIR__ . '/../includes/header.php';
  ?>
  <!-- End Header -->

  <main id="main" class="main">

    <div class="pagetitle text-black" style="background-color: #f0e6d2; padding: 10px 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
      <h1 style="font-size: 1.8rem; font-weight: 700; font-family: 'Roboto', sans-serif;">
        Scan-In SM Subcont (After Setting Component)
      </h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <!-- ========== SCAN QR CODE CARD ========== -->
          <div class="card border-0 shadow-sm mb-4">
            <div class="card-body text-center py-5">
              <div class="mb-3 text-primary">
                <i class="bi bi-upc-scan" style="font-size: 3rem;"></i>
              </div>
              <h5 class="fw-semibold mb-4 text-primary"></h5>
              <form action="./../config/function.php" method="post" id="scanForm">
                <input type="hidden" name="action" value="scan_in_sm_subcont">
                <div class="col-md-8 mx-auto">
                  <input type="text" name="barcode" id="barcode"
                    class="form-control form-control-lg text-center"
                    placeholder="Scan barcode here..." autofocus>
                </div>
              </form>
            </div>
          </div>

          <!-- ========== HASIL SCAN SUCCESS ========== -->
          <?php if (isset($_GET['success'])): ?>

            <?php
            $barcode_success = trim($_GET['success']);

            $stmt = $conn->prepare("
      SELECT
          id_trans,
          bucket,
          model,
          style,
          barcode,
          lot,
          size,
          nm_komponen_in,
          is_main_komponen,
          qty_sm_subcont,
          transac_by,
          updated_at
      FROM tbl_transactions
      WHERE barcode = ?
        AND is_main_komponen = 1
        AND last_gate = 'IN_SM_SUBCONT'
      ORDER BY
          bucket ASC,
          model ASC,
          style ASC,
          lot ASC,
          CAST(REPLACE(size, 'T', '') AS UNSIGNED) ASC,
          size ASC,
          id_trans ASC
  ");

            $stmt->bind_param("s", $barcode_success);
            $stmt->execute();

            $result = $stmt->get_result();

            $rows = [];
            $total_qty = 0;
            $unique_lots = [];

            while ($r = $result->fetch_assoc()) {
              $rows[] = $r;

              $total_qty += (float)($r['qty_sm_subcont'] ?? 0);

              if (!empty($r['lot'])) {
                $unique_lots[$r['lot']] = true;
              }
            }

            $stmt->close();

            $first = $rows[0] ?? null;
            $total_rows = count($rows);
            $total_lot = count($unique_lots);
            ?>

            <?php if ($first): ?>

              <div class="card border-0 shadow-sm mb-4 fade-in">
                <div class="card-body p-3 p-md-4">

                  <!-- SUCCESS HEADER -->
                  <div class="rounded-3 p-3 p-md-4 mb-4
                    border border-success-subtle bg-success-subtle">

                    <div class="d-flex align-items-center gap-3">

                      <div class="text-success flex-shrink-0">
                        <i class="bi bi-check-circle-fill"
                          style="font-size: 2.8rem;"></i>
                      </div>

                      <div class="flex-grow-1">
                        <h4 class="fw-bold text-success mb-1">
                          TRANSAKSI BERHASIL
                        </h4>

                        <div class="text-success-emphasis small">
                          Barcode berhasil diproses ke transaksi In SM Subcont.
                        </div>

                        <div class="small text-success-emphasis mt-2">
                          <i class="bi bi-arrow-right-circle me-1"></i>
                          Setting → In SM Subcont
                        </div>
                      </div>

                      <span class="badge text-bg-success d-none d-sm-inline-block">
                        <i class="bi bi-check2 me-1"></i>Success
                      </span>

                    </div>
                  </div>

                  <!-- SUMMARY CARDS -->
                  <div class="row g-3 mb-4">

                    <!-- TOTAL QTY -->
                    <div class="col-12 col-md-6">
                      <div class="card h-100 border-0 bg-light mb-0">
                        <div class="card-body">
                          <div class="d-flex align-items-center gap-3">

                            <div class="rounded-3 bg-success-subtle
                              text-success p-3">
                              <i class="bi bi-box-seam fs-4"></i>
                            </div>

                            <div>
                              <div class="text-secondary small">
                                Total Quantity
                              </div>

                              <div class="fs-3 fw-bold text-success">
                                <?= number_format($total_qty) ?>
                              </div>

                              <div class="text-secondary small">
                                Qty In SM Subcont
                              </div>
                            </div>

                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- TOTAL LOT -->
                    <div class="col-12 col-md-6">
                      <div class="card h-100 border-0 bg-light mb-0">
                        <div class="card-body">
                          <div class="d-flex align-items-center gap-3">

                            <div class="rounded-3 bg-primary-subtle
                              text-primary p-3">
                              <i class="bi bi-layers fs-4"></i>
                            </div>

                            <div>
                              <div class="text-secondary small">
                                Total Lot
                              </div>

                              <div class="fs-3 fw-bold">
                                <?= number_format($total_lot) ?>
                              </div>

                              <div class="text-secondary small">
                                Lot
                              </div>
                            </div>

                          </div>
                        </div>
                      </div>
                    </div>

                  </div>

                  <!-- DETAIL TRANSAKSI -->
                  <div class="card border mb-4">

                    <div class="card-header bg-white py-3">
                      <div class="d-flex justify-content-between
                        align-items-center flex-wrap gap-2">

                        <div>
                          <h5 class="fw-bold mb-1">
                            <i class="bi bi-table me-2 text-primary"></i>
                            Detail Transaksi
                          </h5>

                          <div class="text-secondary small">
                            Rincian Komponen selesai setting berdasarkan bucket,
                            model, style, lot, dan size.
                          </div>
                        </div>

                        <span class="badge rounded-pill text-bg-primary">
                          <?= number_format($total_rows) ?> row data
                        </span>

                      </div>
                    </div>

                    <div class="card-body p-0">

                      <div class="table-responsive">
                        <table class="table table-hover table-striped
                            align-middle mb-0">

                          <thead class="table-light">
                            <tr>
                              <th class="text-center" style="width: 55px;">
                                No.
                              </th>
                              <th>Bucket</th>
                              <th>Model</th>
                              <th>Style</th>
                              <th>Lot</th>
                              <th class="text-center">Size</th>
                              <th>Komponen</th>
                              <th class="text-end">Qty</th>
                            </tr>
                          </thead>

                          <tbody>
                            <?php foreach ($rows as $index => $r): ?>
                              <tr>

                                <!-- NO -->
                                <td class="text-center text-secondary">
                                  <?= $index + 1 ?>
                                </td>

                                <!-- BUCKET -->
                                <td>
                                  <span class="fw-semibold">
                                    <?= htmlspecialchars($r['bucket'] ?? '-') ?>
                                  </span>
                                </td>

                                <!-- MODEL -->
                                <td>
                                  <?= htmlspecialchars($r['model'] ?? '-') ?>
                                </td>

                                <!-- STYLE -->
                                <td>
                                  <?= htmlspecialchars($r['style'] ?? '-') ?>
                                </td>

                                <!-- LOT -->
                                <td>
                                  <span class="fw-semibold">
                                    <?= htmlspecialchars($r['lot'] ?? '-') ?>
                                  </span>
                                </td>

                                <!-- SIZE -->
                                <td class="text-center">
                                  <span class="badge bg-light text-dark border px-3 py-2">
                                    <?= htmlspecialchars($r['size'] ?? '-') ?>
                                  </span>
                                </td>

                                <!-- KOMPONEN -->
                                <td>
                                  <span class="fw-semibold">
                                    <?= htmlspecialchars(
                                      $r['nm_komponen_in'] ?? '-'
                                    ) ?>
                                  </span>
                                </td>

                                <!-- QTY -->
                                <td class="text-end">
                                  <span class="fw-bold text-success">
                                    <?= number_format(
                                      (float)($r['qty_sm_subcont'] ?? 0)
                                    ) ?>
                                  </span>
                                </td>

                              </tr>
                            <?php endforeach; ?>
                          </tbody>

                          <tfoot class="table-light">
                            <tr>
                              <th colspan="7" class="text-end py-3">
                                TOTAL QUANTITY
                              </th>

                              <th class="text-end text-success py-3">
                                <?= number_format($total_qty) ?>
                              </th>
                            </tr>
                          </tfoot>

                        </table>
                      </div>

                    </div>
                  </div>

                  <!-- INFORMASI TRANSAKSI -->
                  <div class="rounded-3 border p-3">

                    <h6 class="fw-bold mb-3">
                      <i class="bi bi-info-circle me-2 text-primary"></i>
                      Informasi Transaksi
                    </h6>

                    <div class="row g-3">

                      <!-- OPERATOR -->
                      <div class="col-12 col-md-6">
                        <div class="d-flex align-items-start gap-2">

                          <i class="bi bi-person-circle
                          text-secondary fs-5"></i>

                          <div>
                            <div class="text-secondary small">
                              Diproses oleh
                            </div>

                            <div class="fw-semibold">
                              <?= htmlspecialchars(
                                $first['transac_by'] ?? '-'
                              ) ?>
                            </div>
                          </div>

                        </div>
                      </div>

                      <!-- WAKTU -->
                      <div class="col-12 col-md-6">
                        <div class="d-flex align-items-start gap-2">

                          <i class="bi bi-clock-history
                          text-secondary fs-5"></i>

                          <div>
                            <div class="text-secondary small">
                              Waktu transaksi
                            </div>

                            <div class="fw-semibold">
                              <?php
                              $timestamp = strtotime(
                                $first['updated_at'] ?? ''
                              );

                              echo $timestamp
                                ? date('d M Y, H:i', $timestamp)
                                : '-';
                              ?>
                            </div>
                          </div>

                        </div>
                      </div>

                    </div>
                  </div>

                </div>
              </div>

            <?php else: ?>

              <div class="alert alert-warning border-0 shadow-sm">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                Detail transaksi tidak ditemukan untuk barcode ini
                pada gate In SM Subcont.
              </div>

            <?php endif; ?>

          <?php endif; ?>


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
    const barcodeInput = document.getElementById("barcode");
    const scanForm = document.getElementById("scanForm");

    let submitted = false;

    barcodeInput.addEventListener("keydown", function(e) {
      if (e.key === "Enter") {
        e.preventDefault();

        if (submitted) return;
        if (!this.value.trim()) return;

        submitted = true;

        // kunci input biar gak double scan
        this.setAttribute("readonly", true);

        scanForm.submit();
      }
    });
  </script>

</body>

</html>