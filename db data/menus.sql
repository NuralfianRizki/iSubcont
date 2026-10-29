-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2026 pada 01.47
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_isubcont`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `key_name` varchar(100) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `key_name`, `url`, `icon`, `parent_id`, `ordering`, `is_active`) VALUES
(1, 'Master', 'master', '#', 'bi bi-folder', NULL, 6, 1),
(2, 'Master User', 'master_user', 'master-user.php', NULL, 1, 6, 1),
(3, 'Master Vendor', 'master_vendor', 'master-vendor.php', NULL, 1, 6, 1),
(4, 'Master Komponen', 'master_komponen', 'master-komponen.php', NULL, 1, 6, 1),
(5, 'Master Role', 'master_role', 'master-role.php', NULL, 1, 6, 1),
(6, 'Home', 'home', 'index.php', 'bi bi-house', NULL, 1, 1),
(7, 'Archive', 'archive', '#', 'bi bi-archive', NULL, 7, 1),
(8, 'Archive User', 'archive_user', 'archive-user.php', NULL, 7, 7, 1),
(9, 'Archive Role', 'archive_role', 'archive-role.php', NULL, 7, 7, 1),
(10, 'Logging', 'logging', '#', 'bi-clock-history', NULL, 8, 1),
(11, 'Logging User', 'log-user', 'log-user.php', NULL, 10, 8, 1),
(12, 'Logging Upload', 'log-upload', 'log-upload-data.php', NULL, 10, 8, 1),
(13, 'Logging Roles', 'log-roles', 'log-roles.php', NULL, 10, 8, 1),
(14, 'Master Upload Data', 'master-upload', 'master-upload.php', NULL, 1, 6, 1),
(15, 'Logging Activity', 'log-activity', 'log-activity.php', NULL, 10, 8, 1),
(16, 'Archive Vendor', 'archive_vendor', 'archive-vendor.php', NULL, 7, 7, 1),
(17, 'Logging Vendor', 'log-vendor', 'log-vendor.php', NULL, 10, 8, 1),
(18, 'Archive Komponen', 'archive_komponen', 'archive-komponen.php', NULL, 7, 7, 1),
(19, 'Logging Komponen', 'log_komponen', 'log-komponen.php', NULL, 10, 8, 1),
(20, 'Master NCVS', 'master_ncvs', 'master-ncvs.php', NULL, 1, 6, 1),
(21, 'Archive NCVS', 'archive_ncvs', 'archive-ncvs.php', NULL, 7, 7, 1),
(22, 'Logging NCVS', 'log_ncvs', 'log-ncvs.php', NULL, 10, 8, 1),
(23, 'Master Plan Cycle', 'master_plan', 'master-plan.php', NULL, 1, 6, 1),
(25, 'Logging Plan Cycle', 'log_plan', 'log-plan.php', NULL, 10, 8, 1),
(26, 'Master Time', 'master_time', 'master-time.php', NULL, 1, 6, 1),
(27, 'Logging Time', 'log_time', 'log-time.php', NULL, 10, 8, 1),
(28, 'Transactions', 'transactions', '#', 'bi bi-arrows-collapse', NULL, 3, 1),
(29, 'Dashboards', 'dashboards', '#', 'bi bi-card-list', NULL, 4, 1),
(30, 'Reports', 'report', '#', 'bi bi-file-bar-graph', NULL, 5, 1),
(31, 'Create Barcode', 'trans_barcode', 'transaction-barcode.php', NULL, 28, 1, 1),
(32, 'Approval', 'approval', '#', 'bi-check2-square', NULL, 2, 1),
(33, 'Approval Lead', 'approval_lead', 'approval-lead.php', NULL, 32, 2, 1),
(34, 'WH Incoming', 'scan_in_warehouse', 'trans-scan-in-wh.php', NULL, 28, 4, 1),
(35, 'WH → Vendor', 'scan_out_to_vendor', 'trans-scan-out-to-vendor.php', NULL, 28, 5, 1),
(36, 'Vendor Incoming', 'scan_in_vendor', 'trans-scan-in-vendor.php', NULL, 28, 6, 1),
(37, 'Vendor → WH', 'scan_out_vendor', 'trans-scan-out-vendor.php', NULL, 28, 7, 1),
(38, 'WH Return', 'scan_in_incoming', 'trans-scan-in-incoming.php', NULL, 28, 8, 1),
(39, 'Scan Check QC', 'scan_check_qc', 'trans-scan-check-qc.php', NULL, 28, 9, 1),
(40, 'WH → SM', 'scan_out_prod', 'trans-scan-out-to-prod.php', NULL, 28, 10, 1),
(41, 'Subcont Out Control', 'out_control', 'reports-out-control.php', NULL, 30, 3, 1),
(43, 'Master Defect', 'master_defect', 'master-defect.php', NULL, 1, 6, 1),
(44, 'Archive Defect', 'archive_defect', 'archive-defect.php', NULL, 7, 7, 1),
(45, 'Log Defect', 'log_defect', 'log-defect.php', NULL, 10, 8, 1),
(46, 'Konfirmasi Kekurangan', 'konfirmasi_kekurangan', 'trans-confrm-kekurangan.php', NULL, 28, 12, 1),
(47, 'Tracking Status', 'tracking_status', 'dashboard-tracking.php', NULL, 29, 8, 1),
(48, 'Lot Basis per Line', 'lot_basis', 'dashboard-lot-basis.php', NULL, 29, 3, 1),
(49, 'General Status', 'general_status', 'reports-general-status.php', NULL, 30, 1, 1),
(50, 'WIP', 'wip', 'dashb-wip.php', NULL, 29, 7, 1),
(51, 'Cutting → SM', 'scan_in_smsubcont', 'trans-scan-in-smsubcont.php', NULL, 28, 2, 1),
(52, 'SM → WH', 'scan_out_smsubcont', 'trans-scan-out-smsubcont.php', NULL, 28, 3, 1),
(53, 'SM Return', 'scan_in_prod_from_wh', 'trans-scan-in-prod-smsubcont.php', NULL, 28, 11, 1),
(55, 'Production Dashboard', 'prod_dashboard', 'dashboard-production.php', NULL, 29, 1, 1),
(56, 'SM → Production', 'sm_out_to_prod', 'trans-scan-out-smsubcont-to-prod.php', NULL, 28, 13, 1),
(57, 'Warehouse Dashboard', 'wh_dashboard', 'dashboard-warehouse.php', NULL, 29, 2, 1),
(58, 'Actual Hourly Output', 'actual_dashboard', 'dashboard-hourly-output.php', NULL, 29, 5, 1),
(59, 'History Hourly Output', 'history_dashboard', 'dashboard-history-output.php', NULL, 29, 6, 1),
(60, 'Lot Basis Warehouse', 'lot_basis_wh', 'dashboard-lot-basis-wh.php', NULL, 29, 4, 1),
(61, 'Cetak Ulang Struk', 'reprint-barcode', 'reports-reprint-barcode.php', NULL, 30, 2, 1),
(62, 'Quantity Fulfillment', 'qty_fulfillment', 'transaction-qty-fulfillment.php', NULL, 28, 14, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
