-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2026 pada 01.52
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `gate_type` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `gate_type`, `description`, `is_deleted`, `updated_by`, `timestamp`) VALUES
(1, 'SUPERADMIN', 'SUPERADMIN', '', 0, 'Rizki Zakaria', '2025-09-19 01:19:23'),
(2, 'WS Warehouse', 'WS Warehouse', '', 0, 'Rizki Zakaria', '2026-07-24 07:38:43'),
(3, 'WS Pengiriman', 'WS Pengiriman', '', 0, 'Rizki Zakaria', '2026-07-20 03:06:38'),
(4, 'OFFICE', 'OFFICE', '', 0, 'Rizki Zakaria', '2025-11-19 02:17:55'),
(5, 'ADMIN', 'ADMIN', '', 0, 'Rizki Zakaria', '2026-01-15 03:18:40'),
(6, 'WS Cutting 1', 'WS Cutting 1', '', 0, 'Rizki Zakaria', '2026-07-16 03:52:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `menu_id`, `allowed`, `updated_by`, `timestamp`) VALUES
(997, 4, 6, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(998, 4, 32, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(999, 4, 33, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1000, 4, 29, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1001, 4, 47, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1002, 4, 48, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1003, 4, 50, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1004, 4, 30, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1005, 4, 41, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1006, 4, 49, 1, 'Rizki Zakaria', '2025-12-03 02:05:25'),
(1041, 5, 6, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1042, 5, 32, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1043, 5, 33, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1044, 5, 28, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1045, 5, 31, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1046, 5, 34, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1047, 5, 35, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1048, 5, 38, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1049, 5, 40, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1050, 5, 46, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1051, 5, 29, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1052, 5, 47, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1053, 5, 48, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1054, 5, 50, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1055, 5, 30, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1056, 5, 41, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1057, 5, 49, 1, 'Rizki Zakaria', '2026-01-12 02:52:56'),
(1674, 3, 6, 1, 'Rizki Zakaria', '2026-07-20 03:07:42'),
(1675, 3, 28, 1, 'Rizki Zakaria', '2026-07-20 03:07:42'),
(1676, 3, 52, 1, 'Rizki Zakaria', '2026-07-20 03:07:42'),
(1677, 3, 29, 1, 'Rizki Zakaria', '2026-07-20 03:07:42'),
(1678, 3, 55, 1, 'Rizki Zakaria', '2026-07-20 03:07:42'),
(1679, 3, 30, 1, 'Rizki Zakaria', '2026-07-20 03:07:42'),
(1680, 3, 49, 1, 'Rizki Zakaria', '2026-07-20 03:07:42'),
(1681, 2, 6, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1682, 2, 28, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1683, 2, 34, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1684, 2, 35, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1685, 2, 38, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1686, 2, 40, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1687, 2, 29, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1688, 2, 55, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1689, 2, 30, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(1690, 2, 49, 1, 'Rizki Zakaria', '2026-07-24 07:39:27'),
(2083, 1, 1, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2084, 1, 2, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2085, 1, 3, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2086, 1, 4, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2087, 1, 5, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2088, 1, 14, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2089, 1, 20, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2090, 1, 23, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2091, 1, 26, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2092, 1, 43, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2093, 1, 6, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2094, 1, 7, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2095, 1, 8, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2096, 1, 9, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2097, 1, 16, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2098, 1, 18, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2099, 1, 21, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2100, 1, 44, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2101, 1, 10, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2102, 1, 11, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2103, 1, 12, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2104, 1, 13, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2105, 1, 15, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2106, 1, 17, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2107, 1, 19, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2108, 1, 22, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2109, 1, 25, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2110, 1, 27, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2111, 1, 45, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2112, 1, 28, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2113, 1, 31, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2114, 1, 51, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2115, 1, 34, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2116, 1, 35, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2117, 1, 38, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2118, 1, 53, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2119, 1, 56, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2120, 1, 62, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2121, 1, 29, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2122, 1, 55, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2123, 1, 57, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2124, 1, 48, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2125, 1, 60, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2126, 1, 58, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2127, 1, 59, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2128, 1, 50, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2129, 1, 47, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2130, 1, 30, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2131, 1, 49, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2132, 1, 61, 1, 'Rizki Zakaria', '2026-10-28 04:25:26'),
(2133, 6, 6, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2134, 6, 28, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2135, 6, 51, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2136, 6, 53, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2137, 6, 56, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2138, 6, 62, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2139, 6, 29, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2140, 6, 55, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2141, 6, 30, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2142, 6, 49, 1, 'Rizki Zakaria', '2026-10-28 06:31:11'),
(2143, 6, 61, 1, 'Rizki Zakaria', '2026-10-28 06:31:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barcode_merge`
--

CREATE TABLE `tbl_barcode_merge` (
  `id` int(11) NOT NULL,
  `barcode_parent` varchar(50) DEFAULT NULL,
  `barcode_child` varchar(50) DEFAULT NULL,
  `job_order` varchar(50) DEFAULT NULL,
  `lot` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_defect`
--

CREATE TABLE `tbl_defect` (
  `id_defect` int(11) NOT NULL,
  `defect` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_komponen`
--

CREATE TABLE `tbl_komponen` (
  `id_komponen` int(11) NOT NULL,
  `model` varchar(50) NOT NULL,
  `style` varchar(15) NOT NULL,
  `nama_komponen` varchar(200) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_komponen`
--

INSERT INTO `tbl_komponen` (`id_komponen`, `model`, `style`, `nama_komponen`, `is_deleted`, `updated_by`, `timestamp`) VALUES
(1, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Vamp Set', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(2, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Vamp', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(3, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Collar Rf Medial', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(4, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Collar Rf Lateral', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(5, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tip Skin', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(6, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tip Skin Olay', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(7, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Quarter Skin Medial', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(8, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Quarter Skin Lateral', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(9, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Quarter Medial Skin Olay', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(10, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Quarter Lateral Skin Olay', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(11, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tip Backing Medial', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(12, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tip Backing Lateral', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(13, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tip Backing', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(14, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Eyestay Skin Medial', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(15, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Eyestay Skin Lateral', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(16, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Eyestay Lining Medial', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(17, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Eyestay Lining Lateral', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(18, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Eyestay Rf Medial', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(19, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Eyestay Rf Lateral', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(20, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Swoosh Lateral', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(21, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Swoosh Medial', 0, 'Rizki Zakaria', '2026-07-15 07:10:41'),
(22, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tongue Set', 0, 'Rizki Zakaria', '2026-07-15 07:11:16'),
(23, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tongue Top', 0, 'Rizki Zakaria', '2026-07-15 07:11:16'),
(24, 'NIKE S.T. DYNAMITE MB (PS)', 'IZ1704-100', 'Tongue Logo', 0, 'Rizki Zakaria', '2026-07-15 07:11:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_komponen_proses`
--

CREATE TABLE `tbl_komponen_proses` (
  `id_proses` int(11) NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  `id_input` int(11) NOT NULL,
  `id_output` int(11) NOT NULL,
  `is_main` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_komponen_proses`
--

INSERT INTO `tbl_komponen_proses` (`id_proses`, `id_group`, `id_input`, `id_output`, `is_main`) VALUES
(1, 2, 2, 1, 1),
(2, 2, 3, 1, 0),
(3, 2, 4, 1, 0),
(4, 2, 5, 1, 0),
(5, 2, 6, 1, 0),
(6, 2, 7, 1, 0),
(7, 2, 8, 1, 0),
(8, 2, 9, 1, 0),
(9, 2, 10, 1, 0),
(10, 2, 11, 1, 0),
(11, 2, 12, 1, 0),
(12, 2, 13, 1, 0),
(13, 2, 14, 1, 0),
(14, 2, 15, 1, 0),
(15, 2, 16, 1, 0),
(16, 2, 17, 1, 0),
(17, 2, 18, 1, 0),
(18, 2, 19, 1, 0),
(19, 2, 20, 1, 0),
(20, 2, 21, 1, 0),
(21, 23, 23, 22, 1),
(22, 23, 24, 22, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_data`
--

CREATE TABLE `tbl_master_data` (
  `id_data_master` int(11) NOT NULL,
  `job_order` varchar(50) NOT NULL,
  `bucket` varchar(10) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `po_item` varchar(50) NOT NULL,
  `style` varchar(10) NOT NULL,
  `model` varchar(50) NOT NULL,
  `ncvs` varchar(10) NOT NULL,
  `qr_code` varchar(100) NOT NULL,
  `lot` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `status_lot` varchar(100) NOT NULL,
  `date_updated` date NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_master_data`
--

INSERT INTO `tbl_master_data` (`id_data_master`, `job_order`, `bucket`, `po_code`, `po_item`, `style`, `model`, `ncvs`, `qr_code`, `lot`, `size`, `qty`, `status_lot`, `date_updated`, `timestamp`) VALUES
(1, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '001', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(2, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '01T', '6', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(3, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '002', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(4, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '02T', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(5, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '003', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(6, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '011', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(7, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '012', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(8, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '013', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(9, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '001', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(10, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '01T', '6', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(11, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '002', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(12, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '02T', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(13, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '003', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(14, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '011', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(15, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '012', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(16, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '013', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(17, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '001', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(18, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '01T', '6', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(19, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '002', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(20, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '02T', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(21, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '003', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(22, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '011', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(23, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '012', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(24, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '013', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(25, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '001', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(26, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '01T', '6', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(27, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '002', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(28, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '02T', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(29, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '003', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(30, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '011', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(31, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '012', '30', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(32, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '013', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(33, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '001', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(34, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '01T', '12', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(35, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '002', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(36, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '02T', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(37, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '003', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(38, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '011', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(39, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '012', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(40, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '013', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(41, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '001', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(42, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '01T', '12', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(43, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '002', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(44, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '02T', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(45, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '003', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(46, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '011', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(47, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '012', '24', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(48, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '013', '42', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(49, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '001', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(50, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '01T', '12', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(51, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '002', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(52, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '02T', '12', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(53, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '003', '36', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(54, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '011', '18', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(55, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '012', '30', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(56, '0803-107-1', '260803SO', '6210913013', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '013', '12', 'IA260803-00027', '2026-07-14', '2026-07-14 07:16:52'),
(57, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '001', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(58, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '01T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(59, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '002', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(60, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '02T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(61, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '003', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(62, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '011', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(63, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '012', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(64, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '013', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(65, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '13T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(66, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '001', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(67, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '01T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(68, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '002', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(69, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '02T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(70, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '003', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(71, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '011', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(72, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '012', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(73, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '013', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(74, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '13T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(75, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '001', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(76, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '01T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(77, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '002', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(78, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '02T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(79, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '003', '36', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(80, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '011', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(81, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '012', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(82, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '013', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(83, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '13T', '18', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(84, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '001', '32', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(85, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '01T', '16', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(86, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '002', '32', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(87, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '02T', '16', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(88, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '003', '32', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(89, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '011', '16', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(90, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '012', '16', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(91, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '013', '16', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(92, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '13T', '16', 'MSR 12 (IA260803-00028)', '2026-07-14', '2026-07-14 07:16:52'),
(551, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '001', '7', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(552, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '01T', '2', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(553, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '002', '8', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(554, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '02T', '4', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(555, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '003', '9', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(556, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '10T', '2', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(557, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '011', '8', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(558, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '11T', '3', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(559, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '012', '8', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(560, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '12T', '3', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(561, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '013', '11', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(562, '0810-107-1', '260810SO', '3504085488', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '1', '13T', '4', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(563, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '001', '42', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(564, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '002', '54', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(565, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '003', '54', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(566, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '011', '18', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(567, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '012', '24', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(568, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '2', '013', '36', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(569, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '001', '10', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(570, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '002', '12', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(571, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '003', '13', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(572, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '011', '6', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(573, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '012', '4', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(574, '0810-107-2', '260810SO', '6210896589', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '3', '013', '8', 'CHINA ORDER (IA260810-00053)', '2026-07-20', '2026-07-20 02:29:43'),
(575, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '001', '36', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(576, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '002', '36', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(577, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '02T', '6', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(578, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '003', '42', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(579, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '011', '30', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(580, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '012', '36', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(581, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '4', '013', '42', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(582, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '001', '12', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(583, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '002', '12', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(584, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '003', '12', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(585, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '011', '6', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(586, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '012', '12', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(587, '0810-107-3', '260810SO', '6210911523', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '5', '013', '6', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(588, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '001', '42', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(589, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '01T', '5', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(590, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '002', '36', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(591, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '003', '3', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(592, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '10T', '6', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(593, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '011', '18', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(594, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '11T', '12', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(595, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '012', '18', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(596, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '12T', '18', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(597, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '013', '30', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(598, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '6', '13T', '24', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(599, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '002', '3', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(600, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '10T', '6', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(601, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '11T', '5', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(602, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '012', '4', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(603, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '12T', '2', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(604, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '013', '3', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(605, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '7', '13T', '2', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(606, '0810-107-4', '260810SO', '6210902502', '200', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '8', '10T', '4', 'IA260810-00053', '2026-07-20', '2026-07-20 02:29:43'),
(607, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '001', '48', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(608, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '002', '54', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(609, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '003', '36', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(610, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '011', '18', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(611, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '012', '24', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(612, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '9', '013', '48', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(613, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '002', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(614, '0810-107-5', '260810SO', '3504081822', '30', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '10', '011', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(615, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '001', '54', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(616, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '01T', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(617, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '002', '42', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(618, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '02T', '12', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(619, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '11', '003', '72', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(620, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '12', '003', '72', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(621, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '13', '003', '72', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(622, '0810-107-6', '260810SO', '4511078669', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '14', '003', '12', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(623, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '15', '001', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(624, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '15', '002', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(625, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '15', '003', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(626, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '15', '011', '18', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(627, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '15', '012', '30', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(628, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '15', '013', '36', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(629, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '16', '001', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(630, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '16', '002', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(631, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '16', '003', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(632, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '16', '011', '24', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(633, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '16', '012', '30', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(634, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '16', '013', '36', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(635, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '17', '001', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(636, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '17', '002', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(637, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '17', '003', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(638, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '17', '011', '24', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(639, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '17', '012', '30', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(640, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '17', '013', '36', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(641, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '18', '001', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(642, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '18', '002', '48', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(643, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '18', '003', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(644, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '18', '011', '12', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(645, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '18', '012', '36', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(646, '0810-107-7', '260810SO', '6210911533', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '18', '013', '36', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(647, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '19', '001', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(648, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '19', '002', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(649, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '19', '003', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(650, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '19', '011', '24', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(651, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '19', '012', '36', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(652, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '19', '013', '42', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(653, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '20', '001', '12', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(654, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '20', '002', '12', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(655, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '20', '003', '12', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(656, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '20', '011', '12', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(657, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '20', '012', '6', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(658, '0810-107-8', '260810SO', '6210911537', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '20', '013', '12', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(659, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '001', '24', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(660, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '01T', '18', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(661, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '002', '24', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(662, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '02T', '12', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(663, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '003', '24', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(664, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '011', '42', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(665, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '012', '42', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(666, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '21', '013', '42', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(667, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '22', '001', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(668, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '22', '01T', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(669, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '22', '002', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(670, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '22', '02T', '12', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(671, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '22', '003', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(672, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '22', '013', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(673, '0810-107-9', '260810SO', '4511075641', '20', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '23', '02T', '6', 'IA260810-00039', '2026-07-20', '2026-07-20 07:47:19'),
(674, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '001', '4', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(675, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '01T', '1', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(676, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '002', '4', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(677, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '02T', '2', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(678, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '003', '5', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(679, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '10T', '1', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(680, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '011', '4', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(681, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '11T', '1', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(682, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '012', '4', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(683, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '12T', '1', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(684, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '013', '6', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(685, '0810-107-10', '260810SO', '3504085483', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '24', '13T', '2', 'IA260810-00046', '2026-07-20', '2026-07-20 07:47:19'),
(686, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '25', '001', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(687, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '25', '002', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(688, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '25', '003', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(689, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '25', '011', '24', '', '2026-07-20', '2026-07-20 07:47:19'),
(690, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '25', '012', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(691, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '25', '013', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(692, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '26', '001', '18', '', '2026-07-20', '2026-07-20 07:47:19'),
(693, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '26', '002', '18', '', '2026-07-20', '2026-07-20 07:47:19'),
(694, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '26', '003', '12', '', '2026-07-20', '2026-07-20 07:47:19'),
(695, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '26', '011', '6', '', '2026-07-20', '2026-07-20 07:47:19'),
(696, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '26', '012', '12', '', '2026-07-20', '2026-07-20 07:47:19'),
(697, '0810-107-11', '260810SO', '6210911569', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '26', '013', '12', '', '2026-07-20', '2026-07-20 07:47:19'),
(698, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '27', '001', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(699, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '27', '002', '48', '', '2026-07-20', '2026-07-20 07:47:19'),
(700, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '27', '003', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(701, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '27', '011', '24', '', '2026-07-20', '2026-07-20 07:47:19'),
(702, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '27', '012', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(703, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '27', '013', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(704, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '28', '001', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(705, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '28', '002', '48', '', '2026-07-20', '2026-07-20 07:47:19'),
(706, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '28', '003', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(707, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '28', '011', '24', '', '2026-07-20', '2026-07-20 07:47:19'),
(708, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '28', '012', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(709, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '28', '013', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(710, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '29', '001', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(711, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '29', '002', '48', '', '2026-07-20', '2026-07-20 07:47:19'),
(712, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '29', '003', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(713, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '29', '011', '24', '', '2026-07-20', '2026-07-20 07:47:19'),
(714, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '29', '012', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(715, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '29', '013', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(716, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '30', '001', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(717, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '30', '002', '36', '', '2026-07-20', '2026-07-20 07:47:19'),
(718, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '30', '003', '48', '', '2026-07-20', '2026-07-20 07:47:19'),
(719, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '30', '011', '18', '', '2026-07-20', '2026-07-20 07:47:19'),
(720, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '30', '012', '30', '', '2026-07-20', '2026-07-20 07:47:19'),
(721, '0810-107-12', '260810SO', '6210911571', '100', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '30', '013', '42', '', '2026-07-20', '2026-07-20 07:47:19'),
(722, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '001', '3', '', '2026-07-20', '2026-07-20 07:47:19'),
(723, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '01T', '1', '', '2026-07-20', '2026-07-20 07:47:19'),
(724, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '002', '3', '', '2026-07-20', '2026-07-20 07:47:19'),
(725, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '02T', '2', '', '2026-07-20', '2026-07-20 07:47:19'),
(726, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '003', '3', '', '2026-07-20', '2026-07-20 07:47:19'),
(727, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '10T', '1', '', '2026-07-20', '2026-07-20 07:47:19'),
(728, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '011', '3', '', '2026-07-20', '2026-07-20 07:47:19'),
(729, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '11T', '1', '', '2026-07-20', '2026-07-20 07:47:19'),
(730, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '012', '3', '', '2026-07-20', '2026-07-20 07:47:19'),
(731, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '12T', '1', '', '2026-07-20', '2026-07-20 07:47:19'),
(732, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '013', '4', '', '2026-07-20', '2026-07-20 07:47:19'),
(733, '0810-107-13', '260810SO', '3504085476', '10', 'IZ1703-011', 'NIKE S.T. DYNAMITE MB (PS)', '107', '', '31', '13T', '2', '', '2026-07-20', '2026-07-20 07:47:19'),
(734, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '001', '30', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(735, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '01T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30');
INSERT INTO `tbl_master_data` (`id_data_master`, `job_order`, `bucket`, `po_code`, `po_item`, `style`, `model`, `ncvs`, `qr_code`, `lot`, `size`, `qty`, `status_lot`, `date_updated`, `timestamp`) VALUES
(736, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '002', '24', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(737, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '02T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(738, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '003', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(739, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '10T', '12', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(740, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '011', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(741, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '11T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(742, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '012', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(743, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '12T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(744, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '013', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(745, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '13T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(746, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '01T', '12', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(747, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '002', '6', 'IA261026-00057', '2026-10-21', '2026-10-21 07:31:30'),
(748, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '001', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(749, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '01T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(750, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(751, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '02T', '5', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(752, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '003', '54', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(753, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(754, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '11T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(755, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(756, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '12T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(757, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(758, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '13T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(759, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(760, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '01T', '1', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(761, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(762, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(763, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(764, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(765, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '12T', '1', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(766, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(767, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(768, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(769, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(770, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(771, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(772, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(773, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(774, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(775, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(776, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(777, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(778, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(779, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(780, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(781, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(782, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(783, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(784, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(785, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(786, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(787, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(788, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(789, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(790, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(791, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(792, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(793, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(794, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(795, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(796, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(797, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(798, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(799, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(800, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(801, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(802, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(803, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(804, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(805, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(806, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(807, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(808, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(809, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(810, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(811, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(812, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(813, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(814, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(815, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(816, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(817, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(818, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(819, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(820, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(821, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '001', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(822, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(823, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(824, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(825, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(826, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(827, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '001', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(828, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(829, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(830, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(831, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(832, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(833, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(834, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(835, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(836, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(837, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(838, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(839, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(840, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(841, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(842, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(843, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(844, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(845, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(846, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(847, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(848, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(849, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(850, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(851, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(852, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(853, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '003', '66', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(854, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(855, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(856, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(857, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(858, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(859, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '003', '66', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(860, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(861, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(862, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(863, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(864, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(865, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(866, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(867, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(868, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(869, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(870, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(871, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(872, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(873, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(874, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(875, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(876, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(877, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(878, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(879, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(880, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(881, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(882, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(883, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(884, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(885, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(886, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(887, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(888, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(889, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(890, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(891, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(892, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(893, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(894, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(895, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(896, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(897, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(898, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(899, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(900, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(901, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(902, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(903, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(904, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(905, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '001', '20', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(906, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '002', '16', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(907, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '003', '33', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(908, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '011', '10', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(909, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '012', '3', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(910, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '013', '3', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:31:30'),
(911, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '001', '24', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(912, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '01T', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(913, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '002', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(914, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '02T', '42', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(915, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '003', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(916, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '10T', '6', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(917, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '011', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(918, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '11T', '6', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(919, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '012', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(920, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '12T', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(921, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(922, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '13T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(923, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '001', '24', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(924, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '01T', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(925, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '002', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(926, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '02T', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(927, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '003', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(928, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '10T', '6', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(929, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '011', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(930, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '11T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(931, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '012', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(932, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '12T', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(933, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(934, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '13T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(935, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '001', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(936, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '01T', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(937, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '002', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(938, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '02T', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(939, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '003', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(940, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '10T', '4', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(941, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '011', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(942, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '11T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(943, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '012', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(944, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '12T', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(945, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(946, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '13T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(947, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '001', '19', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(948, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '01T', '21', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(949, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '002', '4', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(950, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '02T', '35', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(951, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '003', '25', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(952, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '011', '1', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(953, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '11T', '2', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(954, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '012', '7', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(955, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '12T', '13', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(956, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '013', '8', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(957, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '13T', '7', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(958, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '001', '23', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(959, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '002', '28', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(960, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '003', '37', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(961, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '011', '8', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(962, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '012', '11', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(963, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:31:30'),
(964, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '001', '16', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(965, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '01T', '9', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(966, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '002', '16', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(967, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '02T', '9', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(968, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '003', '15', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(969, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '10T', '3', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(970, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '011', '8', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(971, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '11T', '6', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(972, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '012', '11', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(973, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '12T', '7', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(974, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '013', '16', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(975, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '13T', '9', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(976, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(977, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(978, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(979, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(980, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(981, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(982, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(983, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(984, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(985, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(986, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(987, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(988, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(989, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(990, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(991, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(992, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(993, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(994, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(995, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(996, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(997, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30');
INSERT INTO `tbl_master_data` (`id_data_master`, `job_order`, `bucket`, `po_code`, `po_item`, `style`, `model`, `ncvs`, `qr_code`, `lot`, `size`, `qty`, `status_lot`, `date_updated`, `timestamp`) VALUES
(998, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(999, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1000, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1001, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1002, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1003, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '011', '18', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1004, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '012', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1005, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1006, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1007, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1008, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1009, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '011', '18', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1010, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '012', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1011, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1012, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1013, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1014, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1015, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '011', '18', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1016, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '012', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1017, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1018, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '001', '20', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1019, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '002', '45', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1020, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '003', '39', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1021, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '011', '10', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1022, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '012', '14', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1023, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '013', '32', 'IA261102-00043', '2026-10-21', '2026-10-21 07:31:30'),
(1024, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '001', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1025, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '002', '48', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1026, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '003', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1027, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '011', '24', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1028, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '012', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1029, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '013', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1030, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '001', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1031, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '002', '48', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1032, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '003', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1033, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '011', '24', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1034, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '012', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1035, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '11', '013', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1036, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '001', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1037, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '002', '48', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1038, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '003', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1039, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '011', '24', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1040, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '012', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1041, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '12', '013', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1042, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '001', '40', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1043, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '002', '45', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1044, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '003', '33', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1045, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '011', '23', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1046, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '012', '18', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1047, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '13', '013', '38', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:31:30'),
(1048, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '001', '28', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(1049, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '002', '31', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(1050, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '003', '30', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(1051, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '011', '6', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(1052, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '012', '26', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(1053, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '14', '013', '30', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:31:30'),
(1054, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '001', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1055, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1056, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1057, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1058, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1059, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '15', '013', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1060, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '001', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1061, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1062, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1063, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1064, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1065, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '16', '013', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1066, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '001', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1067, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1068, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '003', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1069, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '011', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1070, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '012', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1071, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '17', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1072, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '001', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1073, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1074, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '003', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1075, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '011', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1076, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '012', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1077, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '18', '013', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1078, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '001', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1079, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1080, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '003', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1081, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1082, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '012', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1083, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '19', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1084, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '001', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1085, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '01T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1086, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1087, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '02T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1088, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1089, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '011', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1090, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1091, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '20', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1092, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '001', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1093, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '01T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1094, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1095, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '02T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1096, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1097, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '011', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1098, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1099, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '21', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1100, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '001', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1101, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '01T', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1102, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1103, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '02T', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1104, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '003', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1105, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1106, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '012', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1107, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '22', '013', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1108, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1109, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1110, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1111, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1112, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1113, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1114, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1115, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '23', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1116, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1117, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1118, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1119, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1120, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1121, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1122, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1123, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '24', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1124, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1125, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1126, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1127, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1128, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1129, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1130, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1131, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '25', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1132, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1133, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1134, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1135, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1136, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1137, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1138, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1139, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '26', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1140, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1141, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1142, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1143, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1144, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1145, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1146, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1147, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '27', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1148, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1149, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1150, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1151, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1152, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1153, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1154, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1155, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '28', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1156, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1157, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1158, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1159, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1160, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1161, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1162, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1163, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '29', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1164, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1165, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1166, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1167, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1168, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1169, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1170, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1171, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '30', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1172, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '001', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1173, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '01T', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1174, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '002', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1175, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '02T', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1176, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '003', '16', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1177, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '011', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1178, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '012', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1179, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '31', '013', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:31:30'),
(1180, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1181, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1182, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1183, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1184, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1185, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '32', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1186, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1187, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1188, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1189, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1190, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1191, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '33', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1192, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '34', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1193, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '34', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1194, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '34', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1195, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '34', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1196, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '34', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1197, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '34', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1198, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '35', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1199, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '35', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1200, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '35', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1201, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '35', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1202, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '35', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1203, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '35', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1204, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '36', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1205, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '36', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1206, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '36', '003', '48', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1207, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '36', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1208, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '36', '012', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1209, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '36', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1210, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '37', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1211, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '37', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1212, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '37', '003', '48', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1213, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '37', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1214, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '37', '012', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1215, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '37', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1216, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '38', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1217, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '38', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1218, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '38', '003', '48', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1219, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '38', '011', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1220, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '38', '012', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1221, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '38', '013', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1222, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '39', '001', '43', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1223, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '39', '002', '40', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1224, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '39', '003', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1225, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '39', '011', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1226, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '39', '012', '19', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1227, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '39', '013', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:31:30'),
(1228, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '001', '66', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1229, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '01T', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1230, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '002', '7', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1231, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '02T', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1232, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '003', '54', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1233, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '10T', '4', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1234, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '011', '3', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1235, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '11T', '5', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1236, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '012', '4', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1237, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '12T', '6', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1238, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '013', '3', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1239, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '40', '13T', '9', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1240, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '41', '001', '11', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1241, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '41', '01T', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1242, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '41', '02T', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1243, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '41', '003', '11', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1244, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '42', '01T', '16', 'IA261102-00052', '2026-10-21', '2026-10-21 07:31:30'),
(1245, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1246, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1247, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1248, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '011', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1249, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '012', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1250, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '1', '013', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1251, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1252, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1253, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1254, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '011', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1255, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '012', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1256, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '2', '013', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1257, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1258, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1259, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1260, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '011', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1261, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '012', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1262, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '3', '013', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1263, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30');
INSERT INTO `tbl_master_data` (`id_data_master`, `job_order`, `bucket`, `po_code`, `po_item`, `style`, `model`, `ncvs`, `qr_code`, `lot`, `size`, `qty`, `status_lot`, `date_updated`, `timestamp`) VALUES
(1264, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1265, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '003', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1266, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1267, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1268, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '4', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1269, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1270, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1271, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '003', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1272, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1273, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1274, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '5', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1275, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1276, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1277, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '003', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1278, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1279, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1280, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '6', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1281, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1282, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '002', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1283, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1284, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1285, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1286, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '7', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1287, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1288, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '002', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1289, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1290, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1291, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1292, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '8', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1293, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1294, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '002', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1295, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1296, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1297, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1298, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '9', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1299, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '001', '32', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1300, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '002', '44', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1301, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '003', '43', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1302, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '011', '23', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1303, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '012', '22', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1304, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '107', '', '10', '013', '28', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:31:30'),
(1305, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '001', '30', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1306, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '01T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1307, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '002', '24', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1308, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '02T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1309, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '003', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1310, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '10T', '12', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1311, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '011', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1312, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '11T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1313, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '012', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1314, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '12T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1315, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '013', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1316, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '13T', '18', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1317, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '01T', '12', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1318, '1026-107-1', '261026SO', '4511148044', '20', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '002', '6', 'IA261026-00057', '2026-10-21', '2026-10-21 07:34:03'),
(1319, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '001', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1320, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '01T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1321, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1322, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '02T', '5', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1323, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '003', '54', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1324, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1325, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '11T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1326, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1327, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '12T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1328, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1329, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '13T', '6', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1330, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1331, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '01T', '1', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1332, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1333, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1334, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1335, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1336, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '12T', '1', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1337, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1338, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1339, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1340, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1341, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1342, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1343, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1344, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1345, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1346, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1347, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1348, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1349, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1350, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1351, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1352, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1353, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1354, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1355, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1356, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1357, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1358, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1359, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1360, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1361, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1362, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1363, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1364, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1365, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1366, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1367, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1368, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1369, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1370, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1371, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1372, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1373, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1374, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1375, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1376, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1377, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1378, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1379, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1380, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1381, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1382, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1383, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1384, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1385, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1386, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1387, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1388, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1389, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '011', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1390, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1391, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1392, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '001', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1393, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1394, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1395, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1396, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1397, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1398, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '001', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1399, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1400, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1401, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1402, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1403, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1404, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1405, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1406, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1407, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1408, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1409, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1410, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1411, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1412, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1413, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1414, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1415, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1416, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1417, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1418, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1419, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1420, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1421, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1422, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1423, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1424, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '003', '66', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1425, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1426, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1427, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1428, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1429, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1430, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '003', '66', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1431, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1432, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '012', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1433, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1434, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1435, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1436, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1437, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1438, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1439, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1440, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1441, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1442, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1443, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1444, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1445, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1446, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1447, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '002', '48', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1448, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1449, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1450, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1451, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '013', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1452, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1453, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1454, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1455, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1456, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1457, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1458, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1459, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1460, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1461, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1462, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1463, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1464, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1465, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1466, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1467, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1468, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1469, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1470, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '001', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1471, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '002', '42', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1472, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '003', '60', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1473, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '011', '24', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1474, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '012', '30', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1475, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '013', '36', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1476, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '001', '20', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1477, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '002', '16', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1478, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '003', '33', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1479, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '011', '10', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1480, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '012', '3', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1481, '1026-107-2', '261026SO', '6215055867', '400', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '013', '3', 'CHINA ORDER (IA261026-00050)', '2026-10-21', '2026-10-21 07:34:03'),
(1482, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '001', '24', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1483, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '01T', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1484, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '002', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1485, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '02T', '42', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1486, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '003', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1487, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '10T', '6', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1488, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '011', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1489, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '11T', '6', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1490, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '012', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1491, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '12T', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1492, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1493, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '13T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1494, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '001', '24', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1495, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '01T', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1496, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '002', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1497, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '02T', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1498, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '003', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1499, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '10T', '6', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1500, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '011', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1501, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '11T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1502, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '012', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1503, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '12T', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1504, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1505, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '13T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1506, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '001', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1507, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '01T', '30', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1508, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '002', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1509, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '02T', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1510, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '003', '36', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1511, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '10T', '4', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1512, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '011', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1513, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '11T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1514, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '012', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1515, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '12T', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1516, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1517, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '13T', '12', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1518, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '001', '19', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1519, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '01T', '21', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1520, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '002', '4', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1521, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '02T', '35', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03');
INSERT INTO `tbl_master_data` (`id_data_master`, `job_order`, `bucket`, `po_code`, `po_item`, `style`, `model`, `ncvs`, `qr_code`, `lot`, `size`, `qty`, `status_lot`, `date_updated`, `timestamp`) VALUES
(1522, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '003', '25', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1523, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '011', '1', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1524, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '11T', '2', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1525, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '012', '7', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1526, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '12T', '13', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1527, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '013', '8', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1528, '1026-107-3', '261026SO', '6215056358', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '13T', '7', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1529, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '001', '23', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1530, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '002', '28', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1531, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '003', '37', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1532, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '011', '8', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1533, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '012', '11', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1534, '1026-107-4', '261026SO', '6215056718', '200', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '013', '18', 'IA261026-00059', '2026-10-21', '2026-10-21 07:34:03'),
(1535, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '001', '16', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1536, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '01T', '9', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1537, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '002', '16', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1538, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '02T', '9', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1539, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '003', '15', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1540, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '10T', '3', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1541, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '011', '8', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1542, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '11T', '6', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1543, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '012', '11', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1544, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '12T', '7', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1545, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '013', '16', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1546, '1102-107-1', '261102SO', '3504162571', '10', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '13T', '9', 'JAPAN ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1547, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1548, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1549, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1550, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1551, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1552, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1553, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1554, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1555, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1556, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1557, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1558, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1559, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1560, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1561, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1562, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1563, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1564, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1565, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1566, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1567, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1568, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '011', '24', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1569, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '012', '30', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1570, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1571, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1572, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1573, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1574, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '011', '18', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1575, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '012', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1576, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1577, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1578, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1579, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1580, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '011', '18', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1581, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '012', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1582, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1583, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '001', '42', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1584, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '002', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1585, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '003', '48', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1586, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '011', '18', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1587, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '012', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1588, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '013', '36', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1589, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '001', '20', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1590, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '002', '45', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1591, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '003', '39', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1592, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '011', '10', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1593, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '012', '14', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1594, '1102-107-2', '261102SO', '6215764684', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '013', '32', 'IA261102-00043', '2026-10-21', '2026-10-21 07:34:03'),
(1595, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '001', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1596, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '002', '48', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1597, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '003', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1598, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '011', '24', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1599, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '012', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1600, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '013', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1601, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '001', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1602, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '002', '48', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1603, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '003', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1604, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '011', '24', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1605, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '012', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1606, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '11', '013', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1607, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '001', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1608, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '002', '48', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1609, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '003', '42', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1610, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '011', '24', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1611, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '012', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1612, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '12', '013', '36', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1613, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '001', '40', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1614, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '002', '45', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1615, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '003', '33', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1616, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '011', '23', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1617, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '012', '18', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1618, '1102-107-3', '261102SO', '6215764686', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '13', '013', '38', 'CHINA ORDER (IA261102-00044)', '2026-10-21', '2026-10-21 07:34:03'),
(1619, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '001', '28', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1620, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '002', '31', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1621, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '003', '30', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1622, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '011', '6', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1623, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '012', '26', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1624, '1102-107-4', '261102SO', '6215764684', '300', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '14', '013', '30', 'CHINA ORDER (IA261102-00043)', '2026-10-21', '2026-10-21 07:34:03'),
(1625, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '001', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1626, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1627, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1628, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1629, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1630, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '15', '013', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1631, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '001', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1632, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1633, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1634, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1635, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1636, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '16', '013', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1637, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '001', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1638, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1639, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '003', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1640, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '011', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1641, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '012', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1642, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '17', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1643, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '001', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1644, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1645, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '003', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1646, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '011', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1647, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '012', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1648, '1102-107-5', '261102SO', '6215790730', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '18', '013', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1649, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '001', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1650, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '002', '48', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1651, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '003', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1652, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1653, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '012', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1654, '1102-107-6', '261102SO', '6215790731', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '19', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1655, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '001', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1656, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '01T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1657, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1658, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '02T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1659, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1660, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '011', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1661, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1662, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '20', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1663, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '001', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1664, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '01T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1665, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1666, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '02T', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1667, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '003', '42', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1668, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '011', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1669, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '012', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1670, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '21', '013', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1671, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '001', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1672, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '01T', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1673, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '002', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1674, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '02T', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1675, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '003', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1676, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '011', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1677, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '012', '18', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1678, '1102-107-7', '261102SO', '6215790770', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '22', '013', '24', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1679, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1680, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1681, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1682, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1683, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1684, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1685, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1686, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '23', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1687, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1688, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1689, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1690, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1691, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1692, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1693, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1694, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '24', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1695, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1696, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1697, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1698, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1699, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1700, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1701, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1702, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '25', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1703, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1704, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1705, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1706, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1707, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1708, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1709, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1710, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '26', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1711, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1712, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1713, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1714, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1715, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1716, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1717, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1718, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '27', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1719, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1720, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1721, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1722, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1723, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1724, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1725, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1726, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '28', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1727, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1728, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1729, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1730, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1731, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1732, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1733, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1734, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '29', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1735, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '001', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1736, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '01T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1737, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '002', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1738, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '02T', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1739, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '003', '48', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1740, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '011', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1741, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '012', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1742, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '30', '013', '24', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1743, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '001', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1744, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '01T', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1745, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '002', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1746, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '02T', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1747, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '003', '16', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1748, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '011', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1749, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '012', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1750, '1102-107-8', '261102SO', '6215790774', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '31', '013', '8', 'MSR 9 (IA261102-00054)', '2026-10-21', '2026-10-21 07:34:03'),
(1751, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1752, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1753, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1754, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1755, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1756, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '32', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1757, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1758, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1759, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1760, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1761, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1762, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '33', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1763, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '34', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1764, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '34', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1765, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '34', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1766, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '34', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1767, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '34', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1768, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '34', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1769, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '35', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1770, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '35', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1771, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '35', '003', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1772, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '35', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1773, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '35', '012', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1774, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '35', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1775, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '36', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1776, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '36', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1777, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '36', '003', '48', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1778, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '36', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1779, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '36', '012', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1780, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '36', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1781, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '37', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1782, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '37', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1783, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '37', '003', '48', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1784, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '37', '011', '24', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1785, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '37', '012', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1786, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '37', '013', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1787, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '38', '001', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1788, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '38', '002', '42', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03');
INSERT INTO `tbl_master_data` (`id_data_master`, `job_order`, `bucket`, `po_code`, `po_item`, `style`, `model`, `ncvs`, `qr_code`, `lot`, `size`, `qty`, `status_lot`, `date_updated`, `timestamp`) VALUES
(1789, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '38', '003', '48', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1790, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '38', '011', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1791, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '38', '012', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1792, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '38', '013', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1793, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '39', '001', '43', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1794, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '39', '002', '40', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1795, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '39', '003', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1796, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '39', '011', '30', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1797, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '39', '012', '19', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1798, '1102-107-9', '261102SO', '6215790794', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '39', '013', '36', 'IA261102-00091', '2026-10-21', '2026-10-21 07:34:03'),
(1799, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '001', '66', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1800, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '01T', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1801, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '002', '7', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1802, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '02T', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1803, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '003', '54', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1804, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '10T', '4', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1805, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '011', '3', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1806, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '11T', '5', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1807, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '012', '4', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1808, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '12T', '6', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1809, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '013', '3', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1810, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '40', '13T', '9', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1811, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '41', '001', '11', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1812, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '41', '01T', '36', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1813, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '41', '02T', '30', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1814, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '41', '003', '11', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1815, '1102-107-10', '261102SO', '6215791529', '100', 'IV5650-002', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '42', '01T', '16', 'IA261102-00052', '2026-10-21', '2026-10-21 07:34:03'),
(1816, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1817, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1818, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1819, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '011', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1820, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '012', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1821, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '1', '013', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1822, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1823, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1824, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1825, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '011', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1826, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '012', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1827, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '2', '013', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1828, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1829, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1830, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1831, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '011', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1832, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '012', '24', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1833, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '3', '013', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1834, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1835, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1836, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '003', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1837, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1838, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1839, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '4', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1840, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1841, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1842, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '003', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1843, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1844, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1845, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '5', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1846, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1847, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '002', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1848, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '003', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1849, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1850, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1851, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '6', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1852, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1853, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '002', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1854, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1855, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1856, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1857, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '7', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1858, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1859, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '002', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1860, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1861, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1862, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1863, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '8', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1864, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '001', '36', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1865, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '002', '48', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1866, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '003', '54', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1867, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '011', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1868, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '012', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1869, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '9', '013', '30', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1870, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '001', '32', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1871, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '002', '44', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1872, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '003', '43', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1873, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '011', '23', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1874, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '012', '22', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03'),
(1875, '1102-107-21', '261102SO', '6215055867', '700', 'IV5650-111', 'NIKE S.T. DYNAMITE CM (PS)', '115', '', '10', '013', '28', 'CHINA ORDER (IA261102-00051)', '2026-10-21', '2026-10-21 07:34:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_ncvs`
--

CREATE TABLE `tbl_ncvs` (
  `id_ncvs` int(11) NOT NULL,
  `ncvs` varchar(10) NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_ncvs`
--

INSERT INTO `tbl_ncvs` (`id_ncvs`, `ncvs`, `description`, `is_deleted`, `updated_by`, `timestamp`) VALUES
(1, '101', '', 0, 'Rizki Zakaria', '2026-05-12 03:57:18'),
(2, '102', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:01'),
(3, '103', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:08'),
(4, '104', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:12'),
(5, '105', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:16'),
(6, '107', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:20'),
(7, '108', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:25'),
(8, '109', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:30'),
(9, '110', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:34'),
(10, '111', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:48'),
(11, '112', '', 0, 'Rizki Zakaria', '2026-05-12 03:58:54'),
(12, '113', '', 0, 'Rizki Zakaria', '2026-05-12 03:59:01'),
(13, '114', '', 0, 'Rizki Zakaria', '2026-05-12 03:59:05'),
(14, '115', '', 0, 'Rizki Zakaria', '2026-05-12 03:59:09'),
(15, '116', '', 0, 'Rizki Zakaria', '2026-05-12 03:59:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_plan`
--

CREATE TABLE `tbl_plan` (
  `id_cycle` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_plan`
--

INSERT INTO `tbl_plan` (`id_cycle`, `start_date`, `end_date`, `created_by`, `created_at`) VALUES
(1, '2026-08-03', '2026-08-08', 'Rizki Zakaria', '2026-08-03 03:24:07'),
(2, '2026-08-03', '2026-08-08', 'Rizki Zakaria', '2026-08-03 07:29:23'),
(3, '2026-09-25', '2026-09-25', 'Rizki Zakaria', '2026-09-25 02:29:34'),
(4, '2026-10-01', '2026-10-03', 'Rizki Zakaria', '2026-10-01 06:37:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_plan_detail`
--

CREATE TABLE `tbl_plan_detail` (
  `id_cycle_detail` int(11) NOT NULL,
  `id_cycle` int(11) NOT NULL,
  `plan_date` date DEFAULT NULL,
  `id_ncvs` int(11) NOT NULL,
  `plan_cycle` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_plan_detail`
--

INSERT INTO `tbl_plan_detail` (`id_cycle_detail`, `id_cycle`, `plan_date`, `id_ncvs`, `plan_cycle`, `status`, `created_by`, `created_at`) VALUES
(1, 1, '2026-08-03', 6, 228, 1, 'Rizki Zakaria', '2026-08-03 09:05:24'),
(2, 1, '2026-08-04', 6, 228, 1, 'Rizki Zakaria', '2026-08-03 03:24:07'),
(3, 1, '2026-08-05', 6, 228, 1, 'Rizki Zakaria', '2026-08-03 03:24:07'),
(4, 1, '2026-08-06', 6, 228, 1, 'Rizki Zakaria', '2026-08-03 03:24:07'),
(5, 1, '2026-08-07', 6, 228, 1, 'Rizki Zakaria', '2026-08-03 03:24:07'),
(6, 1, '2026-08-08', 6, 228, 1, 'Rizki Zakaria', '2026-08-03 03:24:07'),
(7, 2, '2026-08-03', 1, 186, 1, 'Rizki Zakaria', '2026-08-03 09:05:57'),
(8, 2, '2026-08-04', 1, 186, 1, 'Rizki Zakaria', '2026-08-03 07:29:23'),
(9, 2, '2026-08-05', 1, 186, 1, 'Rizki Zakaria', '2026-08-03 07:29:23'),
(10, 2, '2026-08-06', 1, 186, 1, 'Rizki Zakaria', '2026-08-03 07:29:23'),
(11, 2, '2026-08-07', 1, 186, 1, 'Rizki Zakaria', '2026-08-03 07:29:23'),
(12, 2, '2026-08-08', 1, 186, 1, 'Rizki Zakaria', '2026-08-03 07:29:23'),
(13, 3, '2026-09-25', 6, 252, 1, 'Rizki Zakaria', '2026-09-25 02:29:34'),
(14, 4, '2026-10-01', 6, 252, 1, 'Rizki Zakaria', '2026-10-01 06:37:33'),
(15, 4, '2026-10-02', 6, 252, 1, 'Rizki Zakaria', '2026-10-01 06:37:33'),
(16, 4, '2026-10-03', 6, 252, 1, 'Rizki Zakaria', '2026-10-01 06:37:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_time`
--

CREATE TABLE `tbl_time` (
  `id_time` int(11) NOT NULL,
  `date_plan` date NOT NULL,
  `hour` varchar(10) NOT NULL,
  `start_hour` time NOT NULL,
  `end_hour` time NOT NULL,
  `status` tinyint(1) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_time`
--

INSERT INTO `tbl_time` (`id_time`, `date_plan`, `hour`, `start_hour`, `end_hour`, `status`, `updated_by`, `updated_at`) VALUES
(1, '2026-08-03', '1', '06:30:00', '08:00:00', 1, 'Rizki Zakaria', '2026-08-03 09:06:00'),
(2, '2026-08-03', '2', '08:01:00', '09:00:00', 1, 'Rizki Zakaria', '2026-08-03 09:06:01'),
(3, '2026-08-03', '3', '09:01:00', '10:00:00', 1, 'Rizki Zakaria', '2026-08-03 09:06:03'),
(4, '2026-08-03', '4', '10:01:00', '11:00:00', 1, 'Rizki Zakaria', '2026-08-03 09:06:04'),
(5, '2026-08-03', '5', '11:01:00', '13:00:00', 1, 'Rizki Zakaria', '2026-08-03 09:06:04'),
(6, '2026-08-03', '6', '13:01:00', '14:00:00', 1, 'Rizki Zakaria', '2026-08-03 09:05:40'),
(7, '2026-08-03', '7', '14:01:00', '15:00:00', 1, 'Rizki Zakaria', '2026-08-03 09:05:42'),
(8, '2026-08-03', '8', '15:01:00', '16:30:00', 1, 'Rizki Zakaria', '2026-08-03 09:05:42'),
(9, '2026-08-04', '1', '06:30:00', '08:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(10, '2026-08-04', '2', '08:01:00', '09:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(11, '2026-08-04', '3', '09:01:00', '10:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(12, '2026-08-04', '4', '10:01:00', '11:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(13, '2026-08-04', '5', '11:01:00', '13:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(14, '2026-08-04', '6', '13:01:00', '14:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(15, '2026-08-04', '7', '14:01:00', '15:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(16, '2026-08-04', '8', '15:01:00', '16:30:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(17, '2026-08-05', '1', '06:30:00', '08:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(18, '2026-08-05', '2', '08:01:00', '09:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(19, '2026-08-05', '3', '09:01:00', '10:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(20, '2026-08-05', '4', '10:01:00', '11:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(21, '2026-08-05', '5', '11:01:00', '13:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(22, '2026-08-05', '6', '13:01:00', '14:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(23, '2026-08-05', '7', '14:01:00', '15:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(24, '2026-08-05', '8', '15:01:00', '16:30:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(25, '2026-08-06', '1', '06:30:00', '08:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(26, '2026-08-06', '2', '08:01:00', '09:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(27, '2026-08-06', '3', '09:01:00', '10:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(28, '2026-08-06', '4', '10:01:00', '11:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(29, '2026-08-06', '5', '11:01:00', '13:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(30, '2026-08-06', '6', '13:01:00', '14:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(31, '2026-08-06', '7', '14:01:00', '15:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(32, '2026-08-06', '8', '15:01:00', '16:30:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(33, '2026-08-07', '1', '06:30:00', '08:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(34, '2026-08-07', '2', '08:01:00', '09:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(35, '2026-08-07', '3', '09:01:00', '10:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(36, '2026-08-07', '4', '10:01:00', '11:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(37, '2026-08-07', '5', '11:01:00', '13:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(38, '2026-08-07', '6', '13:01:00', '14:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(39, '2026-08-07', '7', '14:01:00', '15:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(40, '2026-08-07', '8', '15:01:00', '16:30:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(41, '2026-08-08', '1', '06:30:00', '08:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(42, '2026-08-08', '2', '08:01:00', '09:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(43, '2026-08-08', '3', '09:01:00', '10:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(44, '2026-08-08', '4', '10:01:00', '11:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(45, '2026-08-08', '5', '11:01:00', '13:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(46, '2026-08-08', '6', '13:01:00', '14:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(47, '2026-08-08', '7', '14:01:00', '15:00:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(48, '2026-08-08', '8', '15:01:00', '16:30:00', 1, 'Rizki Zakaria', '2026-08-03 03:26:16'),
(49, '2026-09-25', '1', '06:30:00', '07:59:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(50, '2026-09-25', '2', '08:00:00', '08:59:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(51, '2026-09-25', '3', '09:00:00', '09:59:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(52, '2026-09-25', '4', '10:00:00', '10:59:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(53, '2026-09-25', '5', '11:00:00', '12:59:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(54, '2026-09-25', '6', '13:00:00', '13:59:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(55, '2026-09-25', '7', '14:00:00', '14:59:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(56, '2026-09-25', '8', '15:00:00', '16:00:00', 1, 'Rizki Zakaria', '2026-09-25 02:29:03'),
(57, '2026-10-01', '1', '06:30:00', '08:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15'),
(58, '2026-10-01', '2', '08:01:00', '09:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15'),
(59, '2026-10-01', '3', '09:01:00', '10:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15'),
(60, '2026-10-01', '4', '10:01:00', '11:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15'),
(61, '2026-10-01', '5', '11:01:00', '13:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15'),
(62, '2026-10-01', '6', '13:01:00', '14:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15'),
(63, '2026-10-01', '7', '14:01:00', '15:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15'),
(64, '2026-10-01', '8', '15:01:00', '16:00:00', 1, 'Rizki Zakaria', '2026-10-01 06:37:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `id_trans` bigint(20) NOT NULL,
  `job_order` varchar(50) NOT NULL,
  `bucket` varchar(50) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `po_item` varchar(50) NOT NULL,
  `style` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `ncvs` varchar(50) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `size` varchar(10) NOT NULL,
  `qty_plan` varchar(10) DEFAULT NULL,
  `status_lot` varchar(250) NOT NULL,
  `id_komponen_in` varchar(20) DEFAULT NULL,
  `nm_komponen_in` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id_komponen_out` varchar(20) DEFAULT NULL,
  `nm_komponen_out` varchar(50) DEFAULT NULL,
  `is_main_komponen` tinyint(1) DEFAULT 0,
  `id_group` int(11) DEFAULT NULL,
  `id_vendor` varchar(20) DEFAULT NULL,
  `nm_vendor` varchar(50) DEFAULT NULL,
  `qty_pre_setting` varchar(10) DEFAULT NULL,
  `qty_sm_subcont` varchar(10) DEFAULT NULL,
  `qty_send_to_wh` varchar(10) DEFAULT NULL,
  `qty_wh_from_sm` varchar(10) DEFAULT NULL,
  `qty_send_to_vendor` varchar(10) DEFAULT NULL,
  `qty_vendor_from_wh` varchar(10) DEFAULT NULL,
  `qty_vendor_send_wh` varchar(10) DEFAULT NULL,
  `qty_wh_from_vendor` varchar(10) DEFAULT NULL,
  `qty_qc` varchar(10) DEFAULT NULL,
  `qty_wh_send_sm` varchar(10) DEFAULT NULL,
  `qty_sm_from_wh` varchar(10) DEFAULT NULL,
  `qty_sm_send_prod` varchar(10) DEFAULT NULL,
  `last_gate` varchar(50) DEFAULT NULL,
  `global_barcode` varchar(250) DEFAULT NULL,
  `barcode` varchar(250) DEFAULT NULL,
  `count_barcode` varchar(10) DEFAULT NULL,
  `transac_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `print_status` enum('NOT_READY','READY','PRINTED','FAILED') NOT NULL,
  `mode` enum('PLAN','CUSTOM','','') NOT NULL,
  `user_validated_by` varchar(50) DEFAULT NULL,
  `user_validated_at` datetime DEFAULT NULL,
  `leader_validated_by` varchar(50) DEFAULT NULL,
  `leader_validated_at` datetime DEFAULT NULL,
  `barcode_status` enum('ACTIVE','MERGED') DEFAULT 'ACTIVE',
  `parent_barcode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_transactions`
--

INSERT INTO `tbl_transactions` (`id_trans`, `job_order`, `bucket`, `po_code`, `po_item`, `style`, `model`, `ncvs`, `lot`, `size`, `qty_plan`, `status_lot`, `id_komponen_in`, `nm_komponen_in`, `id_komponen_out`, `nm_komponen_out`, `is_main_komponen`, `id_group`, `id_vendor`, `nm_vendor`, `qty_pre_setting`, `qty_sm_subcont`, `qty_send_to_wh`, `qty_wh_from_sm`, `qty_send_to_vendor`, `qty_vendor_from_wh`, `qty_vendor_send_wh`, `qty_wh_from_vendor`, `qty_qc`, `qty_wh_send_sm`, `qty_sm_from_wh`, `qty_sm_send_prod`, `last_gate`, `global_barcode`, `barcode`, `count_barcode`, `transac_by`, `created_at`, `updated_at`, `status`, `print_status`, `mode`, `user_validated_by`, `user_validated_at`, `leader_validated_by`, `leader_validated_at`, `barcode_status`, `parent_barcode`) VALUES
(1, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '8', '001', '36', 'IA260803-00027', '23', 'Tongue Top', '22', 'Tongue Set', 1, 23, '1', 'Multi Karya Usaha', '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRE_SETTING', NULL, '10720261029001', NULL, 'Rizki Zakaria', '2026-10-29 07:37:53', '2026-10-29 07:37:53', 'PENDING', 'FAILED', 'CUSTOM', 'Lisdianah', '2026-10-29 07:37:56', 'July', '2026-10-29 07:38:03', 'ACTIVE', NULL),
(2, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '9', '001', '36', 'IA260803-00027', '23', 'Tongue Top', '22', 'Tongue Set', 1, 23, '1', 'Multi Karya Usaha', '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRE_SETTING', NULL, '10720261029001', NULL, 'Rizki Zakaria', '2026-10-29 07:37:53', '2026-10-29 07:37:53', 'PENDING', 'FAILED', 'CUSTOM', 'Lisdianah', '2026-10-29 07:37:56', 'July', '2026-10-29 07:38:03', 'ACTIVE', NULL),
(3, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '10', '001', '36', 'IA260803-00027', '23', 'Tongue Top', '22', 'Tongue Set', 1, 23, '1', 'Multi Karya Usaha', '36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRE_SETTING', NULL, '10720261029001', NULL, 'Rizki Zakaria', '2026-10-29 07:37:53', '2026-10-29 07:37:53', 'PENDING', 'FAILED', 'CUSTOM', 'Lisdianah', '2026-10-29 07:37:56', 'July', '2026-10-29 07:38:03', 'ACTIVE', NULL),
(4, '0803-107-2', '260803SO', '6210913014', '100', 'IZ1704-100', 'NIKE S.T. DYNAMITE MB (PS)', '107', '11', '001', '32', 'IA260803-00027', '23', 'Tongue Top', '22', 'Tongue Set', 1, 23, '1', 'Multi Karya Usaha', '32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRE_SETTING', NULL, '10720261029001', NULL, 'Rizki Zakaria', '2026-10-29 07:37:53', '2026-10-29 07:37:53', 'PENDING', 'FAILED', 'CUSTOM', 'Lisdianah', '2026-10-29 07:37:56', 'July', '2026-10-29 07:38:03', 'ACTIVE', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_trans` bigint(20) NOT NULL,
  `status_lot` varchar(250) NOT NULL,
  `job_order` varchar(50) NOT NULL,
  `bucket` varchar(50) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `po_item` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `style` varchar(50) DEFAULT NULL,
  `ncvs` varchar(50) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `size` varchar(10) NOT NULL,
  `id_komponen_in` varchar(20) DEFAULT NULL,
  `nm_komponen_in` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id_komponen_out` varchar(20) DEFAULT NULL,
  `nm_komponen_out` varchar(50) DEFAULT NULL,
  `is_main_komponen` tinyint(1) DEFAULT 0,
  `id_group` int(11) DEFAULT NULL,
  `id_vendor` varchar(20) DEFAULT NULL,
  `nm_vendor` varchar(50) DEFAULT NULL,
  `qty_plan` varchar(10) DEFAULT NULL,
  `qty_cut_to_smsubcont` varchar(10) DEFAULT NULL,
  `qty_smsubcont_fr_cut` varchar(10) DEFAULT NULL,
  `qty_smsubcont_to_whsubcont` varchar(10) DEFAULT NULL,
  `qty_whsubcont_fr_smsubcont` varchar(10) DEFAULT NULL,
  `qty_whsubcont_to_vendor` varchar(10) DEFAULT NULL,
  `qty_vendor_fr_whsubcont` varchar(10) DEFAULT NULL,
  `qty_vendor_to_whsubcont` varchar(10) DEFAULT NULL,
  `qty_whsubcont_fr_vendor` varchar(10) DEFAULT NULL,
  `qty_whsubcont_to_smsubcont` varchar(10) DEFAULT NULL,
  `qty_smsubcont_fr_whsubcont` varchar(10) DEFAULT NULL,
  `qty_smsubcont_to_prod` varchar(10) DEFAULT NULL,
  `last_gate` varchar(50) DEFAULT NULL,
  `hour` varchar(10) DEFAULT NULL,
  `batch_transaksi` varchar(250) DEFAULT NULL,
  `barcode` varchar(250) DEFAULT NULL,
  `count_barcode` varchar(10) DEFAULT NULL,
  `transac_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `validated_by` varchar(50) DEFAULT NULL,
  `validated_at` datetime DEFAULT NULL,
  `barcode_status` enum('ACTIVE','MERGED') DEFAULT 'ACTIVE',
  `parent_barcode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi_event`
--

CREATE TABLE `tbl_transaksi_event` (
  `id_event` int(11) NOT NULL,
  `id_trans` varchar(10) NOT NULL,
  `global_barcode` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `id_komponen` varchar(20) DEFAULT NULL,
  `nm_komponen` varchar(50) NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  `lot` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `gate` varchar(100) NOT NULL,
  `flow_type` varchar(10) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `transac_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `pickup_nik` varchar(30) DEFAULT NULL,
  `pickup_name` varchar(100) DEFAULT NULL,
  `pickup_ncvs` varchar(10) DEFAULT NULL,
  `pickup_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_transaksi_event`
--

INSERT INTO `tbl_transaksi_event` (`id_event`, `id_trans`, `global_barcode`, `barcode`, `id_komponen`, `nm_komponen`, `id_group`, `lot`, `size`, `gate`, `flow_type`, `qty`, `transac_by`, `created_at`, `pickup_nik`, `pickup_name`, `pickup_ncvs`, `pickup_at`) VALUES
(1, '1', NULL, '10720261029001', '23', 'Tongue Top', 23, '8', '001', 'PRE_SETTING', 'IN', '24', 'Rizki Zakaria', '2026-10-29 07:37:53', NULL, NULL, NULL, NULL),
(2, '2', NULL, '10720261029001', '23', 'Tongue Top', 23, '9', '001', 'PRE_SETTING', 'IN', '30', 'Rizki Zakaria', '2026-10-29 07:37:53', NULL, NULL, NULL, NULL),
(3, '3', NULL, '10720261029001', '23', 'Tongue Top', 23, '10', '001', 'PRE_SETTING', 'IN', '36', 'Rizki Zakaria', '2026-10-29 07:37:53', NULL, NULL, NULL, NULL),
(4, '4', NULL, '10720261029001', '23', 'Tongue Top', 23, '11', '001', 'PRE_SETTING', 'IN', '32', 'Rizki Zakaria', '2026-10-29 07:37:53', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi_kekurangan`
--

CREATE TABLE `tbl_transaksi_kekurangan` (
  `id_kekurangan` int(11) NOT NULL,
  `id_trans` int(11) NOT NULL,
  `global_barcode` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `id_komponen` varchar(20) DEFAULT NULL,
  `nm_komponen` varchar(100) NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  `lot` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `gate` varchar(50) DEFAULT NULL,
  `qty_kekurangan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` enum('pending','confirmed') DEFAULT 'pending',
  `transac_by` datetime DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `nik_user` varchar(50) NOT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `ncvs` varchar(10) DEFAULT NULL,
  `departement` varchar(25) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `pass_user` varchar(255) NOT NULL,
  `pass_plain` varchar(50) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `role_id`, `nik_user`, `id_card`, `ncvs`, `departement`, `level`, `pass_user`, `pass_plain`, `last_login`, `is_deleted`, `updated_by`, `timestamp`) VALUES
(2, 'Rizki Zakaria', 1, '108854', NULL, NULL, NULL, NULL, '$2y$10$umYh9ACEbNeaScodVfO4HeoLmQtMuDmBEehpIpslvES6cGEv5xFYK', '123456', '2026-10-28 06:31:52', 0, 'Rizki Zakaria', '2025-09-09 03:48:31'),
(13, 'Lisdianah', 6, '0219554', '0172554393', '107', 'Production', 'Team Member', '$2y$10$QZ4qhmfiBvYNkAdn8TA5GejjVNyHrlCFP8jpdUcZE4OCRYkH86oaK', 'user123', '2026-10-28 06:31:21', 0, 'Rizki Zakaria', '2026-07-16 03:53:03'),
(14, 'Eka Apriliani', 6, '0215560', '2597342730', '108', 'Production', 'Team Member', '$2y$10$UhM3b73n60/oTLoliu.Vy.jzMbhu6AZRLalJXAMdCeMU6Bxo94Ama', 'user123', '2026-10-28 06:31:43', 0, 'Rizki Zakaria', '2026-07-17 07:16:42'),
(15, 'Mahmud', 3, '0111331', NULL, NULL, 'PPIC', 'Team Member', '$2y$10$5tarIn3SGmkQHeqCk2yS8OsRxpHKQz6e0xCSJxRDBhIGOg9Lgbvkq', 'user123', '2026-09-02 06:42:12', 0, 'Rizki Zakaria', '2026-07-20 06:59:13'),
(16, 'July', 2, '09050001', '0172140553', '107', 'Production', 'Team Leader', '$2y$10$WVW.ApLgW.fwh/5nDwdkAePFdZ2mLnahhcemW/mBh55BL7HgCi28W', 'user123', '2026-07-24 07:50:22', 0, 'Rizki Zakaria', '2026-07-24 07:40:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_vendor`
--

CREATE TABLE `tbl_vendor` (
  `id_vendor` int(11) NOT NULL,
  `name_vendor` varchar(150) NOT NULL,
  `code_vendor` varchar(20) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_vendor`
--

INSERT INTO `tbl_vendor` (`id_vendor`, `name_vendor`, `code_vendor`, `alamat`, `is_deleted`, `updated_by`, `timestamp`) VALUES
(1, 'Multi Karya Usaha', 'MKU-001', '', 0, 'Rizki Zakaria', '2026-05-05 07:01:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_vendor_proses`
--

CREATE TABLE `tbl_vendor_proses` (
  `id_vendor_proses` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_proses` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_vendor_proses`
--

INSERT INTO `tbl_vendor_proses` (`id_vendor_proses`, `id_vendor`, `id_proses`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(2, 1, 2, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(3, 1, 3, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(4, 1, 4, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(5, 1, 5, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(6, 1, 6, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(7, 1, 7, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(8, 1, 8, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(9, 1, 9, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(10, 1, 10, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(11, 1, 11, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(12, 1, 12, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(13, 1, 13, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(14, 1, 14, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(15, 1, 15, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(16, 1, 16, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(17, 1, 17, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(18, 1, 18, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(19, 1, 19, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(20, 1, 20, '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(21, 1, 21, '2026-07-15 07:11:16', '2026-07-15 07:11:16'),
(22, 1, 22, '2026-07-15 07:11:16', '2026-07-15 07:11:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_defect`
--

CREATE TABLE `tlog_defect` (
  `id_log_defect` int(11) NOT NULL,
  `id_defect` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_komponen`
--

CREATE TABLE `tlog_komponen` (
  `id_log_komponen` int(11) NOT NULL,
  `id_komponen` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_komponen`
--

INSERT INTO `tlog_komponen` (`id_log_komponen`, `id_komponen`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `timestamp`) VALUES
(1, 2, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Vamp\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":1}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(2, 3, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Collar Rf Medial\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(3, 4, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Collar Rf Lateral\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(4, 5, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Tip Skin\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(5, 6, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Tip Skin Olay\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(6, 7, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Quarter Skin Medial\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(7, 8, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Quarter Skin Lateral\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(8, 9, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Quarter Medial Skin Olay\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(9, 10, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Quarter Lateral Skin Olay\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(10, 11, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Tip Backing Medial\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(11, 12, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Tip Backing Lateral\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(12, 13, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Tip Backing\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(13, 14, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Eyestay Skin Medial\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(14, 15, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Eyestay Skin Lateral\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(15, 16, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Eyestay Lining Medial\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(16, 17, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Eyestay Lining Lateral\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(17, 18, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Eyestay Rf Medial\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(18, 19, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Eyestay Rf Lateral\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(19, 20, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Swoosh Lateral\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(20, 21, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":2,\"input\":\"Swoosh Medial\",\"output\":\"Vamp Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:10:41', '2026-07-15 07:10:41'),
(21, 23, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":23,\"input\":\"Tongue Top\",\"output\":\"Tongue Set\",\"vendor\":1,\"is_main\":1}', '2026-07-15 07:11:16', '2026-07-15 07:11:16'),
(22, 24, 'Rizki Zakaria', 'INSERT', NULL, '{\"model\":\"NIKE S.T. DYNAMITE MB (PS)\",\"style\":\"\",\"id_group\":23,\"input\":\"Tongue Logo\",\"output\":\"Tongue Set\",\"vendor\":1,\"is_main\":0}', '2026-07-15 07:11:16', '2026-07-15 07:11:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_login`
--

CREATE TABLE `tlog_login` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `login_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_login`
--

INSERT INTO `tlog_login` (`id_log`, `id_user`, `ip_address`, `user_agent`, `login_time`) VALUES
(1, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-17 09:40:10'),
(2, 2, '10.5.74.67', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-11-17 15:45:52'),
(3, 2, '10.5.64.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-18 07:52:12'),
(4, 2, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-18 07:54:05'),
(5, 2, '10.5.64.178', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-11-18 08:00:50'),
(6, 2, '10.130.149.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-18 08:07:09'),
(7, 2, '10.5.74.165', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-18 08:17:10'),
(8, 2, '10.5.74.67', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-11-18 08:21:53'),
(9, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-18 08:32:48'),
(10, 2, '10.5.74.165', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-11-18 08:41:16'),
(11, 2, '10.5.74.165', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-11-18 08:46:32'),
(12, 2, '10.130.149.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-18 08:47:03'),
(13, 2, '10.130.149.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-18 08:52:47'),
(14, 2, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-18 09:50:27'),
(15, 2, '10.5.72.150', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', '2025-11-18 13:30:15'),
(16, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 08:28:06'),
(17, NULL, '10.5.64.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 09:19:54'),
(18, NULL, '10.5.64.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 09:20:18'),
(19, NULL, '10.5.64.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 09:20:42'),
(20, 2, '10.5.64.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 09:21:27'),
(21, NULL, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 10:06:07'),
(22, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 13:07:53'),
(23, 2, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-19 13:33:51'),
(24, 2, '10.5.64.178', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-11-19 13:55:10'),
(25, NULL, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-19 13:59:28'),
(26, NULL, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-19 14:24:35'),
(27, NULL, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-19 14:28:32'),
(28, NULL, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-19 14:36:01'),
(29, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-19 14:39:16'),
(30, NULL, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-19 14:40:40'),
(31, NULL, '10.5.64.183', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-11-19 14:51:05'),
(32, 2, '10.5.73.128', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-20 09:07:51'),
(33, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-20 10:13:11'),
(34, 2, '10.5.73.128', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-21 13:20:00'),
(35, 2, '10.5.73.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-24 09:51:12'),
(36, 2, '10.5.73.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-27 07:55:59'),
(37, NULL, '10.5.64.166', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-01 10:24:34'),
(38, 2, '10.5.73.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-03 07:53:43'),
(39, 2, '10.5.64.216', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-03 08:50:29'),
(40, NULL, '10.5.64.216', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-03 08:56:35'),
(41, 2, '10.5.73.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-03 09:04:49'),
(42, NULL, '10.5.64.216', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-03 09:21:16'),
(43, 2, '10.5.73.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-04 14:46:18'),
(44, 2, '10.5.73.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-05 08:14:50'),
(45, 2, '10.5.73.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-08 07:56:16'),
(46, NULL, '10.5.64.174', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-08 08:43:10'),
(47, 2, '10.5.73.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-12-08 09:32:36'),
(48, 2, '10.5.73.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-09 08:00:49'),
(49, NULL, '10.5.74.150', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-09 08:13:35'),
(50, NULL, '10.5.74.150', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-09 08:15:51'),
(51, 2, '10.5.73.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-09 09:59:02'),
(52, NULL, '10.5.64.174', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-09 10:12:31'),
(53, 2, '10.5.73.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-09 13:56:21'),
(54, 2, '10.5.74.150', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-09 14:03:21'),
(55, 2, '10.5.74.150', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-09 14:09:30'),
(56, 2, '10.5.74.150', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-12-09 14:15:20'),
(57, 2, '10.5.73.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-12 10:16:47'),
(58, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-15 14:42:41'),
(59, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-18 07:20:12'),
(60, NULL, '10.5.64.182', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-18 07:55:54'),
(61, 2, '10.5.73.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-18 13:50:19'),
(62, 2, '10.5.73.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-18 14:08:05'),
(63, 2, '10.5.73.181', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-30 08:23:59'),
(64, 2, '10.130.149.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-30 09:13:38'),
(65, 2, '10.5.73.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-30 09:19:26'),
(66, 2, '10.5.64.127', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2025-12-30 10:09:04'),
(67, 2, '10.5.73.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-05 10:52:45'),
(68, 2, '10.5.73.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-06 07:50:11'),
(69, 2, '10.5.73.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-06 10:37:42'),
(70, 2, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:44:37'),
(71, 2, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:49:47'),
(72, 2, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:50:20'),
(73, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:51:59'),
(74, 2, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:52:22'),
(75, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:53:30'),
(76, 2, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:58:51'),
(77, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 09:59:44'),
(78, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 10:33:38'),
(79, 2, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 10:33:56'),
(80, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 10:37:09'),
(81, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-12 12:51:13'),
(82, 2, '10.5.73.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-12 14:51:29'),
(83, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-13 07:19:18'),
(84, 2, '10.5.73.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-13 07:39:13'),
(85, NULL, '10.5.73.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-13 07:46:00'),
(86, 2, '10.5.73.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-13 07:50:24'),
(87, 2, '10.5.73.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-14 09:46:57'),
(88, NULL, '10.5.64.185', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-14 10:44:14'),
(89, NULL, '10.5.64.185', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-14 14:03:30'),
(90, NULL, '10.5.73.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-14 14:43:43'),
(91, 2, '10.5.73.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-14 14:46:43'),
(92, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 08:49:02'),
(93, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 09:51:09'),
(94, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:16:21'),
(95, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:35:14'),
(96, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:35:35'),
(97, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:35:51'),
(98, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:36:14'),
(99, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:36:34'),
(100, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:37:50'),
(101, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:38:05'),
(102, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-15 10:38:24'),
(103, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-19 07:49:46'),
(104, 2, '10.5.73.158', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-01-19 09:08:13'),
(105, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-09 08:14:32'),
(106, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 13:38:28'),
(107, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 07:26:26'),
(108, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 07:18:34'),
(109, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 08:15:56'),
(110, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-30 07:49:07'),
(111, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-30 09:02:19'),
(112, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-31 08:25:46'),
(113, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-01 08:13:12'),
(114, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-01 14:43:58'),
(115, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-02 07:48:51'),
(116, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-07 07:27:57'),
(117, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-20 09:45:57'),
(118, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-20 13:19:31'),
(119, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-22 08:31:48'),
(120, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-22 14:27:56'),
(121, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-23 07:49:15'),
(122, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-24 10:31:50'),
(123, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-24 14:19:14'),
(124, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-28 07:47:22'),
(125, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-29 13:47:00'),
(126, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-30 07:33:51'),
(127, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-04 09:06:45'),
(128, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-04 10:10:07'),
(129, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-05 08:09:50'),
(130, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-06 07:19:16'),
(131, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-06 08:33:26'),
(132, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-06 10:15:50'),
(133, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-07 07:14:23'),
(134, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-08 07:23:10'),
(135, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-11 08:56:23'),
(136, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-12 08:13:15'),
(137, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-12 10:33:08'),
(138, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-12 11:49:16'),
(139, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-12 11:52:41'),
(140, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-05-12 11:53:56'),
(141, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-13 07:30:32'),
(142, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-13 09:53:27'),
(143, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:15:38'),
(144, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-15 07:15:52'),
(145, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-18 07:17:30'),
(146, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-19 07:56:06'),
(147, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-21 07:55:46'),
(148, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-21 08:27:32'),
(149, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-22 06:48:30'),
(150, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-25 07:45:20'),
(151, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-26 08:28:49'),
(152, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-28 08:24:27'),
(153, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 07:58:19'),
(154, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-02 08:17:27'),
(155, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-03 07:45:37'),
(156, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-04 13:49:39'),
(157, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-05 08:07:57'),
(158, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-08 10:20:44'),
(159, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 08:19:02'),
(160, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-10 08:06:00'),
(161, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-10 14:51:25'),
(162, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-11 07:40:40'),
(163, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-12 07:49:01'),
(164, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-06-23 09:19:49'),
(165, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-07-03 07:43:26'),
(166, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-07-06 07:32:31'),
(167, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-07-07 08:21:26'),
(168, 2, '10.5.52.93', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-07 11:03:36'),
(169, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '2026-07-07 11:08:36'),
(170, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-14 14:03:43'),
(171, 2, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-15 07:37:28'),
(172, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 09:05:19'),
(173, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 13:55:40'),
(174, 2, '10.5.75.54', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-15 14:03:05'),
(175, 2, '10.5.75.54', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-15 15:13:50'),
(176, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-16 07:51:24'),
(177, 2, '10.5.52.87', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-16 08:08:55'),
(178, 2, '10.5.52.87', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2026-07-16 08:15:09'),
(179, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-16 09:19:30'),
(180, 2, '10.5.74.182', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '2026-07-16 10:39:27'),
(181, 2, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-16 10:54:55'),
(182, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-16 10:56:26'),
(183, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-16 11:00:44'),
(184, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-16 11:01:28'),
(185, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-17 07:59:52'),
(186, 2, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-17 10:36:24'),
(187, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-17 14:16:09'),
(188, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-20 07:33:56'),
(189, 2, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-20 10:05:59'),
(190, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-20 10:42:53'),
(191, 2, '10.5.74.182', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '2026-07-20 13:57:17'),
(192, 15, '10.5.74.182', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '2026-07-20 14:01:45'),
(193, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-20 14:12:03'),
(194, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-20 14:46:58'),
(195, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 11; K2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', '2026-07-21 08:07:06'),
(196, 15, '10.5.74.182', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '2026-07-21 13:37:19'),
(197, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2026-07-21 13:46:47'),
(198, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-22 07:20:09'),
(199, 13, '10.5.60.137', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2026-07-22 07:29:17'),
(200, 15, '10.5.74.182', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '2026-07-22 08:11:43'),
(201, 15, '10.5.74.182', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '2026-07-22 09:57:11'),
(202, 15, '10.5.64.149', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '2026-07-22 12:39:56'),
(203, 2, '10.5.74.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-22 13:45:06'),
(204, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-23 07:17:01'),
(205, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-24 07:56:15'),
(206, 13, '::1', 'Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '2026-07-24 14:02:58'),
(207, 2, '::1', 'Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '2026-07-24 14:07:07'),
(208, 2, '::1', 'Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '2026-07-24 14:09:24'),
(209, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-24 14:10:26'),
(210, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-24 14:12:34'),
(211, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-24 14:18:09'),
(212, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-24 14:28:28'),
(213, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-24 14:30:04'),
(214, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-24 14:35:16'),
(215, 15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-24 14:36:45'),
(216, 16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-24 14:45:33'),
(217, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-24 14:49:14'),
(218, 16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-24 14:50:22'),
(219, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '2026-07-24 15:07:34'),
(220, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-27 07:24:59'),
(221, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-27 13:04:09'),
(222, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-28 09:15:48'),
(223, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-29 11:13:04'),
(224, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-30 07:50:23'),
(225, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-31 07:31:39'),
(226, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-08-03 07:59:08'),
(227, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-08-04 07:34:22'),
(228, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-08-04 13:22:50'),
(229, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-08-05 07:30:36'),
(230, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-08-06 07:31:26'),
(231, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-08-07 07:34:38'),
(232, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-08-07 13:36:49'),
(233, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-12 14:39:34'),
(234, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-13 07:47:42'),
(235, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-14 07:52:57'),
(236, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-19 08:00:10'),
(237, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-21 08:07:57'),
(238, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-24 08:25:06'),
(239, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 07:31:58'),
(240, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-26 13:15:31'),
(241, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 07:51:00'),
(242, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-27 08:49:45'),
(243, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-08-28 07:38:35'),
(244, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '2026-09-01 07:48:45'),
(245, 15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 13:42:12'),
(246, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 13:42:45'),
(247, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-24 09:26:01'),
(248, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-24 13:59:35'),
(249, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-25 09:00:30'),
(250, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-01 13:30:06'),
(251, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 13:11:10'),
(252, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 14:09:59'),
(253, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-21 13:52:01'),
(254, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-22 07:29:36'),
(255, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-23 07:32:01'),
(256, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-26 08:00:13'),
(257, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-27 08:09:56'),
(258, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-27 14:27:36'),
(259, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 07:41:58'),
(260, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 08:12:39'),
(261, 14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 08:13:05'),
(262, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 08:13:19'),
(263, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 09:12:25'),
(264, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 13:30:49'),
(265, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 13:30:57'),
(266, 13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 13:31:21'),
(267, 14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 13:31:43'),
(268, 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-10-28 13:31:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_ncvs`
--

CREATE TABLE `tlog_ncvs` (
  `id_log_ncvs` int(11) NOT NULL,
  `id_ncvs` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_ncvs`
--

INSERT INTO `tlog_ncvs` (`id_log_ncvs`, `id_ncvs`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"101\",\"description\":\"\"}', '2026-05-12 03:57:18', '2026-05-12 03:57:18'),
(2, 2, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"102\",\"description\":\"\"}', '2026-05-12 03:58:01', '2026-05-12 03:58:01'),
(3, 3, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"103\",\"description\":\"\"}', '2026-05-12 03:58:08', '2026-05-12 03:58:08'),
(4, 4, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"104\",\"description\":\"\"}', '2026-05-12 03:58:12', '2026-05-12 03:58:12'),
(5, 5, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"105\",\"description\":\"\"}', '2026-05-12 03:58:16', '2026-05-12 03:58:16'),
(6, 6, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"107\",\"description\":\"\"}', '2026-05-12 03:58:20', '2026-05-12 03:58:20'),
(7, 7, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"108\",\"description\":\"\"}', '2026-05-12 03:58:25', '2026-05-12 03:58:25'),
(8, 8, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"109\",\"description\":\"\"}', '2026-05-12 03:58:30', '2026-05-12 03:58:30'),
(9, 9, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"110\",\"description\":\"\"}', '2026-05-12 03:58:34', '2026-05-12 03:58:34'),
(10, 10, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"111\",\"description\":\"\"}', '2026-05-12 03:58:49', '2026-05-12 03:58:49'),
(11, 11, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"112\",\"description\":\"\"}', '2026-05-12 03:58:54', '2026-05-12 03:58:54'),
(12, 12, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"113\",\"description\":\"\"}', '2026-05-12 03:59:01', '2026-05-12 03:59:01'),
(13, 13, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"114\",\"description\":\"\"}', '2026-05-12 03:59:05', '2026-05-12 03:59:05'),
(14, 14, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"115\",\"description\":\"\"}', '2026-05-12 03:59:09', '2026-05-12 03:59:09'),
(15, 15, 'Rizki Zakaria', 'INSERT', NULL, '{\"ncvs\":\"116\",\"description\":\"\"}', '2026-05-12 03:59:12', '2026-05-12 03:59:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_plan`
--

CREATE TABLE `tlog_plan` (
  `id_log_plan` int(11) NOT NULL,
  `id_cycle` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_plan`
--

INSERT INTO `tlog_plan` (`id_log_plan`, `id_cycle`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rizki Zakaria', 'TOGGLE', NULL, '{\"start_date\":\"2026-08-03\",\"end_date\":\"2026-08-08\",\"details\":[{\"plan_date\":\"2026-08-03\",\"id_ncvs\":\"6\",\"plan_cycle\":\"228\"},{\"plan_date\":\"2026-08-04\",\"id_ncvs\":\"6\",\"plan_cycle\":\"228\"},{\"plan_date\":\"2026-08-05\",\"id_ncvs\":\"6\",\"plan_cycle\":\"228\"},{\"plan_date\":\"2026-08-06\",\"id_ncvs\":\"6\",\"plan_cycle\":\"228\"},{\"plan_date\":\"2026-08-07\",\"id_ncvs\":\"6\",\"plan_cycle\":\"228\"},{\"plan_date\":\"2026-08-08\",\"id_ncvs\":\"6\",\"plan_cycle\":\"228\"}]}', '2026-08-03 03:24:07', '2026-08-03 03:24:07'),
(2, 2, 'Rizki Zakaria', 'TOGGLE', NULL, '{\"start_date\":\"2026-08-03\",\"end_date\":\"2026-08-08\",\"details\":[{\"plan_date\":\"2026-08-03\",\"id_ncvs\":\"1\",\"plan_cycle\":\"186\"},{\"plan_date\":\"2026-08-04\",\"id_ncvs\":\"1\",\"plan_cycle\":\"186\"},{\"plan_date\":\"2026-08-05\",\"id_ncvs\":\"1\",\"plan_cycle\":\"186\"},{\"plan_date\":\"2026-08-06\",\"id_ncvs\":\"1\",\"plan_cycle\":\"186\"},{\"plan_date\":\"2026-08-07\",\"id_ncvs\":\"1\",\"plan_cycle\":\"186\"},{\"plan_date\":\"2026-08-08\",\"id_ncvs\":\"1\",\"plan_cycle\":\"186\"}]}', '2026-08-03 07:29:23', '2026-08-03 07:29:23'),
(3, 1, 'Rizki Zakaria', 'TOGGLE', '{\"id_cycle_detail\":1,\"id_cycle\":1,\"plan_date\":\"2026-08-03\",\"id_ncvs\":6,\"plan_cycle\":228,\"status\":1,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 10:24:07\"}', '{\"id_cycle_detail\":1,\"id_cycle\":1,\"plan_date\":\"2026-08-03\",\"id_ncvs\":6,\"plan_cycle\":228,\"status\":0,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 10:24:07\"}', '2026-08-03 08:59:54', '2026-08-03 08:59:54'),
(4, 2, 'Rizki Zakaria', 'TOGGLE', '{\"id_cycle_detail\":7,\"id_cycle\":2,\"plan_date\":\"2026-08-03\",\"id_ncvs\":1,\"plan_cycle\":186,\"status\":1,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 14:29:23\"}', '{\"id_cycle_detail\":7,\"id_cycle\":2,\"plan_date\":\"2026-08-03\",\"id_ncvs\":1,\"plan_cycle\":186,\"status\":0,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 14:29:23\"}', '2026-08-03 09:04:02', '2026-08-03 09:04:02'),
(5, 1, 'Rizki Zakaria', 'TOGGLE', '{\"id_cycle_detail\":1,\"id_cycle\":1,\"plan_date\":\"2026-08-03\",\"id_ncvs\":6,\"plan_cycle\":228,\"status\":0,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 15:59:54\"}', '{\"id_cycle_detail\":1,\"id_cycle\":1,\"plan_date\":\"2026-08-03\",\"id_ncvs\":6,\"plan_cycle\":228,\"status\":1,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 15:59:54\"}', '2026-08-03 09:05:24', '2026-08-03 09:05:24'),
(6, 2, 'Rizki Zakaria', 'TOGGLE', '{\"id_cycle_detail\":7,\"id_cycle\":2,\"plan_date\":\"2026-08-03\",\"id_ncvs\":1,\"plan_cycle\":186,\"status\":0,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 16:04:02\"}', '{\"id_cycle_detail\":7,\"id_cycle\":2,\"plan_date\":\"2026-08-03\",\"id_ncvs\":1,\"plan_cycle\":186,\"status\":1,\"created_by\":\"Rizki Zakaria\",\"created_at\":\"2026-08-03 16:04:02\"}', '2026-08-03 09:05:57', '2026-08-03 09:05:57'),
(7, 3, 'Rizki Zakaria', 'TOGGLE', NULL, '{\"start_date\":\"2026-09-25\",\"end_date\":\"2026-09-25\",\"details\":[{\"plan_date\":\"2026-09-25\",\"id_ncvs\":\"6\",\"plan_cycle\":\"252\"}]}', '2026-09-25 02:29:34', '2026-09-25 02:29:34'),
(8, 4, 'Rizki Zakaria', 'TOGGLE', NULL, '{\"start_date\":\"2026-10-01\",\"end_date\":\"2026-10-03\",\"details\":[{\"plan_date\":\"2026-10-01\",\"id_ncvs\":\"6\",\"plan_cycle\":\"252\"},{\"plan_date\":\"2026-10-02\",\"id_ncvs\":\"6\",\"plan_cycle\":\"252\"},{\"plan_date\":\"2026-10-03\",\"id_ncvs\":\"6\",\"plan_cycle\":\"252\"}]}', '2026-10-01 06:37:33', '2026-10-01 06:37:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_roles`
--

CREATE TABLE `tlog_roles` (
  `id_log_role` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_roles`
--

INSERT INTO `tlog_roles` (`id_log_role`, `id`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(4, 0, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN OUT WH\",\"description\":\"\"}', '2025-09-18 06:38:21', '2025-09-18 06:38:21'),
(5, 5, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\"}', '2025-09-18 06:39:40', '2025-09-18 06:39:40'),
(6, 2, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"User\",\"description\":null}', '{\"role_name\":\"SCAN OUT VENDOR\",\"description\":\"\"}', '2025-09-18 06:53:26', '2025-09-18 06:53:26'),
(7, 5, 'Rizki Zakaria', 'RESTORE', '{\"id\":5,\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 14:13:08\"}', '{\"id\":5,\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 14:13:08\"}', '2025-09-18 07:14:02', '2025-09-18 07:14:02'),
(8, 4, 'Rizki Zakaria', 'REMOVE', '{\"id\":4,\"role_name\":\"SCAN OUT WH\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 13:38:21\"}', '{\"id\":4,\"role_name\":\"SCAN OUT WH\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 13:38:21\"}', '2025-09-18 07:14:08', '2025-09-18 07:14:08'),
(9, 4, 'Rizki Zakaria', 'DELETE', '{\"id\":4,\"role_name\":\"SCAN OUT WH\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 14:14:08\"}', '{\"note\":\"Role dihapus permanen oleh Rizki Zakaria pada 2025-09-18 14:14:16\"}', '2025-09-18 07:14:16', '2025-09-18 07:14:16'),
(10, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', '[6,1,2,3,4,5,7,8]', '2025-09-19 00:46:58', '2025-09-19 00:46:58'),
(11, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"]', '[6,1,2,3,4,5,7,8,9]', '2025-09-19 00:48:10', '2025-09-19 00:48:10'),
(12, 5, 'Rizki Zakaria', 'REMOVE', '{\"id\":5,\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 14:14:02\"}', '{\"id\":5,\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 14:14:02\"}', '2025-09-19 00:49:01', '2025-09-19 00:49:01'),
(13, 3, 'Rizki Zakaria', 'REMOVE', '{\"id\":3,\"role_name\":\"SCAN IN WH\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 13:37:40\"}', '{\"id\":3,\"role_name\":\"SCAN IN WH\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 13:37:40\"}', '2025-09-19 00:49:08', '2025-09-19 00:49:08'),
(14, 2, 'Rizki Zakaria', 'REMOVE', '{\"id\":2,\"role_name\":\"SCAN OUT VENDOR\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 13:53:26\"}', '{\"id\":2,\"role_name\":\"SCAN OUT VENDOR\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-18 13:53:26\"}', '2025-09-19 00:49:12', '2025-09-19 00:49:12'),
(15, 5, 'Rizki Zakaria', 'RESTORE', '{\"id\":5,\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-19 07:49:01\"}', '{\"id\":5,\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-19 07:49:01\"}', '2025-09-19 01:10:05', '2025-09-19 01:10:05'),
(16, 5, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6]', '2025-09-19 01:11:34', '2025-09-19 01:11:34'),
(17, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\"]', '[6,1,2,3,4,5,7,8,9,10,11]', '2025-09-19 01:19:04', '2025-09-19 01:19:04'),
(18, 1, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"Admin\",\"description\":null}', '{\"role_name\":\"SUPERADMIN\",\"description\":\"\"}', '2025-09-19 01:19:23', '2025-09-19 01:19:23'),
(19, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\"]', '[6,1,2,3,4,5,7,8,9,10,11,12]', '2025-09-19 02:10:03', '2025-09-19 02:10:03'),
(20, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\"]', '[6,1,2,3,4,5,7,8,9,10,11,12,13]', '2025-09-19 02:32:18', '2025-09-19 02:32:18'),
(21, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\"]', '[6,1,2,3,4,5,14,7,8,9,10,11,12,13]', '2025-09-19 03:27:04', '2025-09-19 03:27:04'),
(22, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\"]', '[6,1,2,3,4,5,14,7,8,9,10,11,12,13,15]', '2025-09-19 03:50:05', '2025-09-19 03:50:05'),
(23, 5, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"SCAN IN VENDOR\",\"description\":\"\"}', '{\"role_name\":\"SCAN IN WH\",\"description\":\"\"}', '2025-09-19 08:01:50', '2025-09-19 08:01:50'),
(24, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\"]', '[6,1,2,3,4,5,14,7,8,9,16,10,11,12,13,15]', '2025-09-19 08:14:49', '2025-09-19 08:14:49'),
(25, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\"]', '[6,1,2,3,4,5,14,7,8,9,16,10,11,12,13,15,17]', '2025-09-19 09:40:57', '2025-09-19 09:40:57'),
(26, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\"]', '[6,1,2,3,4,5,14,7,8,9,16,18,10,11,12,13,15,17]', '2025-09-23 07:28:15', '2025-09-23 07:28:15'),
(27, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]', '[6,1,2,3,4,5,14,7,8,9,16,18,10,11,12,13,15,17,19]', '2025-09-23 07:44:16', '2025-09-23 07:44:16'),
(28, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\"]', '[6,1,2,3,4,5,14,20,7,8,9,16,18,10,11,12,13,15,17,19]', '2025-09-23 08:10:22', '2025-09-23 08:10:22'),
(29, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]', '[6,1,2,3,4,5,14,20,7,8,9,16,18,21,10,11,12,13,15,17,19,22]', '2025-09-24 00:27:42', '2025-09-24 00:27:42'),
(30, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\"]', '[6,1,2,3,4,5,14,20,23,7,8,9,16,18,21,24,10,11,12,13,15,17,19,22,25]', '2025-09-24 01:02:11', '2025-09-24 01:02:11'),
(31, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\"]', '[6,1,2,3,4,5,14,20,23,26,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-09-24 07:52:36', '2025-09-24 07:52:36'),
(32, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\"]', '[6,28,29,30,1,2,3,4,5,14,20,23,26,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-09-25 02:35:48', '2025-09-25 02:35:48'),
(33, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\"]', '[6,28,31,29,30,1,2,3,4,5,14,20,23,26,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-09-25 02:40:16', '2025-09-25 02:40:16'),
(34, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\"]', '[6,32,33,28,31,29,30,1,2,3,4,5,14,20,23,26,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-09-29 01:50:52', '2025-09-29 01:50:52'),
(35, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\"]', '[6,32,33,28,31,34,29,30,1,2,3,4,5,14,20,23,26,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-09-29 03:07:43', '2025-09-29 03:07:43'),
(36, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,29,30,1,2,3,4,5,14,20,23,26,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-09-29 06:15:31', '2025-09-29 06:15:31'),
(37, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,29,30,41,1,2,3,4,5,14,20,23,26,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-10-08 03:06:30', '2025-10-08 03:06:30'),
(38, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"43\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,29,30,41,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,10,11,12,13,15,17,19,22,25,27]', '2025-10-08 03:36:41', '2025-10-08 03:36:41'),
(39, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"43\",\"44\",\"45\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,29,30,41,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-10-08 03:40:15', '2025-10-08 03:40:15'),
(40, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,46,29,30,41,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-10-08 04:11:22', '2025-10-08 04:11:22'),
(41, 5, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"SCAN IN WH\",\"gate_type\":\"SCAN IN WH\",\"description\":\"\"}', '{\"role_name\":\"SCAN IN WAREHOUSE\",\"gate_type\":\"SCAN IN WAREHOUSE\",\"description\":\"\"}', '2025-10-09 07:32:55', '2025-10-09 07:32:55'),
(42, 3, 'Rizki Zakaria', 'RESTORE', '{\"id\":3,\"role_name\":\"SCAN IN WH\",\"gate_type\":\"SCAN IN WH\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-19 07:49:08\"}', '{\"id\":3,\"role_name\":\"SCAN IN WH\",\"gate_type\":\"SCAN IN WH\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-19 07:49:08\"}', '2025-10-09 07:33:11', '2025-10-09 07:33:11'),
(43, 2, 'Rizki Zakaria', 'RESTORE', '{\"id\":2,\"role_name\":\"SCAN OUT VENDOR\",\"gate_type\":\"SCAN OUT VENDOR\",\"description\":\"\",\"is_deleted\":1,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-19 07:49:12\"}', '{\"id\":2,\"role_name\":\"SCAN OUT VENDOR\",\"gate_type\":\"SCAN OUT VENDOR\",\"description\":\"\",\"is_deleted\":0,\"updated_by\":\"Rizki Zakaria\",\"timestamp\":\"2025-09-19 07:49:12\"}', '2025-10-09 07:33:14', '2025-10-09 07:33:14'),
(44, 3, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"SCAN IN WH\",\"gate_type\":\"SCAN IN WH\",\"description\":\"\"}', '{\"role_name\":\"SCAN OUT TO VENDOR\",\"gate_type\":\"SCAN OUT TO VENDOR\",\"description\":\"\"}', '2025-10-09 07:34:25', '2025-10-09 07:34:25'),
(45, 2, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"SCAN OUT VENDOR\",\"gate_type\":\"SCAN OUT VENDOR\",\"description\":\"\"}', '{\"role_name\":\"SCAN OUT VENDOR\",\"gate_type\":\"SCAN OUT VENDOR\",\"description\":\"\"}', '2025-10-09 07:34:46', '2025-10-09 07:34:46'),
(46, 6, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN IN VENDOR\",\"gate_type\":\"SCAN IN VENDOR\",\"description\":\"\"}', '2025-10-09 07:35:14', '2025-10-09 07:35:14'),
(47, 7, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN IN INCOMING\",\"gate_type\":\"SCAN IN INCOMING\",\"description\":\"\"}', '2025-10-09 07:35:28', '2025-10-09 07:35:28'),
(48, 8, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN CHECK QC\",\"gate_type\":\"SCAN CHECK QC\",\"description\":\"\"}', '2025-10-09 07:36:14', '2025-10-09 07:36:14'),
(49, 9, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN OUT TO PRODUCTION\",\"gate_type\":\"SCAN OUT TO PRODUCTION\",\"description\":\"\"}', '2025-10-09 07:36:23', '2025-10-09 07:36:23'),
(50, 6, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6,36,46,30,41]', '2025-10-09 07:37:36', '2025-10-09 07:37:36'),
(51, 6, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"30\",\"36\",\"41\",\"46\"]', '[6,28,36,46,30,41]', '2025-10-09 07:38:15', '2025-10-09 07:38:15'),
(52, 2, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6,28,37,46,30,41]', '2025-10-09 07:47:56', '2025-10-09 07:47:56'),
(53, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,46,29,47,30,41,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-10-13 07:20:54', '2025-10-13 07:20:54'),
(54, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,46,29,47,48,30,41,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-10-15 07:27:30', '2025-10-15 07:27:30'),
(55, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\"]', '[6,32,33,28,31,34,35,36,37,38,39,40,46,29,47,48,30,41,49,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-10-21 02:01:06', '2025-10-21 02:01:06'),
(56, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\"]', '[6,32,33,28,31,34,35,38,39,40,46,29,47,48,30,41,49,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-10-24 00:38:37', '2025-10-24 00:38:37'),
(57, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"38\",\"39\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\"]', '[6,32,33,28,31,34,35,38,40,46,29,47,48,30,41,49,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-11-04 01:15:19', '2025-11-04 01:15:19'),
(58, 2, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN IN WH\",\"gate_type\":\"SCAN IN WH\",\"description\":\"\"}', '2025-11-17 02:44:55', '2025-11-17 02:44:55'),
(59, 3, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"SCAN OUT WH\",\"gate_type\":\"SCAN OUT WH\",\"description\":\"\"}', '2025-11-17 02:45:55', '2025-11-17 02:45:55'),
(60, 2, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6,28,31,34,38,46,29,47,48,30,41,49]', '2025-11-17 02:47:37', '2025-11-17 02:47:37'),
(61, 3, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6,28,35,40,29,47,48,30,41,49]', '2025-11-17 02:48:34', '2025-11-17 02:48:34'),
(62, 2, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"SCAN IN WH\",\"gate_type\":\"SCAN IN WH\",\"description\":\"\"}', '{\"role_name\":\"IN WH\",\"gate_type\":\"IN WH\",\"description\":\"\"}', '2025-11-19 02:08:41', '2025-11-19 02:08:41'),
(63, 3, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"SCAN OUT WH\",\"gate_type\":\"SCAN OUT WH\",\"description\":\"\"}', '{\"role_name\":\"OUT WH\",\"gate_type\":\"OUT WH\",\"description\":\"\"}', '2025-11-19 02:09:01', '2025-11-19 02:09:01'),
(64, 2, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"IN WH\",\"gate_type\":\"IN WH\",\"description\":\"\"}', '{\"role_name\":\"IN\",\"gate_type\":\"IN\",\"description\":\"\"}', '2025-11-19 02:17:01', '2025-11-19 02:17:01'),
(65, 3, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"OUT WH\",\"gate_type\":\"OUT WH\",\"description\":\"\"}', '{\"role_name\":\"OUT\",\"gate_type\":\"OUT\",\"description\":\"\"}', '2025-11-19 02:17:09', '2025-11-19 02:17:09'),
(66, 2, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"31\",\"34\",\"38\",\"41\",\"46\",\"47\",\"48\",\"49\"]', '[6,28,31,34,35,38,40,46,29,47,48,30,41,49]', '2025-11-19 02:17:30', '2025-11-19 02:17:30'),
(67, 3, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"35\",\"40\",\"41\",\"47\",\"48\",\"49\"]', '[6,28,34,35,38,40,46,29,47,48,30,41,49]', '2025-11-19 02:17:47', '2025-11-19 02:17:47'),
(68, 4, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"OFFICE\",\"gate_type\":\"OFFICE\",\"description\":\"\"}', '2025-11-19 02:17:55', '2025-11-19 02:17:55'),
(69, 4, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6,32,33,29,47,48,30,41,49]', '2025-11-19 02:18:15', '2025-11-19 02:18:15'),
(70, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]', '[6,32,33,28,31,34,35,38,40,46,29,47,48,50,30,41,49,1,2,3,4,5,14,20,23,26,43,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45]', '2025-12-03 02:05:07', '2025-12-03 02:05:07'),
(71, 2, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"41\",\"46\",\"47\",\"48\",\"49\"]', '[6,28,31,34,35,38,40,46,29,47,48,50,30,41,49]', '2025-12-03 02:05:18', '2025-12-03 02:05:18'),
(72, 4, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"29\",\"30\",\"32\",\"33\",\"41\",\"47\",\"48\",\"49\"]', '[6,32,33,29,47,48,50,30,41,49]', '2025-12-03 02:05:25', '2025-12-03 02:05:25'),
(73, 3, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"34\",\"35\",\"38\",\"40\",\"41\",\"46\",\"47\",\"48\",\"49\"]', '[6,28,34,35,38,40,46,29,47,48,50,30,41,49]', '2025-12-03 02:05:31', '2025-12-03 02:05:31'),
(74, 2, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"IN\",\"gate_type\":\"IN\",\"description\":\"\"}', '{\"role_name\":\"SCAN IN INCOMING\",\"gate_type\":\"SCAN IN INCOMING\",\"description\":\"\"}', '2025-12-09 01:15:27', '2025-12-09 01:15:27'),
(75, 5, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"Admin\",\"gate_type\":\"Admin\",\"description\":\"\"}', '2026-01-12 02:51:00', '2026-01-12 02:51:00'),
(76, 5, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6,32,33,28,31,34,35,36,37,38,39,40,46,29,47,48,50,30,41,49]', '2026-01-12 02:51:27', '2026-01-12 02:51:27'),
(77, 5, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"46\",\"47\",\"48\",\"49\",\"50\"]', '[6,32,33,28,31,34,35,38,40,46,29,47,48,50,30,41,49]', '2026-01-12 02:52:56', '2026-01-12 02:52:56'),
(78, 5, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"Admin\",\"gate_type\":\"Admin\",\"description\":\"\"}', '{\"role_name\":\"ADMIN\",\"gate_type\":\"ADMIN\",\"description\":\"\"}', '2026-01-15 03:18:40', '2026-01-15 03:18:40'),
(79, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,34,35,38,40,46,29,47,48,50,30,41,49,32,33]', '2026-05-06 03:31:01', '2026-05-06 03:31:01'),
(80, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,46,29,47,48,50,30,41,49,32,33]', '2026-05-07 02:44:15', '2026-05-07 02:44:15'),
(81, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,46,29,47,48,50,30,41,49,32,33]', '2026-05-07 07:30:40', '2026-05-07 07:30:40'),
(82, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,46,53,29,47,48,50,30,41,49,32,33]', '2026-05-08 08:36:34', '2026-05-08 08:36:34'),
(83, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,53,46,29,55,30,41,49,32,33]', '2026-05-12 01:48:30', '2026-05-12 01:48:30'),
(84, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"49\",\"51\",\"52\",\"53\",\"55\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,53,46,29,55,30,41,49]', '2026-05-12 01:50:37', '2026-05-12 01:50:37'),
(85, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"46\",\"49\",\"51\",\"52\",\"53\",\"55\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,53,56,29,55,30,41,49]', '2026-05-12 03:37:57', '2026-05-12 03:37:57'),
(86, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,53,56,29,55,47,30,41,49]', '2026-05-13 03:43:43', '2026-05-13 03:43:43'),
(87, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"47\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,53,56,29,55,47,30,41]', '2026-05-18 07:06:31', '2026-05-18 07:06:31'),
(88, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"41\",\"43\",\"44\",\"45\",\"47\",\"51\",\"52\",\"53\",\"55\",\"56\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,53,56,29,55,47,30,49]', '2026-05-18 07:06:45', '2026-05-18 07:06:45'),
(89, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,36,37,38,40,53,56,29,55,47,57,30,49]', '2026-05-28 02:41:42', '2026-05-28 02:41:42'),
(90, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"36\",\"37\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\",\"57\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,57,47,30,49]', '2026-07-07 02:22:17', '2026-07-07 02:22:17'),
(91, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\",\"57\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,47,30,49]', '2026-07-07 02:22:39', '2026-07-07 02:22:39'),
(92, 6, 'Rizki Zakaria', 'INSERT', NULL, '{\"role_name\":\"WS Cutting 1\",\"gate_type\":\"WS Cutting 1\",\"description\":\"\"}', '2026-07-16 03:52:07', '2026-07-16 03:52:07'),
(93, 6, 'Rizki Zakaria', 'INSERT CHECKLIST', '[]', '[6,28,51,53,56,29,55,30,49]', '2026-07-16 03:55:58', '2026-07-16 03:55:58'),
(94, 3, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"OUT\",\"gate_type\":\"OUT\",\"description\":\"\"}', '{\"role_name\":\"WS Pengiriman\",\"gate_type\":\"WS Pengiriman\",\"description\":\"\"}', '2026-07-20 03:06:38', '2026-07-20 03:06:38'),
(95, 3, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"34\",\"35\",\"38\",\"40\",\"41\",\"46\",\"47\",\"48\",\"49\",\"50\"]', '[6,28,52,29,55,30,49]', '2026-07-20 03:07:42', '2026-07-20 03:07:42'),
(96, 2, 'Rizki Zakaria', 'UPDATE', '{\"role_name\":\"SCAN IN INCOMING\",\"gate_type\":\"SCAN IN INCOMING\",\"description\":\"\"}', '{\"role_name\":\"WS Warehouse\",\"gate_type\":\"WS Warehouse\",\"description\":\"\"}', '2026-07-24 07:38:43', '2026-07-24 07:38:43'),
(97, 2, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"41\",\"46\",\"47\",\"48\",\"49\",\"50\"]', '[6,28,34,35,38,40,29,55,30,49]', '2026-07-24 07:39:27', '2026-07-24 07:39:27'),
(98, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,47,58,30,49]', '2026-08-03 06:13:20', '2026-08-03 06:13:20'),
(99, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\",\"58\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,47,58,59,30,49]', '2026-08-04 06:23:08', '2026-08-04 06:23:08'),
(100, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\",\"58\",\"59\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,47,48,58,59,30,49]', '2026-08-24 01:25:40', '2026-08-24 01:25:40'),
(101, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"48\",\"49\",\"51\",\"52\",\"53\",\"55\",\"56\",\"58\",\"59\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,47,48,50,58,59,30,49]', '2026-08-24 01:28:26', '2026-08-24 01:28:26'),
(102, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"55\",\"56\",\"58\",\"59\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,48,60,58,59,50,47,30,49]', '2026-08-27 01:28:41', '2026-08-27 01:28:41'),
(103, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"55\",\"56\",\"58\",\"59\",\"60\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,52,34,35,38,40,53,56,29,55,57,48,60,58,59,50,47,30,49]', '2026-09-02 07:00:01', '2026-09-02 07:00:01'),
(104, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"40\",\"43\",\"44\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,34,35,38,53,56,29,55,57,48,60,58,59,50,47,30,49]', '2026-09-24 03:12:44', '2026-09-24 03:12:44'),
(105, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"43\",\"44\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"53\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,34,35,38,53,56,29,55,57,48,60,58,59,50,47,30,49,61]', '2026-10-27 07:27:53', '2026-10-27 07:27:53'),
(106, 6, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"49\",\"51\",\"53\",\"55\",\"56\"]', '[6,28,51,53,56,29,55,30,49,61]', '2026-10-28 01:12:27', '2026-10-28 01:12:27'),
(107, 1, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"34\",\"35\",\"38\",\"43\",\"44\",\"45\",\"47\",\"48\",\"49\",\"50\",\"51\",\"53\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\"]', '[1,2,3,4,5,14,20,23,26,43,6,7,8,9,16,18,21,44,10,11,12,13,15,17,19,22,25,27,45,28,31,51,34,35,38,53,56,62,29,55,57,48,60,58,59,50,47,30,49,61]', '2026-10-28 04:25:26', '2026-10-28 04:25:26'),
(108, 6, 'Rizki Zakaria', 'UPDATE CHECKLIST', '[\"6\",\"28\",\"29\",\"30\",\"49\",\"51\",\"53\",\"55\",\"56\",\"61\"]', '[6,28,51,53,56,62,29,55,30,49,61]', '2026-10-28 06:31:11', '2026-10-28 06:31:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_time`
--

CREATE TABLE `tlog_time` (
  `id_log_time` int(11) NOT NULL,
  `id_time` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_time`
--

INSERT INTO `tlog_time` (`id_log_time`, `id_time`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(1, 48, 'Rizki Zakaria', 'INSERT', NULL, '{\"start_date\":\"2026-08-03\",\"end_date\":\"2026-08-08\",\"details\":[{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"08:00\"},{\"id_time\":2,\"date_plan\":\"2026-08-03\",\"hour\":\"2\",\"start_hour\":\"08:01\",\"end_hour\":\"09:00\"},{\"id_time\":3,\"date_plan\":\"2026-08-03\",\"hour\":\"3\",\"start_hour\":\"09:01\",\"end_hour\":\"10:00\"},{\"id_time\":4,\"date_plan\":\"2026-08-03\",\"hour\":\"4\",\"start_hour\":\"10:01\",\"end_hour\":\"11:00\"},{\"id_time\":5,\"date_plan\":\"2026-08-03\",\"hour\":\"5\",\"start_hour\":\"11:01\",\"end_hour\":\"13:00\"},{\"id_time\":6,\"date_plan\":\"2026-08-03\",\"hour\":\"6\",\"start_hour\":\"13:01\",\"end_hour\":\"14:00\"},{\"id_time\":7,\"date_plan\":\"2026-08-03\",\"hour\":\"7\",\"start_hour\":\"14:01\",\"end_hour\":\"15:00\"},{\"id_time\":8,\"date_plan\":\"2026-08-03\",\"hour\":\"8\",\"start_hour\":\"15:01\",\"end_hour\":\"16:30\"},{\"id_time\":9,\"date_plan\":\"2026-08-04\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"08:00\"},{\"id_time\":10,\"date_plan\":\"2026-08-04\",\"hour\":\"2\",\"start_hour\":\"08:01\",\"end_hour\":\"09:00\"},{\"id_time\":11,\"date_plan\":\"2026-08-04\",\"hour\":\"3\",\"start_hour\":\"09:01\",\"end_hour\":\"10:00\"},{\"id_time\":12,\"date_plan\":\"2026-08-04\",\"hour\":\"4\",\"start_hour\":\"10:01\",\"end_hour\":\"11:00\"},{\"id_time\":13,\"date_plan\":\"2026-08-04\",\"hour\":\"5\",\"start_hour\":\"11:01\",\"end_hour\":\"13:00\"},{\"id_time\":14,\"date_plan\":\"2026-08-04\",\"hour\":\"6\",\"start_hour\":\"13:01\",\"end_hour\":\"14:00\"},{\"id_time\":15,\"date_plan\":\"2026-08-04\",\"hour\":\"7\",\"start_hour\":\"14:01\",\"end_hour\":\"15:00\"},{\"id_time\":16,\"date_plan\":\"2026-08-04\",\"hour\":\"8\",\"start_hour\":\"15:01\",\"end_hour\":\"16:30\"},{\"id_time\":17,\"date_plan\":\"2026-08-05\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"08:00\"},{\"id_time\":18,\"date_plan\":\"2026-08-05\",\"hour\":\"2\",\"start_hour\":\"08:01\",\"end_hour\":\"09:00\"},{\"id_time\":19,\"date_plan\":\"2026-08-05\",\"hour\":\"3\",\"start_hour\":\"09:01\",\"end_hour\":\"10:00\"},{\"id_time\":20,\"date_plan\":\"2026-08-05\",\"hour\":\"4\",\"start_hour\":\"10:01\",\"end_hour\":\"11:00\"},{\"id_time\":21,\"date_plan\":\"2026-08-05\",\"hour\":\"5\",\"start_hour\":\"11:01\",\"end_hour\":\"13:00\"},{\"id_time\":22,\"date_plan\":\"2026-08-05\",\"hour\":\"6\",\"start_hour\":\"13:01\",\"end_hour\":\"14:00\"},{\"id_time\":23,\"date_plan\":\"2026-08-05\",\"hour\":\"7\",\"start_hour\":\"14:01\",\"end_hour\":\"15:00\"},{\"id_time\":24,\"date_plan\":\"2026-08-05\",\"hour\":\"8\",\"start_hour\":\"15:01\",\"end_hour\":\"16:30\"},{\"id_time\":25,\"date_plan\":\"2026-08-06\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"08:00\"},{\"id_time\":26,\"date_plan\":\"2026-08-06\",\"hour\":\"2\",\"start_hour\":\"08:01\",\"end_hour\":\"09:00\"},{\"id_time\":27,\"date_plan\":\"2026-08-06\",\"hour\":\"3\",\"start_hour\":\"09:01\",\"end_hour\":\"10:00\"},{\"id_time\":28,\"date_plan\":\"2026-08-06\",\"hour\":\"4\",\"start_hour\":\"10:01\",\"end_hour\":\"11:00\"},{\"id_time\":29,\"date_plan\":\"2026-08-06\",\"hour\":\"5\",\"start_hour\":\"11:01\",\"end_hour\":\"13:00\"},{\"id_time\":30,\"date_plan\":\"2026-08-06\",\"hour\":\"6\",\"start_hour\":\"13:01\",\"end_hour\":\"14:00\"},{\"id_time\":31,\"date_plan\":\"2026-08-06\",\"hour\":\"7\",\"start_hour\":\"14:01\",\"end_hour\":\"15:00\"},{\"id_time\":32,\"date_plan\":\"2026-08-06\",\"hour\":\"8\",\"start_hour\":\"15:01\",\"end_hour\":\"16:30\"},{\"id_time\":33,\"date_plan\":\"2026-08-07\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"08:00\"},{\"id_time\":34,\"date_plan\":\"2026-08-07\",\"hour\":\"2\",\"start_hour\":\"08:01\",\"end_hour\":\"09:00\"},{\"id_time\":35,\"date_plan\":\"2026-08-07\",\"hour\":\"3\",\"start_hour\":\"09:01\",\"end_hour\":\"10:00\"},{\"id_time\":36,\"date_plan\":\"2026-08-07\",\"hour\":\"4\",\"start_hour\":\"10:01\",\"end_hour\":\"11:00\"},{\"id_time\":37,\"date_plan\":\"2026-08-07\",\"hour\":\"5\",\"start_hour\":\"11:01\",\"end_hour\":\"13:00\"},{\"id_time\":38,\"date_plan\":\"2026-08-07\",\"hour\":\"6\",\"start_hour\":\"13:01\",\"end_hour\":\"14:00\"},{\"id_time\":39,\"date_plan\":\"2026-08-07\",\"hour\":\"7\",\"start_hour\":\"14:01\",\"end_hour\":\"15:00\"},{\"id_time\":40,\"date_plan\":\"2026-08-07\",\"hour\":\"8\",\"start_hour\":\"15:01\",\"end_hour\":\"16:30\"},{\"id_time\":41,\"date_plan\":\"2026-08-08\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"08:00\"},{\"id_time\":42,\"date_plan\":\"2026-08-08\",\"hour\":\"2\",\"start_hour\":\"08:01\",\"end_hour\":\"09:00\"},{\"id_time\":43,\"date_plan\":\"2026-08-08\",\"hour\":\"3\",\"start_hour\":\"09:01\",\"end_hour\":\"10:00\"},{\"id_time\":44,\"date_plan\":\"2026-08-08\",\"hour\":\"4\",\"start_hour\":\"10:01\",\"end_hour\":\"11:00\"},{\"id_time\":45,\"date_plan\":\"2026-08-08\",\"hour\":\"5\",\"start_hour\":\"11:01\",\"end_hour\":\"13:00\"},{\"id_time\":46,\"date_plan\":\"2026-08-08\",\"hour\":\"6\",\"start_hour\":\"13:01\",\"end_hour\":\"14:00\"},{\"id_time\":47,\"date_plan\":\"2026-08-08\",\"hour\":\"7\",\"start_hour\":\"14:01\",\"end_hour\":\"15:00\"},{\"id_time\":48,\"date_plan\":\"2026-08-08\",\"hour\":\"8\",\"start_hour\":\"15:01\",\"end_hour\":\"16:30\"}]}', '2026-08-03 03:26:16', '2026-08-03 03:26:16'),
(2, 1, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:42\"}', '2026-08-03 03:26:42', '2026-08-03 03:26:42'),
(3, 1, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:42\"}', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:48\"}', '2026-08-03 03:26:48', '2026-08-03 03:26:48'),
(4, 1, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:48\"}', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:17\"}', '2026-08-03 08:59:17', '2026-08-03 08:59:17'),
(5, 2, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":2,\"date_plan\":\"2026-08-03\",\"hour\":\"2\",\"start_hour\":\"08:01:00\",\"end_hour\":\"09:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":2,\"date_plan\":\"2026-08-03\",\"hour\":\"2\",\"start_hour\":\"08:01:00\",\"end_hour\":\"09:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:19\"}', '2026-08-03 08:59:19', '2026-08-03 08:59:19'),
(6, 3, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":3,\"date_plan\":\"2026-08-03\",\"hour\":\"3\",\"start_hour\":\"09:01:00\",\"end_hour\":\"10:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":3,\"date_plan\":\"2026-08-03\",\"hour\":\"3\",\"start_hour\":\"09:01:00\",\"end_hour\":\"10:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:20\"}', '2026-08-03 08:59:20', '2026-08-03 08:59:20'),
(7, 4, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":4,\"date_plan\":\"2026-08-03\",\"hour\":\"4\",\"start_hour\":\"10:01:00\",\"end_hour\":\"11:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":4,\"date_plan\":\"2026-08-03\",\"hour\":\"4\",\"start_hour\":\"10:01:00\",\"end_hour\":\"11:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:20\"}', '2026-08-03 08:59:20', '2026-08-03 08:59:20'),
(8, 5, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":5,\"date_plan\":\"2026-08-03\",\"hour\":\"5\",\"start_hour\":\"11:01:00\",\"end_hour\":\"13:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":5,\"date_plan\":\"2026-08-03\",\"hour\":\"5\",\"start_hour\":\"11:01:00\",\"end_hour\":\"13:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:21\"}', '2026-08-03 08:59:21', '2026-08-03 08:59:21'),
(9, 6, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":6,\"date_plan\":\"2026-08-03\",\"hour\":\"6\",\"start_hour\":\"13:01:00\",\"end_hour\":\"14:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":6,\"date_plan\":\"2026-08-03\",\"hour\":\"6\",\"start_hour\":\"13:01:00\",\"end_hour\":\"14:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:22\"}', '2026-08-03 08:59:22', '2026-08-03 08:59:22'),
(10, 7, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":7,\"date_plan\":\"2026-08-03\",\"hour\":\"7\",\"start_hour\":\"14:01:00\",\"end_hour\":\"15:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":7,\"date_plan\":\"2026-08-03\",\"hour\":\"7\",\"start_hour\":\"14:01:00\",\"end_hour\":\"15:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:22\"}', '2026-08-03 08:59:22', '2026-08-03 08:59:22'),
(11, 8, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":8,\"date_plan\":\"2026-08-03\",\"hour\":\"8\",\"start_hour\":\"15:01:00\",\"end_hour\":\"16:30:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 10:26:16\"}', '{\"id_time\":8,\"date_plan\":\"2026-08-03\",\"hour\":\"8\",\"start_hour\":\"15:01:00\",\"end_hour\":\"16:30:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:23\"}', '2026-08-03 08:59:23', '2026-08-03 08:59:23'),
(12, 6, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":6,\"date_plan\":\"2026-08-03\",\"hour\":\"6\",\"start_hour\":\"13:01:00\",\"end_hour\":\"14:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:22\"}', '{\"id_time\":6,\"date_plan\":\"2026-08-03\",\"hour\":\"6\",\"start_hour\":\"13:01:00\",\"end_hour\":\"14:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:05:40\"}', '2026-08-03 09:05:40', '2026-08-03 09:05:40'),
(13, 7, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":7,\"date_plan\":\"2026-08-03\",\"hour\":\"7\",\"start_hour\":\"14:01:00\",\"end_hour\":\"15:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:22\"}', '{\"id_time\":7,\"date_plan\":\"2026-08-03\",\"hour\":\"7\",\"start_hour\":\"14:01:00\",\"end_hour\":\"15:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:05:42\"}', '2026-08-03 09:05:42', '2026-08-03 09:05:42'),
(14, 8, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":8,\"date_plan\":\"2026-08-03\",\"hour\":\"8\",\"start_hour\":\"15:01:00\",\"end_hour\":\"16:30:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:23\"}', '{\"id_time\":8,\"date_plan\":\"2026-08-03\",\"hour\":\"8\",\"start_hour\":\"15:01:00\",\"end_hour\":\"16:30:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:05:42\"}', '2026-08-03 09:05:42', '2026-08-03 09:05:42'),
(15, 1, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:17\"}', '{\"id_time\":1,\"date_plan\":\"2026-08-03\",\"hour\":\"1\",\"start_hour\":\"06:30:00\",\"end_hour\":\"08:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:06:00\"}', '2026-08-03 09:06:00', '2026-08-03 09:06:00'),
(16, 2, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":2,\"date_plan\":\"2026-08-03\",\"hour\":\"2\",\"start_hour\":\"08:01:00\",\"end_hour\":\"09:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:19\"}', '{\"id_time\":2,\"date_plan\":\"2026-08-03\",\"hour\":\"2\",\"start_hour\":\"08:01:00\",\"end_hour\":\"09:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:06:01\"}', '2026-08-03 09:06:01', '2026-08-03 09:06:01'),
(17, 3, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":3,\"date_plan\":\"2026-08-03\",\"hour\":\"3\",\"start_hour\":\"09:01:00\",\"end_hour\":\"10:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:20\"}', '{\"id_time\":3,\"date_plan\":\"2026-08-03\",\"hour\":\"3\",\"start_hour\":\"09:01:00\",\"end_hour\":\"10:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:06:03\"}', '2026-08-03 09:06:03', '2026-08-03 09:06:03'),
(18, 4, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":4,\"date_plan\":\"2026-08-03\",\"hour\":\"4\",\"start_hour\":\"10:01:00\",\"end_hour\":\"11:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:20\"}', '{\"id_time\":4,\"date_plan\":\"2026-08-03\",\"hour\":\"4\",\"start_hour\":\"10:01:00\",\"end_hour\":\"11:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:06:04\"}', '2026-08-03 09:06:04', '2026-08-03 09:06:04'),
(19, 5, 'Rizki Zakaria', 'TOGGLE', '{\"id_time\":5,\"date_plan\":\"2026-08-03\",\"hour\":\"5\",\"start_hour\":\"11:01:00\",\"end_hour\":\"13:00:00\",\"status\":0,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 15:59:21\"}', '{\"id_time\":5,\"date_plan\":\"2026-08-03\",\"hour\":\"5\",\"start_hour\":\"11:01:00\",\"end_hour\":\"13:00:00\",\"status\":1,\"updated_by\":\"Rizki Zakaria\",\"updated_at\":\"2026-08-03 16:06:04\"}', '2026-08-03 09:06:04', '2026-08-03 09:06:04'),
(20, 56, 'Rizki Zakaria', 'INSERT', NULL, '{\"start_date\":\"2026-09-25\",\"end_date\":\"2026-09-25\",\"details\":[{\"id_time\":49,\"date_plan\":\"2026-09-25\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"07:59\"},{\"id_time\":50,\"date_plan\":\"2026-09-25\",\"hour\":\"2\",\"start_hour\":\"08:00\",\"end_hour\":\"08:59\"},{\"id_time\":51,\"date_plan\":\"2026-09-25\",\"hour\":\"3\",\"start_hour\":\"09:00\",\"end_hour\":\"09:59\"},{\"id_time\":52,\"date_plan\":\"2026-09-25\",\"hour\":\"4\",\"start_hour\":\"10:00\",\"end_hour\":\"10:59\"},{\"id_time\":53,\"date_plan\":\"2026-09-25\",\"hour\":\"5\",\"start_hour\":\"11:00\",\"end_hour\":\"12:59\"},{\"id_time\":54,\"date_plan\":\"2026-09-25\",\"hour\":\"6\",\"start_hour\":\"13:00\",\"end_hour\":\"13:59\"},{\"id_time\":55,\"date_plan\":\"2026-09-25\",\"hour\":\"7\",\"start_hour\":\"14:00\",\"end_hour\":\"14:59\"},{\"id_time\":56,\"date_plan\":\"2026-09-25\",\"hour\":\"8\",\"start_hour\":\"15:00\",\"end_hour\":\"16:00\"}]}', '2026-09-25 02:29:03', '2026-09-25 02:29:03'),
(21, 64, 'Rizki Zakaria', 'INSERT', NULL, '{\"start_date\":\"2026-10-01\",\"end_date\":\"2026-10-01\",\"details\":[{\"id_time\":57,\"date_plan\":\"2026-10-01\",\"hour\":\"1\",\"start_hour\":\"06:30\",\"end_hour\":\"08:00\"},{\"id_time\":58,\"date_plan\":\"2026-10-01\",\"hour\":\"2\",\"start_hour\":\"08:01\",\"end_hour\":\"09:00\"},{\"id_time\":59,\"date_plan\":\"2026-10-01\",\"hour\":\"3\",\"start_hour\":\"09:01\",\"end_hour\":\"10:00\"},{\"id_time\":60,\"date_plan\":\"2026-10-01\",\"hour\":\"4\",\"start_hour\":\"10:01\",\"end_hour\":\"11:00\"},{\"id_time\":61,\"date_plan\":\"2026-10-01\",\"hour\":\"5\",\"start_hour\":\"11:01\",\"end_hour\":\"13:00\"},{\"id_time\":62,\"date_plan\":\"2026-10-01\",\"hour\":\"6\",\"start_hour\":\"13:01\",\"end_hour\":\"14:00\"},{\"id_time\":63,\"date_plan\":\"2026-10-01\",\"hour\":\"7\",\"start_hour\":\"14:01\",\"end_hour\":\"15:00\"},{\"id_time\":64,\"date_plan\":\"2026-10-01\",\"hour\":\"8\",\"start_hour\":\"15:01\",\"end_hour\":\"16:00\"}]}', '2026-10-01 06:37:15', '2026-10-01 06:37:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_transaksi`
--

CREATE TABLE `tlog_transaksi` (
  `id_log_trans` bigint(20) NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_transaksi`
--

INSERT INTO `tlog_transaksi` (`id_log_trans`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(1, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":36,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"14\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"15\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"16\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"17\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"18\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"19\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"20\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"21\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"22\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"23\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"24\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"25\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"26\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"27\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"28\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"29\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"30\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"31\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"32\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"33\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"34\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"35\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"36\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026009\"}]}', '2026-10-26 08:44:52', '2026-10-26 08:44:52'),
(2, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":18,\"detail\":[{\"id_trans\":\"37\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"38\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"39\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"40\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"41\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"42\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"43\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"44\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"45\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"46\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"47\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"48\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"49\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"50\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"51\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"52\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"53\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"54\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026010\"}]}', '2026-10-26 08:48:14', '2026-10-26 08:48:14'),
(3, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"55\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026012\"}]}', '2026-10-26 09:08:19', '2026-10-26 09:08:19'),
(4, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"56\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"10\",\"barcode\":\"10720261026013\"}]}', '2026-10-26 09:08:50', '2026-10-26 09:08:50'),
(5, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"57\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"10\",\"barcode\":\"10720261026014\"}]}', '2026-10-26 09:09:44', '2026-10-26 09:09:44'),
(6, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"58\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"013\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026015\"}]}', '2026-10-26 09:18:13', '2026-10-26 09:18:13'),
(7, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"59\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"011\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026016\"}]}', '2026-10-26 09:19:37', '2026-10-26 09:19:37'),
(8, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"}]}', '2026-10-26 09:58:02', '2026-10-26 09:58:02'),
(9, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026002\"}]}', '2026-10-26 10:00:26', '2026-10-26 10:00:26'),
(10, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026003\"}]}', '2026-10-26 10:00:53', '2026-10-26 10:00:53'),
(11, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"}]}', '2026-10-26 10:02:08', '2026-10-26 10:02:08'),
(12, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"}]}', '2026-10-26 10:36:20', '2026-10-26 10:36:20'),
(13, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026002\"}]}', '2026-10-26 10:38:11', '2026-10-26 10:38:11'),
(14, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026003\"}]}', '2026-10-26 10:38:39', '2026-10-26 10:38:39'),
(15, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":8,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"40\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"}]}', '2026-10-26 10:40:06', '2026-10-26 10:40:06'),
(16, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":8,\"detail\":[{\"id_trans\":\"9\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"40\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"14\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"011\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"15\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"012\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"16\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"013\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026016\"}]}', '2026-10-26 10:41:38', '2026-10-26 10:41:38'),
(17, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":26,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"14\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"15\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"16\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"17\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"18\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"19\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"20\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"21\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"22\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"23\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"24\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"25\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"26\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026003\"}]}', '2026-10-26 10:43:07', '2026-10-26 10:43:07'),
(18, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":7,\"detail\":[{\"id_trans\":\"27\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"28\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"29\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"30\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"31\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"32\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"33\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026004\"}]}', '2026-10-26 10:43:53', '2026-10-26 10:43:53'),
(19, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"34\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"10\",\"barcode\":\"10720261026005\"}]}', '2026-10-26 10:45:16', '2026-10-26 10:45:16'),
(20, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"35\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"}]}', '2026-10-26 10:46:36', '2026-10-26 10:46:36'),
(21, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"36\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026007\"}]}', '2026-10-26 10:51:47', '2026-10-26 10:51:47'),
(22, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"37\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"14\",\"barcode\":\"10720261026008\"}]}', '2026-10-26 10:52:43', '2026-10-26 10:52:43'),
(23, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"38\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026009\"}]}', '2026-10-26 13:34:38', '2026-10-26 13:34:38'),
(24, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"39\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026010\"}]}', '2026-10-26 13:35:25', '2026-10-26 13:35:25'),
(25, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"40\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026011\"}]}', '2026-10-26 13:55:28', '2026-10-26 13:55:28'),
(26, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"41\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026012\"}]}', '2026-10-26 13:58:51', '2026-10-26 13:58:51'),
(27, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"42\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026013\"}]}', '2026-10-26 13:59:24', '2026-10-26 13:59:24'),
(28, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"43\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"10\",\"barcode\":\"10720261026014\"}]}', '2026-10-26 13:59:47', '2026-10-26 13:59:47'),
(29, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"44\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026015\"}]}', '2026-10-26 14:01:43', '2026-10-26 14:01:43'),
(30, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"45\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026016\"}]}', '2026-10-26 14:04:03', '2026-10-26 14:04:03'),
(31, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"46\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026017\"}]}', '2026-10-26 14:09:16', '2026-10-26 14:09:16'),
(32, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"47\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026018\"}]}', '2026-10-26 14:09:36', '2026-10-26 14:09:36'),
(33, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"48\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"10\",\"barcode\":\"10720261026019\"}]}', '2026-10-26 14:10:17', '2026-10-26 14:10:17'),
(34, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"}]}', '2026-10-26 14:18:14', '2026-10-26 14:18:14'),
(35, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026002\"}]}', '2026-10-26 14:35:49', '2026-10-26 14:35:49'),
(36, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026003\"}]}', '2026-10-26 14:38:13', '2026-10-26 14:38:13'),
(37, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"}]}', '2026-10-26 14:40:31', '2026-10-26 14:40:31'),
(38, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"}]}', '2026-10-26 14:47:50', '2026-10-26 14:47:50'),
(39, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":8,\"detail\":[{\"id_trans\":\"6\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026007\"}]}', '2026-10-26 14:49:34', '2026-10-26 14:49:34'),
(40, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"14\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026008\"}]}', '2026-10-26 15:20:52', '2026-10-26 15:20:52'),
(41, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"15\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026009\"}]}', '2026-10-26 15:26:35', '2026-10-26 15:26:35'),
(42, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"16\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026010\"}]}', '2026-10-26 15:30:26', '2026-10-26 15:30:26'),
(43, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"17\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026011\"}]}', '2026-10-26 15:31:03', '2026-10-26 15:31:03'),
(44, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"18\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026012\"}]}', '2026-10-26 15:39:13', '2026-10-26 15:39:13'),
(45, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"19\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026013\"}]}', '2026-10-26 15:41:15', '2026-10-26 15:41:15'),
(46, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":36,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"14\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"15\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"16\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"17\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"18\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"19\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"20\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"21\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"22\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"23\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"24\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"25\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"26\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"27\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"28\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"29\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"30\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"31\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"32\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"33\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"34\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"35\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"36\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026009\"}]}', '2026-10-26 15:42:34', '2026-10-26 15:42:34');
INSERT INTO `tlog_transaksi` (`id_log_trans`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(47, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":56,\"detail\":[{\"id_trans\":\"37\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"38\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"39\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"40\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"41\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"42\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"43\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"44\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"45\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"46\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"47\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"48\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"49\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"50\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"51\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"52\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"53\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"54\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"55\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"56\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"57\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"58\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"59\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"60\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"61\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"62\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"63\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"64\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"65\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"66\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"67\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"30\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"68\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"69\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"70\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"71\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"72\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"73\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"74\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"75\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"76\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"77\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"78\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"79\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"80\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"81\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"82\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"83\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"84\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"85\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"86\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"87\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"88\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"89\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"90\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"91\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"30\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"92\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026017\"}]}', '2026-10-26 15:50:58', '2026-10-26 15:50:58'),
(48, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":56,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"14\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"15\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"16\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"17\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"18\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"19\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"20\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"21\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"22\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"23\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"24\",\"job_order\":\"0803-107-1\",\"lot\":\"3\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"25\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"26\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"27\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"28\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"29\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"30\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"31\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"30\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"32\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"33\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"34\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"35\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"36\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"37\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"38\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"39\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"40\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"41\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"42\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"43\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"44\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"45\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"46\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"47\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"48\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"49\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"50\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"51\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"52\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"53\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"54\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"55\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"30\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"56\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026008\"}]}', '2026-10-26 15:55:54', '2026-10-26 15:55:54'),
(49, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":36,\"detail\":[{\"id_trans\":\"57\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"58\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"59\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"60\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"61\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"62\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"63\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"64\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"65\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"66\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"67\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"68\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"69\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"70\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"71\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"72\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"73\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"74\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"75\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"76\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"77\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"78\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"79\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"80\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"81\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"82\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"83\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026017\"},{\"id_trans\":\"84\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026009\"},{\"id_trans\":\"85\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026010\"},{\"id_trans\":\"86\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026011\"},{\"id_trans\":\"87\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026012\"},{\"id_trans\":\"88\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261026013\"},{\"id_trans\":\"89\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026014\"},{\"id_trans\":\"90\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"012\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026015\"},{\"id_trans\":\"91\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"013\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026016\"},{\"id_trans\":\"92\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261026017\"}]}', '2026-10-26 15:57:33', '2026-10-26 15:57:33'),
(50, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":32,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"011\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"012\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"013\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"14\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"011\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"15\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"012\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"16\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"013\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"17\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"18\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"19\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"20\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"21\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"22\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"011\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"23\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"012\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"30\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"24\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"013\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"},{\"id_trans\":\"25\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"40\",\"barcode\":\"10720261026001\"},{\"id_trans\":\"26\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261026002\"},{\"id_trans\":\"27\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026003\"},{\"id_trans\":\"28\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026004\"},{\"id_trans\":\"29\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261026005\"},{\"id_trans\":\"30\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"011\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261026006\"},{\"id_trans\":\"31\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"012\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261026007\"},{\"id_trans\":\"32\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"013\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"42\",\"barcode\":\"10720261026008\"}]}', '2026-10-26 15:58:38', '2026-10-26 15:58:38'),
(51, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"33\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261027001\"}]}', '2026-10-27 08:23:06', '2026-10-27 08:23:06'),
(52, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"34\",\"job_order\":\"0803-107-1\",\"lot\":\"5\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027002\"}]}', '2026-10-27 08:25:33', '2026-10-27 08:25:33'),
(53, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"35\",\"job_order\":\"0803-107-1\",\"lot\":\"4\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027003\"}]}', '2026-10-27 08:27:14', '2026-10-27 08:27:14'),
(54, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"36\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"24\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261027004\"}]}', '2026-10-27 08:28:52', '2026-10-27 08:28:52'),
(55, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027001\"}]}', '2026-10-27 08:30:12', '2026-10-27 08:30:12'),
(56, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027002\"}]}', '2026-10-27 08:32:52', '2026-10-27 08:32:52'),
(57, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027003\"}]}', '2026-10-27 08:35:20', '2026-10-27 08:35:20'),
(58, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261027004\"}]}', '2026-10-27 08:42:35', '2026-10-27 08:42:35'),
(59, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261027005\"}]}', '2026-10-27 08:42:59', '2026-10-27 08:42:59'),
(60, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"6\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261027006\"}]}', '2026-10-27 08:51:12', '2026-10-27 08:51:12'),
(61, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027007\"}]}', '2026-10-27 08:53:21', '2026-10-27 08:53:21'),
(62, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027008\"}]}', '2026-10-27 08:55:33', '2026-10-27 08:55:33'),
(63, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"002\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027009\"}]}', '2026-10-27 08:56:59', '2026-10-27 08:56:59'),
(64, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"10\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027010\"}]}', '2026-10-27 08:59:08', '2026-10-27 08:59:08'),
(65, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"11\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261027011\"}]}', '2026-10-27 09:08:25', '2026-10-27 09:08:25'),
(66, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":2,\"detail\":[{\"id_trans\":\"12\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261027012\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261027013\"}]}', '2026-10-27 09:16:57', '2026-10-27 09:16:57'),
(67, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":2,\"detail\":[{\"id_trans\":\"14\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"13T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027014\"},{\"id_trans\":\"15\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027015\"}]}', '2026-10-27 09:19:01', '2026-10-27 09:19:01'),
(68, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"16\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"13T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027016\"}]}', '2026-10-27 09:24:37', '2026-10-27 09:24:37'),
(69, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"17\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"003\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027017\"}]}', '2026-10-27 09:25:30', '2026-10-27 09:25:30'),
(70, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":2,\"detail\":[{\"id_trans\":\"18\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027018\"},{\"id_trans\":\"19\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027019\"}]}', '2026-10-27 09:28:40', '2026-10-27 09:28:40'),
(71, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":2,\"detail\":[{\"id_trans\":\"20\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"012\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027020\"},{\"id_trans\":\"21\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"013\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027021\"}]}', '2026-10-27 09:30:03', '2026-10-27 09:30:03'),
(72, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"22\",\"job_order\":\"0803-107-1\",\"lot\":\"6\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027022\"}]}', '2026-10-27 09:34:33', '2026-10-27 09:34:33'),
(73, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"23\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"02T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027023\"}]}', '2026-10-27 09:36:45', '2026-10-27 09:36:45'),
(74, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"24\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"011\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027024\"}]}', '2026-10-27 09:42:03', '2026-10-27 09:42:03'),
(75, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"25\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"011\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027025\"}]}', '2026-10-27 09:44:13', '2026-10-27 09:44:13'),
(76, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"26\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"02T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261027026\"}]}', '2026-10-27 09:54:02', '2026-10-27 09:54:02'),
(77, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":1,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-1\",\"lot\":\"7\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"12\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261027001\"}]}', '2026-10-27 13:13:58', '2026-10-27 13:13:58');
INSERT INTO `tlog_transaksi` (`id_log_trans`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(78, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":4,\"detail\":[{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027002\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261027002\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"003\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261027002\"}]}', '2026-10-27 13:14:28', '2026-10-27 13:14:28'),
(79, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"PLAN\",\"total_success\":4,\"detail\":[{\"id_trans\":\"6\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261028001\"}]}', '2026-10-28 08:50:23', '2026-10-28 08:50:23'),
(80, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"10\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261028002\"}]}', '2026-10-28 13:22:28', '2026-10-28 13:22:28'),
(81, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":3,\"detail\":[{\"id_trans\":\"11\",\"job_order\":\"0803-107-1\",\"lot\":\"1\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"4\",\"barcode\":\"10720261028003\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"001\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"42\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261028004\"},{\"id_trans\":\"13\",\"job_order\":\"0803-107-1\",\"lot\":\"2\",\"size\":\"01T\",\"id_komponen_in\":\"2\",\"komponen\":\"Vamp\",\"qty_plan\":\"6\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261028003\"}]}', '2026-10-28 13:24:42', '2026-10-28 13:24:42'),
(82, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261028001\"}]}', '2026-10-28 14:51:26', '2026-10-28 14:51:26'),
(83, 'Rizki Zakaria', 'QTY_FULFILLMENT', NULL, '{\"action\":\"QTY_FULFILLMENT\",\"ncvs\":\"107\",\"total_success\":1,\"detail\":[{\"source_id_trans\":1,\"new_id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261028002\"}]}', '2026-10-28 15:10:58', '2026-10-28 15:10:58'),
(84, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":1,\"detail\":[{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261028003\"}]}', '2026-10-28 15:28:36', '2026-10-28 15:28:36'),
(85, 'Rizki Zakaria', 'QTY_FULFILLMENT', NULL, '{\"action\":\"QTY_FULFILLMENT\",\"ncvs\":\"107\",\"total_success\":1,\"detail\":[{\"source_id_trans\":3,\"new_id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028004\"}]}', '2026-10-28 15:42:02', '2026-10-28 15:42:02'),
(86, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":12,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028003\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028003\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028003\"},{\"id_trans\":\"10\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"11\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"12\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"002\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028003\"}]}', '2026-10-28 15:46:53', '2026-10-28 15:46:53'),
(87, 'Rizki Zakaria', 'QTY_FULFILLMENT', NULL, '{\"action\":\"QTY_FULFILLMENT\",\"ncvs\":\"107\",\"total_success\":1,\"detail\":[{\"source_id_trans\":10,\"new_id_trans\":\"13\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"qty_pre_setting\":\"20\",\"barcode\":\"10720261028004\"}]}', '2026-10-28 15:48:11', '2026-10-28 15:48:11'),
(88, 'Rizki Zakaria', 'QTY_FULFILLMENT', NULL, '{\"action\":\"QTY_FULFILLMENT\",\"ncvs\":\"107\",\"total_success\":2,\"detail\":[{\"source_id_trans\":12,\"new_id_trans\":\"14\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"002\",\"qty_pre_setting\":\"20\",\"barcode\":\"10720261028005\"},{\"source_id_trans\":11,\"new_id_trans\":\"15\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"qty_pre_setting\":\"4\",\"barcode\":\"10720261028006\"}]}', '2026-10-28 15:49:07', '2026-10-28 15:49:07'),
(89, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":8,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261028002\"}]}', '2026-10-28 15:51:25', '2026-10-28 15:51:25'),
(90, 'Rizki Zakaria', 'QTY_FULFILLMENT', NULL, '{\"action\":\"QTY_FULFILLMENT\",\"ncvs\":\"107\",\"total_success\":2,\"detail\":[{\"source_id_trans\":1,\"new_id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261028003\"},{\"source_id_trans\":3,\"new_id_trans\":\"10\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261028004\"}]}', '2026-10-28 15:52:47', '2026-10-28 15:52:47'),
(91, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":8,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"12\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"5\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"6\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"18\",\"qty_pre_setting\":\"18\",\"barcode\":\"10720261028002\"},{\"id_trans\":\"7\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261028001\"},{\"id_trans\":\"8\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"01T\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"16\",\"qty_pre_setting\":\"16\",\"barcode\":\"10720261028002\"}]}', '2026-10-28 15:54:36', '2026-10-28 15:54:36'),
(92, 'Rizki Zakaria', 'QTY_FULFILLMENT', NULL, '{\"action\":\"QTY_FULFILLMENT\",\"ncvs\":\"107\",\"total_success\":2,\"detail\":[{\"source_id_trans\":1,\"new_id_trans\":\"9\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261028003\"},{\"source_id_trans\":3,\"new_id_trans\":\"10\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261028003\"}]}', '2026-10-28 16:13:46', '2026-10-28 16:13:46'),
(93, 'Rizki Zakaria', 'QTY_FULFILLMENT', NULL, '{\"action\":\"QTY_FULFILLMENT\",\"ncvs\":\"107\",\"total_success\":2,\"detail\":[{\"source_id_trans\":2,\"new_id_trans\":\"11\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"01T\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261028004\"},{\"source_id_trans\":4,\"new_id_trans\":\"12\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"01T\",\"qty_pre_setting\":\"6\",\"barcode\":\"10720261028004\"}]}', '2026-10-28 16:14:49', '2026-10-28 16:14:49'),
(94, 'Rizki Zakaria', 'PRE_SETTING', NULL, '{\"ncvs\":\"107\",\"mode\":\"CUSTOM\",\"total_success\":4,\"detail\":[{\"id_trans\":\"1\",\"job_order\":\"0803-107-2\",\"lot\":\"8\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"24\",\"barcode\":\"10720261029001\"},{\"id_trans\":\"2\",\"job_order\":\"0803-107-2\",\"lot\":\"9\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"30\",\"barcode\":\"10720261029001\"},{\"id_trans\":\"3\",\"job_order\":\"0803-107-2\",\"lot\":\"10\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"36\",\"qty_pre_setting\":\"36\",\"barcode\":\"10720261029001\"},{\"id_trans\":\"4\",\"job_order\":\"0803-107-2\",\"lot\":\"11\",\"size\":\"001\",\"id_komponen_in\":\"23\",\"komponen\":\"Tongue Top\",\"qty_plan\":\"32\",\"qty_pre_setting\":\"32\",\"barcode\":\"10720261029001\"}]}', '2026-10-29 07:37:53', '2026-10-29 07:37:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_upload_master`
--

CREATE TABLE `tlog_upload_master` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `total_rows` int(11) DEFAULT NULL,
  `success_rows` int(11) DEFAULT NULL,
  `failed_rows` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_upload_master`
--

INSERT INTO `tlog_upload_master` (`id`, `id_user`, `username`, `file_name`, `total_rows`, `success_rows`, `failed_rows`, `status`, `created_at`) VALUES
(1, 2, 'Rizki Zakaria', 'template_master_data.xlsx', 92, 92, 0, 'success', '2026-07-14 07:16:52'),
(2, 2, 'Rizki Zakaria', 'template_master_data.xlsx', 402, 402, 0, 'success', '2026-07-17 01:00:10'),
(3, 2, 'Rizki Zakaria', 'template_master_data.xlsx', 59, 56, 3, 'partial', '2026-07-20 02:09:07'),
(4, 2, 'Rizki Zakaria', 'template_master_data.xlsx', 59, 56, 3, 'partial', '2026-07-20 02:29:43'),
(5, 2, 'Rizki Zakaria', 'template_master_data.xlsx', 127, 127, 0, 'success', '2026-07-20 07:47:19'),
(6, 2, 'Rizki Zakaria', 'template_master_data.xlsx', 571, 571, 0, 'success', '2026-10-21 07:31:30'),
(7, 2, 'Rizki Zakaria', 'template_master_data.xlsx', 571, 571, 0, 'success', '2026-10-21 07:34:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_user`
--

CREATE TABLE `tlog_user` (
  `id_log_user` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_user`
--

INSERT INTO `tlog_user` (`id_log_user`, `id_user`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(1, 13, 'Rizki Zakaria', 'INSERT', NULL, '{\"username\":\"Lisdianah\",\"nik_user\":\"0219554\",\"id_card\":\"\",\"ncvs\":\"107\",\"role_id\":\"6\"}', '2026-07-16 03:53:03', '2026-07-16 03:53:03'),
(2, 14, 'Rizki Zakaria', 'INSERT', NULL, '{\"username\":\"Eka Apriliani\",\"nik_user\":\"0215560\",\"id_card\":null,\"ncvs\":\"107\",\"role_id\":\"6\"}', '2026-07-17 07:16:42', '2026-07-17 07:16:42'),
(3, 15, 'Rizki Zakaria', 'INSERT', NULL, '{\"username\":\"Mahmud\",\"nik_user\":\"0111331\",\"id_card\":null,\"ncvs\":\"\",\"role_id\":\"3\"}', '2026-07-20 06:59:13', '2026-07-20 06:59:13'),
(4, 16, 'Rizki Zakaria', 'INSERT', NULL, '{\"username\":\"July\",\"nik_user\":\"09050001\",\"id_card\":null,\"ncvs\":\"\",\"role_id\":\"2\"}', '2026-07-24 07:40:14', '2026-07-24 07:40:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlog_vendor`
--

CREATE TABLE `tlog_vendor` (
  `id_log_vendor` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tlog_vendor`
--

INSERT INTO `tlog_vendor` (`id_log_vendor`, `id_vendor`, `updated_by`, `action_type`, `old_data`, `new_data`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rizki Zakaria', 'INSERT', NULL, '{\"name_vendor\":\"Multi Karya Usaha\",\"code_vendor\":\"MKU-001\",\"alamat\":\"\"}', '2026-05-05 07:01:45', '2026-05-05 07:01:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_id` (`role_id`,`menu_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indeks untuk tabel `tbl_barcode_merge`
--
ALTER TABLE `tbl_barcode_merge`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_defect`
--
ALTER TABLE `tbl_defect`
  ADD PRIMARY KEY (`id_defect`);

--
-- Indeks untuk tabel `tbl_komponen`
--
ALTER TABLE `tbl_komponen`
  ADD PRIMARY KEY (`id_komponen`);

--
-- Indeks untuk tabel `tbl_komponen_proses`
--
ALTER TABLE `tbl_komponen_proses`
  ADD PRIMARY KEY (`id_proses`),
  ADD KEY `id_input` (`id_input`),
  ADD KEY `id_output` (`id_output`);

--
-- Indeks untuk tabel `tbl_master_data`
--
ALTER TABLE `tbl_master_data`
  ADD PRIMARY KEY (`id_data_master`),
  ADD KEY `idx_master_lookup` (`job_order`,`bucket`,`po_code`,`po_item`);

--
-- Indeks untuk tabel `tbl_ncvs`
--
ALTER TABLE `tbl_ncvs`
  ADD PRIMARY KEY (`id_ncvs`);

--
-- Indeks untuk tabel `tbl_plan`
--
ALTER TABLE `tbl_plan`
  ADD PRIMARY KEY (`id_cycle`);

--
-- Indeks untuk tabel `tbl_plan_detail`
--
ALTER TABLE `tbl_plan_detail`
  ADD PRIMARY KEY (`id_cycle_detail`),
  ADD KEY `id_cycle` (`id_cycle`),
  ADD KEY `id_ncvs` (`id_ncvs`);

--
-- Indeks untuk tabel `tbl_time`
--
ALTER TABLE `tbl_time`
  ADD PRIMARY KEY (`id_time`);

--
-- Indeks untuk tabel `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD PRIMARY KEY (`id_trans`),
  ADD KEY `idx_trans_lookup` (`job_order`,`bucket`,`po_code`,`po_item`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_trans`),
  ADD KEY `idx_trans_lookup` (`job_order`,`bucket`,`po_code`,`po_item`);

--
-- Indeks untuk tabel `tbl_transaksi_event`
--
ALTER TABLE `tbl_transaksi_event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indeks untuk tabel `tbl_transaksi_kekurangan`
--
ALTER TABLE `tbl_transaksi_kekurangan`
  ADD PRIMARY KEY (`id_kekurangan`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `role_id` (`role_id`);

--
-- Indeks untuk tabel `tbl_vendor`
--
ALTER TABLE `tbl_vendor`
  ADD PRIMARY KEY (`id_vendor`);

--
-- Indeks untuk tabel `tbl_vendor_proses`
--
ALTER TABLE `tbl_vendor_proses`
  ADD PRIMARY KEY (`id_vendor_proses`);

--
-- Indeks untuk tabel `tlog_defect`
--
ALTER TABLE `tlog_defect`
  ADD PRIMARY KEY (`id_log_defect`);

--
-- Indeks untuk tabel `tlog_komponen`
--
ALTER TABLE `tlog_komponen`
  ADD PRIMARY KEY (`id_log_komponen`);

--
-- Indeks untuk tabel `tlog_login`
--
ALTER TABLE `tlog_login`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tlog_ncvs`
--
ALTER TABLE `tlog_ncvs`
  ADD PRIMARY KEY (`id_log_ncvs`);

--
-- Indeks untuk tabel `tlog_plan`
--
ALTER TABLE `tlog_plan`
  ADD PRIMARY KEY (`id_log_plan`);

--
-- Indeks untuk tabel `tlog_roles`
--
ALTER TABLE `tlog_roles`
  ADD PRIMARY KEY (`id_log_role`);

--
-- Indeks untuk tabel `tlog_time`
--
ALTER TABLE `tlog_time`
  ADD PRIMARY KEY (`id_log_time`);

--
-- Indeks untuk tabel `tlog_transaksi`
--
ALTER TABLE `tlog_transaksi`
  ADD PRIMARY KEY (`id_log_trans`);

--
-- Indeks untuk tabel `tlog_upload_master`
--
ALTER TABLE `tlog_upload_master`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tlog_user`
--
ALTER TABLE `tlog_user`
  ADD PRIMARY KEY (`id_log_user`);

--
-- Indeks untuk tabel `tlog_vendor`
--
ALTER TABLE `tlog_vendor`
  ADD PRIMARY KEY (`id_log_vendor`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2144;

--
-- AUTO_INCREMENT untuk tabel `tbl_barcode_merge`
--
ALTER TABLE `tbl_barcode_merge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_defect`
--
ALTER TABLE `tbl_defect`
  MODIFY `id_defect` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_komponen`
--
ALTER TABLE `tbl_komponen`
  MODIFY `id_komponen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tbl_komponen_proses`
--
ALTER TABLE `tbl_komponen_proses`
  MODIFY `id_proses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tbl_master_data`
--
ALTER TABLE `tbl_master_data`
  MODIFY `id_data_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1876;

--
-- AUTO_INCREMENT untuk tabel `tbl_ncvs`
--
ALTER TABLE `tbl_ncvs`
  MODIFY `id_ncvs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tbl_plan`
--
ALTER TABLE `tbl_plan`
  MODIFY `id_cycle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_plan_detail`
--
ALTER TABLE `tbl_plan_detail`
  MODIFY `id_cycle_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tbl_time`
--
ALTER TABLE `tbl_time`
  MODIFY `id_time` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  MODIFY `id_trans` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_trans` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi_event`
--
ALTER TABLE `tbl_transaksi_event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi_kekurangan`
--
ALTER TABLE `tbl_transaksi_kekurangan`
  MODIFY `id_kekurangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tbl_vendor`
--
ALTER TABLE `tbl_vendor`
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_vendor_proses`
--
ALTER TABLE `tbl_vendor_proses`
  MODIFY `id_vendor_proses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tlog_defect`
--
ALTER TABLE `tlog_defect`
  MODIFY `id_log_defect` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tlog_komponen`
--
ALTER TABLE `tlog_komponen`
  MODIFY `id_log_komponen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tlog_login`
--
ALTER TABLE `tlog_login`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT untuk tabel `tlog_ncvs`
--
ALTER TABLE `tlog_ncvs`
  MODIFY `id_log_ncvs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tlog_plan`
--
ALTER TABLE `tlog_plan`
  MODIFY `id_log_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tlog_roles`
--
ALTER TABLE `tlog_roles`
  MODIFY `id_log_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT untuk tabel `tlog_time`
--
ALTER TABLE `tlog_time`
  MODIFY `id_log_time` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tlog_transaksi`
--
ALTER TABLE `tlog_transaksi`
  MODIFY `id_log_trans` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT untuk tabel `tlog_upload_master`
--
ALTER TABLE `tlog_upload_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tlog_user`
--
ALTER TABLE `tlog_user`
  MODIFY `id_log_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tlog_vendor`
--
ALTER TABLE `tlog_vendor`
  MODIFY `id_log_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_komponen_proses`
--
ALTER TABLE `tbl_komponen_proses`
  ADD CONSTRAINT `tbl_komponen_proses_ibfk_1` FOREIGN KEY (`id_input`) REFERENCES `tbl_komponen` (`id_komponen`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_komponen_proses_ibfk_2` FOREIGN KEY (`id_output`) REFERENCES `tbl_komponen` (`id_komponen`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_plan_detail`
--
ALTER TABLE `tbl_plan_detail`
  ADD CONSTRAINT `tbl_plan_detail_ibfk_1` FOREIGN KEY (`id_cycle`) REFERENCES `tbl_plan` (`id_cycle`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_plan_detail_ibfk_2` FOREIGN KEY (`id_ncvs`) REFERENCES `tbl_ncvs` (`id_ncvs`);

--
-- Ketidakleluasaan untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `tlog_login`
--
ALTER TABLE `tlog_login`
  ADD CONSTRAINT `fk_tloglogin_user` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
