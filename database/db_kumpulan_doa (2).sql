-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Agu 2022 pada 06.57
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kumpulan_doa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_doa`
--

CREATE TABLE `tbl_doa` (
  `doa_id` int(11) NOT NULL,
  `doa_title` varchar(200) NOT NULL,
  `doa_sumber` varchar(22) NOT NULL,
  `doa_text` text NOT NULL,
  `doa_date` date NOT NULL,
  `doa_count_view` int(11) NOT NULL,
  `doa_slug` text NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `tingkat_hadits` text NOT NULL,
  `riwayat_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_doa`
--

INSERT INTO `tbl_doa` (`doa_id`, `doa_title`, `doa_sumber`, `doa_text`, `doa_date`, `doa_count_view`, `doa_slug`, `kategori_id`, `tingkat_hadits`, `riwayat_id`, `user_id`, `createtime`) VALUES
(11, 'Doa Masuk Kamar Mandi', 'Al-Qur\'an', '<p>sdsds</p>\r\n', '2022-06-14', 0, 'doa-masuk-kamar-mandi', 0, '-', '0', 1, '2022-06-14 15:45:26'),
(24, 'Doa Tidursdsd', 'Hadits', '<p>sdsd</p>\r\n', '2022-06-15', 0, 'doa-tidursdsd', 1, 'Hadits Hasan', '1, 3, 4, 5', 1, '2022-06-15 15:30:49'),
(28, 'sdsdsd', 'Hadits', '<p>sdsd</p>\r\n', '2022-06-15', 0, 'sdsdsd', 1, 'Hadits Shahih', '1, 2, 3, 4, 5', 1, '2022-06-15 15:36:38'),
(29, 'Doa Tidur', 'Hadits', '<p>tes</p>\r\n', '2022-06-15', 0, 'doa-tidur', 1, 'Hadits Shahih', '2, 3', 1, '2022-06-15 16:28:08'),
(30, 'Doa Tidur', 'Hadits', '<p>sdsdsd</p>\r\n', '2022-06-16', 0, 'doa-tidur', 1, 'Hadits Hasan', '2', 1, '2022-06-16 07:47:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_group`
--

CREATE TABLE `tbl_group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_group`
--

INSERT INTO `tbl_group` (`group_id`, `group_name`, `createtime`) VALUES
(1, 'Administrator', '2021-02-02 19:26:11'),
(2, 'Inputer', '2021-02-05 14:03:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_name` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kategori_id`, `kategori_name`, `createtime`) VALUES
(0, '-', '2022-06-14 15:30:43'),
(1, 'Pernikahan', '2021-06-10 12:15:50'),
(2, 'Jenazah', '2021-06-10 12:15:54'),
(3, 'Wudhu dan Sholat', '2021-06-10 12:15:58'),
(4, 'Harian', '2021-06-10 12:16:50'),
(5, 'Alam', '2022-05-26 10:37:44'),
(6, 'Lainnya', '2022-05-26 10:37:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `log_time` datetime NOT NULL,
  `log_message` varchar(200) NOT NULL,
  `log_ipaddress` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`log_id`, `log_time`, `log_message`, `log_ipaddress`, `user_id`, `createtime`) VALUES
(1, '2021-02-05 11:28:08', 'Administrator CoreIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-05 11:28:08'),
(2, '2021-02-05 11:28:32', 'administrator menambah data corebase_crud data 1', '127.0.0.1', 1, '2021-02-05 11:28:32'),
(3, '2021-02-05 11:28:43', 'administrator menambah data corebase_crud data 2', '127.0.0.1', 1, '2021-02-05 11:28:43'),
(4, '2021-02-05 11:28:49', 'administrator menambah data corebase_crud data 3', '127.0.0.1', 1, '2021-02-05 11:28:49'),
(5, '2021-02-05 11:28:58', 'administrator mengubah data corebase_crud dengan ID = 3 - data 32', '127.0.0.1', 1, '2021-02-05 11:28:58'),
(6, '2021-02-05 11:29:02', 'administrator menghapus data corebase_crud dengan ID = 3 - data 32', '127.0.0.1', 1, '2021-02-05 11:29:02'),
(7, '2021-02-05 13:59:47', 'administrator menambah data user inputer', '127.0.0.1', 1, '2021-02-05 13:59:47'),
(8, '2021-02-05 14:03:49', 'administrator menambah data group Inputer', '127.0.0.1', 1, '2021-02-05 14:03:49'),
(9, '2021-02-05 14:06:02', 'administrator mengubah data user dengan ID = 2 - inputer', '127.0.0.1', 1, '2021-02-05 14:06:02'),
(10, '2021-02-05 14:06:06', 'administrator mengubah data user dengan ID = 2 - inputer', '127.0.0.1', 1, '2021-02-05 14:06:06'),
(11, '2021-02-05 14:06:27', 'Inputer Coreigniters melakukan login ke sistem', '127.0.0.1', 2, '2021-02-05 14:06:27'),
(12, '2021-02-05 14:06:42', 'administrator mengubah data user dengan ID = 2 - inputer', '127.0.0.1', 1, '2021-02-05 14:06:42'),
(13, '2021-02-05 14:06:58', 'Inputer Coreigniters melakukan login ke sistem', '127.0.0.1', 2, '2021-02-05 14:06:58'),
(14, '2021-02-05 14:07:28', 'Administrator CoreIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-05 14:07:28'),
(15, '2021-02-05 14:12:32', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-05 14:12:32'),
(16, '2021-02-05 14:12:36', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-05 14:12:36'),
(17, '2021-02-05 18:47:59', 'administrator mengubah data profile dengan ID = 1 - ', '127.0.0.1', 1, '2021-02-05 18:47:59'),
(18, '2021-02-05 18:49:18', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:49:18'),
(19, '2021-02-05 18:50:58', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:50:58'),
(20, '2021-02-05 18:51:10', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:51:10'),
(21, '2021-02-05 18:52:41', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:52:41'),
(22, '2021-02-05 18:52:53', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:52:53'),
(23, '2021-02-05 18:58:01', 'administrators mengubah data profile dengan ID = 1 - administrators', '127.0.0.1', 1, '2021-02-05 18:58:01'),
(24, '2021-02-05 18:58:10', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:58:10'),
(25, '2021-02-05 18:59:25', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:59:25'),
(26, '2021-02-05 18:59:54', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 18:59:54'),
(27, '2021-02-05 19:02:40', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 19:02:40'),
(28, '2021-02-05 19:03:38', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-02-05 19:03:38'),
(29, '2021-02-06 18:32:30', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-06 18:32:30'),
(30, '2021-02-06 19:23:39', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-06 19:23:39'),
(31, '2021-02-06 19:23:45', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-06 19:23:45'),
(32, '2021-02-06 19:23:53', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-06 19:23:53'),
(33, '2021-02-06 19:24:02', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-06 19:24:02'),
(34, '2021-02-06 19:53:21', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-06 19:53:21'),
(35, '2021-02-06 19:53:24', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-06 19:53:24'),
(36, '2021-02-07 00:24:58', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-07 00:24:58'),
(37, '2021-02-07 00:25:12', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-07 00:25:12'),
(38, '2021-02-07 00:25:17', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-07 00:25:17'),
(39, '2021-02-07 00:25:26', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-07 00:25:26'),
(40, '2021-02-07 00:25:31', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-02-07 00:25:31'),
(41, '2021-02-07 14:51:02', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-07 14:51:02'),
(42, '2021-02-07 16:59:45', 'administrator menambah data form ', '127.0.0.1', 1, '2021-02-07 16:59:45'),
(43, '2021-02-07 17:01:02', 'administrator menambah data form ', '127.0.0.1', 1, '2021-02-07 17:01:02'),
(44, '2021-02-07 17:05:18', 'administrator menambah data form ', '127.0.0.1', 1, '2021-02-07 17:05:18'),
(45, '2021-02-07 17:10:46', 'administrator menambah data form ', '127.0.0.1', 1, '2021-02-07 17:10:46'),
(46, '2021-02-07 17:11:18', 'administrator menambah data form ', '127.0.0.1', 1, '2021-02-07 17:11:18'),
(47, '2021-02-07 17:19:38', 'administrator menghapus data form dengan ID = 2', '127.0.0.1', 1, '2021-02-07 17:19:38'),
(48, '2021-02-07 17:20:42', 'administrator menambah data form ', '127.0.0.1', 1, '2021-02-07 17:20:42'),
(49, '2021-02-07 17:20:55', 'administrator menambah data form ', '127.0.0.1', 1, '2021-02-07 17:20:55'),
(50, '2021-02-07 17:43:40', 'administrator mengubah data form dengan ID = 3', '127.0.0.1', 1, '2021-02-07 17:43:40'),
(51, '2021-02-07 17:43:46', 'administrator mengubah data form dengan ID = 3', '127.0.0.1', 1, '2021-02-07 17:43:46'),
(52, '2021-02-07 17:43:51', 'administrator mengubah data form dengan ID = 4', '127.0.0.1', 1, '2021-02-07 17:43:51'),
(53, '2021-02-07 17:43:59', 'administrator mengubah data form dengan ID = 4', '127.0.0.1', 1, '2021-02-07 17:43:59'),
(54, '2021-02-07 17:44:03', 'administrator mengubah data form dengan ID = 3', '127.0.0.1', 1, '2021-02-07 17:44:03'),
(55, '2021-02-07 17:44:12', 'administrator mengubah data form dengan ID = 4', '127.0.0.1', 1, '2021-02-07 17:44:12'),
(56, '2021-02-07 17:44:25', 'administrator mengubah data form dengan ID = 4', '127.0.0.1', 1, '2021-02-07 17:44:25'),
(57, '2021-02-07 17:44:51', 'administrator mengubah data form dengan ID = 3', '127.0.0.1', 1, '2021-02-07 17:44:51'),
(58, '2021-02-08 09:13:00', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-08 09:13:00'),
(59, '2021-02-09 13:37:37', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-09 13:37:37'),
(60, '2021-02-12 09:54:28', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-12 09:54:28'),
(61, '2021-02-12 11:21:18', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-12 11:21:18'),
(62, '2021-02-12 11:41:06', 'administrator menghapus data form dengan ID = ', '127.0.0.1', 1, '2021-02-12 11:41:06'),
(63, '2021-02-12 11:42:20', 'administrator menghapus data form dengan ID = ', '127.0.0.1', 1, '2021-02-12 11:42:20'),
(64, '2021-02-12 11:49:02', 'administrator menghapus data form dengan ID = 12', '127.0.0.1', 1, '2021-02-12 11:49:02'),
(65, '2021-02-12 11:49:05', 'administrator menghapus data form dengan ID = 13', '127.0.0.1', 1, '2021-02-12 11:49:05'),
(66, '2021-02-13 15:26:38', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-13 15:26:38'),
(67, '2021-02-22 22:51:48', 'Administrator CodeIgniter melakukan login ke sistem', '::1', 1, '2021-02-22 22:51:48'),
(68, '2021-02-25 07:08:08', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-02-25 07:08:08'),
(69, '2021-03-01 08:24:10', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-01 08:24:10'),
(70, '2021-03-01 08:25:20', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-03-01 08:25:20'),
(71, '2021-03-01 08:25:42', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-03-01 08:25:42'),
(72, '2021-03-02 09:15:56', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 09:15:56'),
(73, '2021-03-02 09:17:33', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 09:17:33'),
(74, '2021-03-02 09:18:57', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-03-02 09:18:57'),
(75, '2021-03-02 13:34:06', 'administrator menambah data sector Sektor Pendidikan', '127.0.0.1', 1, '2021-03-02 13:34:06'),
(76, '2021-03-02 13:34:14', 'administrator mengubah data sector dengan ID = 1 - Sektor Pendidikans', '127.0.0.1', 1, '2021-03-02 13:34:14'),
(77, '2021-03-02 13:34:16', 'administrator menghapus data sector dengan ID = 1 - Sektor Pendidikans', '127.0.0.1', 1, '2021-03-02 13:34:16'),
(78, '2021-03-02 13:34:34', 'administrator menambah data sector Sektor Pendidikan', '127.0.0.1', 1, '2021-03-02 13:34:34'),
(79, '2021-03-02 13:35:14', 'administrator menambah data sector SEKTOR KESEHATAN', '127.0.0.1', 1, '2021-03-02 13:35:14'),
(80, '2021-03-02 13:35:25', 'administrator mengubah data sector dengan ID = 1 - PENDIDIKAN', '127.0.0.1', 1, '2021-03-02 13:35:25'),
(81, '2021-03-02 13:35:31', 'administrator mengubah data sector dengan ID = 2 - KESEHATAN', '127.0.0.1', 1, '2021-03-02 13:35:31'),
(82, '2021-03-02 13:36:01', 'administrator menambah data sector PEKERJAAN UMUM DAN PENATAAN RUANG', '127.0.0.1', 1, '2021-03-02 13:36:01'),
(83, '2021-03-02 13:36:12', 'administrator menambah data sector PERUMAHAN DAN KAWASAN PEMUKIMAN', '127.0.0.1', 1, '2021-03-02 13:36:12'),
(84, '2021-03-02 13:36:22', 'administrator menambah data sector SOSIAL', '127.0.0.1', 1, '2021-03-02 13:36:22'),
(85, '2021-03-02 13:36:34', 'administrator menambah data sector KETENAGAKERJAAN', '127.0.0.1', 1, '2021-03-02 13:36:34'),
(86, '2021-03-02 13:36:46', 'administrator menambah data sector AGRARIA DAN TATA RUANG', '127.0.0.1', 1, '2021-03-02 13:36:46'),
(87, '2021-03-02 13:37:01', 'administrator menambah data sector LINGKUNGAN HIDUP', '127.0.0.1', 1, '2021-03-02 13:37:01'),
(88, '2021-03-02 13:37:17', 'administrator menambah data sector PERHUBUNGAN', '127.0.0.1', 1, '2021-03-02 13:37:17'),
(89, '2021-03-02 13:37:28', 'administrator menambah data sector PERKOPERASIAN DAN USAHA MIKRO, KECIL, MENENGAH', '127.0.0.1', 1, '2021-03-02 13:37:28'),
(90, '2021-03-02 14:38:13', 'administrator menambah data layanan izin/surat Surat Izin Praktik Terapi Gigi dan Mulut', '127.0.0.1', 1, '2021-03-02 14:38:13'),
(91, '2021-03-02 14:59:21', 'administrator mengubah data service dengan ID = 1 - ', '127.0.0.1', 1, '2021-03-02 14:59:21'),
(92, '2021-03-02 14:59:55', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 14:59:55'),
(93, '2021-03-02 15:00:00', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:00:00'),
(94, '2021-03-02 15:00:36', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:00:36'),
(95, '2021-03-02 15:01:37', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:01:37'),
(96, '2021-03-02 15:02:50', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:02:50'),
(97, '2021-03-02 15:04:23', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:04:23'),
(98, '2021-03-02 15:04:30', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:04:30'),
(99, '2021-03-02 15:04:59', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:04:59'),
(100, '2021-03-02 15:05:51', 'administrator menambah data layanan izin/surat Surat Izin Praktik Terapi Gigi dan Mulut Bau', '127.0.0.1', 1, '2021-03-02 15:05:51'),
(101, '2021-03-02 15:06:08', 'administrator mengubah data service dengan ID = 2 - Surat Izin Praktik Terapi Gigi dan Mulut Bau', '127.0.0.1', 1, '2021-03-02 15:06:08'),
(102, '2021-03-02 15:06:16', 'administrator mengubah data service dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:06:16'),
(103, '2021-03-02 15:08:58', 'administrator menghapus layanan izin/surat dengan ID = 2 - Surat Izin Praktik Terapi Gigi dan Mulut Bau', '127.0.0.1', 1, '2021-03-02 15:08:58'),
(104, '2021-03-02 15:09:04', 'administrator menghapus layanan izin/surat dengan ID = 1 - Surat Izin Praktik Terapi Gigi dan Muluts', '127.0.0.1', 1, '2021-03-02 15:09:04'),
(105, '2021-03-02 15:09:30', 'administrator menambah data layanan izin/surat Surat Izin Praktik Terapi Gigi dan Mulut', '127.0.0.1', 1, '2021-03-02 15:09:30'),
(106, '2021-03-02 15:39:01', 'administrator menambah Syarat Izin FC KTP', '127.0.0.1', 1, '2021-03-02 15:39:01'),
(107, '2021-03-02 15:39:34', 'administrator menghapus Syarat Izin dengan ID = 1 - 0', '127.0.0.1', 1, '2021-03-02 15:39:34'),
(108, '2021-03-02 15:39:43', 'administrator menambah Syarat Izin FC KTP', '127.0.0.1', 1, '2021-03-02 15:39:43'),
(109, '2021-03-02 15:39:50', 'administrator menambah Syarat Izin FC NPWP', '127.0.0.1', 1, '2021-03-02 15:39:50'),
(110, '2021-03-02 15:39:55', 'administrator mengubah Syarat Izin dengan ID = 3 - FC NPWPs', '127.0.0.1', 1, '2021-03-02 15:39:55'),
(111, '2021-03-02 15:39:58', 'administrator mengubah Syarat Izin dengan ID = 2 - FC KTPs', '127.0.0.1', 1, '2021-03-02 15:39:58'),
(112, '2021-03-02 15:40:03', 'administrator mengubah Syarat Izin dengan ID = 2 - FC KTP', '127.0.0.1', 1, '2021-03-02 15:40:03'),
(113, '2021-03-02 15:40:06', 'administrator mengubah Syarat Izin dengan ID = 3 - FC NPWP', '127.0.0.1', 1, '2021-03-02 15:40:06'),
(114, '2021-03-02 15:40:34', 'administrator menghapus Syarat Izin dengan ID = 3 - FC NPWP', '127.0.0.1', 1, '2021-03-02 15:40:34'),
(115, '2021-03-02 15:42:03', 'administrator menambah data layanan izin/surat Surat Izin Praktik Terapi Gigi dan Mulut Bau', '127.0.0.1', 1, '2021-03-02 15:42:03'),
(116, '2021-03-02 15:46:17', 'administrator menambah Syarat Izin asdasd', '127.0.0.1', 1, '2021-03-02 15:46:17'),
(117, '2021-03-02 15:47:47', 'administrator menghapus layanan izin/surat dengan ID = 4 - Surat Izin Praktik Terapi Gigi dan Mulut Bau', '127.0.0.1', 1, '2021-03-02 15:47:47'),
(118, '2021-03-02 16:01:40', 'administrator menambah data kategori bidang berita Semua', '127.0.0.1', 1, '2021-03-02 16:01:40'),
(119, '2021-03-02 16:02:04', 'administrator menambah data kategori bidang berita Kepala Dinas DPMPTSP', '127.0.0.1', 1, '2021-03-02 16:02:04'),
(120, '2021-03-02 16:02:23', 'administrator menambah data kategori bidang berita Sekretariat DPMPTSP', '127.0.0.1', 1, '2021-03-02 16:02:23'),
(121, '2021-03-02 16:02:42', 'administrator menambah data kategori bidang berita Bidang A', '127.0.0.1', 1, '2021-03-02 16:02:42'),
(122, '2021-03-02 16:02:47', 'administrator menambah data kategori bidang berita Bidang B', '127.0.0.1', 1, '2021-03-02 16:02:47'),
(123, '2021-03-02 17:36:25', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 17:36:25'),
(124, '2021-03-02 18:04:17', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 18:04:17'),
(125, '2021-03-02 18:13:47', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 18:13:47'),
(126, '2021-03-02 18:23:30', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 18:23:30'),
(127, '2021-03-02 18:39:15', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 18:39:15'),
(128, '2021-03-02 18:42:23', 'Administrator CodeIgniter melakukan login ke sistem', '::1', 1, '2021-03-02 18:42:23'),
(129, '2021-03-02 18:56:08', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 18:56:08'),
(130, '2021-03-02 19:18:04', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-02 19:18:04'),
(131, '2021-03-03 07:44:34', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-03 07:44:34'),
(132, '2021-03-03 07:45:52', 'administrator menambah data berita ', '127.0.0.1', 1, '2021-03-03 07:45:52'),
(133, '2021-03-03 07:57:02', 'administrator mengubah data berita dengan ID = 1', '127.0.0.1', 1, '2021-03-03 07:57:02'),
(134, '2021-03-03 07:57:40', 'administrator mengubah data berita dengan ID = 1', '127.0.0.1', 1, '2021-03-03 07:57:40'),
(135, '2021-03-03 08:01:21', 'administrator menghapus data berita dengan ID = 1', '127.0.0.1', 1, '2021-03-03 08:01:21'),
(136, '2021-03-03 08:12:40', 'administrator menambah data berita ', '127.0.0.1', 1, '2021-03-03 08:12:40'),
(137, '2021-03-03 08:21:27', 'administrator mengubah data berita dengan ID = 2', '127.0.0.1', 1, '2021-03-03 08:21:27'),
(138, '2021-03-03 08:22:05', 'administrator mengubah data berita dengan ID = 2', '127.0.0.1', 1, '2021-03-03 08:22:05'),
(139, '2021-03-03 10:21:05', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-03 10:21:05'),
(140, '2021-03-03 12:33:33', 'administrator mengubah data konten profil dinas dengan ID = 1', '127.0.0.1', 1, '2021-03-03 12:33:33'),
(141, '2021-03-03 12:33:41', 'administrator mengubah data konten profil dinas dengan ID = 4', '127.0.0.1', 1, '2021-03-03 12:33:41'),
(142, '2021-03-03 12:34:32', 'administrator mengubah data konten profil dinas dengan ID = 1', '127.0.0.1', 1, '2021-03-03 12:34:32'),
(143, '2021-03-03 12:35:21', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '127.0.0.1', 1, '2021-03-03 12:35:21'),
(144, '2021-03-03 12:36:06', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '127.0.0.1', 1, '2021-03-03 12:36:06'),
(145, '2021-03-03 12:36:13', 'administrator mengubah data konten profil dinas dengan ID = visi', '127.0.0.1', 1, '2021-03-03 12:36:13'),
(146, '2021-03-03 12:36:22', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '127.0.0.1', 1, '2021-03-03 12:36:22'),
(147, '2021-03-03 12:36:28', 'administrator mengubah data konten profil dinas dengan ID = maklumat', '127.0.0.1', 1, '2021-03-03 12:36:28'),
(148, '2021-03-03 12:40:02', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '127.0.0.1', 1, '2021-03-03 12:40:02'),
(149, '2021-03-03 12:40:09', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '127.0.0.1', 1, '2021-03-03 12:40:09'),
(150, '2021-03-03 12:40:17', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '127.0.0.1', 1, '2021-03-03 12:40:17'),
(151, '2021-03-03 12:46:38', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '127.0.0.1', 1, '2021-03-03 12:46:38'),
(152, '2021-03-03 12:46:43', 'administrator mengubah data konten profil dinas menu = sambutan', '127.0.0.1', 1, '2021-03-03 12:46:43'),
(153, '2021-03-03 12:48:18', 'administrator mengubah data konten profil dinas menu = sambutan', '127.0.0.1', 1, '2021-03-03 12:48:18'),
(154, '2021-03-03 12:49:13', 'administrator mengubah data konten profil dinas menu = sambutan', '127.0.0.1', 1, '2021-03-03 12:49:13'),
(155, '2021-03-03 13:24:23', 'administrator menambah data slider dengan ID = ', '127.0.0.1', 1, '2021-03-03 13:24:23'),
(156, '2021-03-03 13:30:18', 'administrator menambah data slider dengan ID = 1', '127.0.0.1', 1, '2021-03-03 13:30:18'),
(157, '2021-03-03 13:30:18', 'administrator mengubah data slider dengan ID = 1 - 1', '127.0.0.1', 1, '2021-03-03 13:30:18'),
(158, '2021-03-03 13:30:25', 'administrator menambah data slider dengan ID = 1', '127.0.0.1', 1, '2021-03-03 13:30:25'),
(159, '2021-03-03 13:30:25', 'administrator mengubah data slider dengan ID = 1 - 1', '127.0.0.1', 1, '2021-03-03 13:30:25'),
(160, '2021-03-03 13:30:58', 'administrator menambah data slider dengan ID = 1', '127.0.0.1', 1, '2021-03-03 13:30:58'),
(161, '2021-03-03 13:30:58', 'administrator mengubah data slider dengan ID = 1 - 1', '127.0.0.1', 1, '2021-03-03 13:30:58'),
(162, '2021-03-03 13:32:34', 'administrator menghapus data slider dengan ID = 1 - 1', '127.0.0.1', 1, '2021-03-03 13:32:34'),
(163, '2021-03-03 13:45:34', 'administrator menambah data Regulasi dengan ID = ', '127.0.0.1', 1, '2021-03-03 13:45:34'),
(164, '2021-03-03 13:47:00', 'administrator menambah data Regulasi dengan ID = 1', '127.0.0.1', 1, '2021-03-03 13:47:00'),
(165, '2021-03-03 13:47:07', 'administrator menghapus data Regulasi dengan ID = 1 - 1', '127.0.0.1', 1, '2021-03-03 13:47:07'),
(166, '2021-03-03 14:03:13', 'administrator menambah data tracking Indra', '127.0.0.1', 1, '2021-03-03 14:03:13'),
(167, '2021-03-03 14:08:17', 'administrator mengubah data tracking dengan ID = 1 - Indras', '127.0.0.1', 1, '2021-03-03 14:08:17'),
(168, '2021-03-03 14:11:40', 'administrator mengubah data tracking dengan ID = 1 - Indrass', '127.0.0.1', 1, '2021-03-03 14:11:40'),
(169, '2021-03-03 14:11:50', 'administrator menambah data tracking dfgdgf', '127.0.0.1', 1, '2021-03-03 14:11:50'),
(170, '2021-03-03 14:11:55', 'administrator mengubah data tracking dengan ID = 2 - dfgdgfsss45345', '127.0.0.1', 1, '2021-03-03 14:11:55'),
(171, '2021-03-03 14:16:24', 'administrator mengubah data tracking dengan ID = 2', '127.0.0.1', 1, '2021-03-03 14:16:24'),
(172, '2021-03-03 14:16:27', 'administrator mengubah data tracking dengan ID = 1', '127.0.0.1', 1, '2021-03-03 14:16:27'),
(173, '2021-03-03 15:09:52', 'administrator menambah data Struktur Organisasi dengan ID = ', '127.0.0.1', 1, '2021-03-03 15:09:52'),
(174, '2021-03-03 15:10:32', 'administrator menambah data Struktur Organisasi dengan ID = ', '127.0.0.1', 1, '2021-03-03 15:10:32'),
(175, '2021-03-03 15:13:42', 'administrator mengubah data Struktur Organisasi dengan ID = 2', '127.0.0.1', 1, '2021-03-03 15:13:42'),
(176, '2021-03-03 15:14:42', 'administrator menambah data Struktur Organisasi dengan ID = 2', '127.0.0.1', 1, '2021-03-03 15:14:42'),
(177, '2021-03-03 21:41:34', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-03 21:41:34'),
(178, '2021-03-03 21:42:01', 'administrator mengubah data konten profil dinas dengan ID = visi', '127.0.0.1', 1, '2021-03-03 21:42:01'),
(179, '2021-03-03 21:42:07', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '127.0.0.1', 1, '2021-03-03 21:42:07'),
(180, '2021-03-03 21:42:15', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '127.0.0.1', 1, '2021-03-03 21:42:15'),
(181, '2021-03-03 21:42:21', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '127.0.0.1', 1, '2021-03-03 21:42:21'),
(182, '2021-03-03 21:42:28', 'administrator mengubah data konten profil dinas dengan ID = maklumat', '127.0.0.1', 1, '2021-03-03 21:42:28'),
(183, '2021-03-03 22:26:43', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-03-03 22:26:43'),
(184, '2021-03-03 22:26:52', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-03-03 22:26:52'),
(185, '2021-03-03 22:26:59', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-03-03 22:26:59'),
(186, '2021-03-03 22:29:52', 'administrator mengubah data group dengan ID = 2 - Inputer Berita', '127.0.0.1', 1, '2021-03-03 22:29:52'),
(187, '2021-03-03 22:30:45', 'administrator mengubah data user dengan ID = 2 - inputer', '127.0.0.1', 1, '2021-03-03 22:30:45'),
(188, '2021-03-03 22:36:34', 'Inputer PTSP melakukan login ke sistem', '127.0.0.1', 2, '2021-03-03 22:36:34'),
(189, '2021-03-03 22:38:06', 'Inputer PTSP melakukan login ke sistem', '127.0.0.1', 2, '2021-03-03 22:38:06'),
(190, '2021-03-03 22:46:58', 'inputer mengubah data profile dengan ID = 2 - inputer', '127.0.0.1', 2, '2021-03-03 22:46:58'),
(191, '2021-03-04 14:02:48', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-04 14:02:48'),
(192, '2021-03-04 14:05:59', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '127.0.0.1', 1, '2021-03-04 14:05:59'),
(193, '2021-03-04 14:26:22', 'Administrator CodeIgniter melakukan login ke sistem', '::1', 1, '2021-03-04 14:26:22'),
(194, '2021-03-04 14:26:39', 'administrator menghapus data berita dengan ID = 2', '::1', 1, '2021-03-04 14:26:39'),
(195, '2021-03-04 14:31:09', 'administrator menambah data slider dengan ID = ', '::1', 1, '2021-03-04 14:31:09'),
(196, '2021-03-04 14:32:53', 'administrator menambah data slider dengan ID = ', '::1', 1, '2021-03-04 14:32:53'),
(197, '2021-03-04 14:34:37', 'administrator menambah data slider dengan ID = ', '::1', 1, '2021-03-04 14:34:37'),
(198, '2021-03-04 14:54:13', 'administrator menambah data berita ', '::1', 1, '2021-03-04 14:54:13'),
(199, '2021-03-04 14:57:07', 'administrator menambah data berita ', '::1', 1, '2021-03-04 14:57:07'),
(200, '2021-03-04 14:59:13', 'administrator menambah data berita ', '::1', 1, '2021-03-04 14:59:13'),
(201, '2021-03-04 15:12:46', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '::1', 1, '2021-03-04 15:12:46'),
(202, '2021-03-04 15:19:27', 'administrator mengubah data konten profil dinas dengan ID = visi', '::1', 1, '2021-03-04 15:19:27'),
(203, '2021-03-04 15:22:11', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '::1', 1, '2021-03-04 15:22:11'),
(204, '2021-03-04 15:23:04', 'administrator mengubah data konten profil dinas dengan ID = visi', '::1', 1, '2021-03-04 15:23:04'),
(205, '2021-03-04 15:25:25', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '::1', 1, '2021-03-04 15:25:25'),
(206, '2021-03-04 15:29:18', 'administrator mengubah data konten profil dinas menu = sambutan', '::1', 1, '2021-03-04 15:29:18'),
(207, '2021-03-04 15:38:57', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '::1', 1, '2021-03-04 15:38:57'),
(208, '2021-03-04 15:40:14', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '::1', 1, '2021-03-04 15:40:14'),
(209, '2021-03-04 15:40:20', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '::1', 1, '2021-03-04 15:40:20'),
(210, '2021-03-04 15:41:32', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '::1', 1, '2021-03-04 15:41:32'),
(211, '2021-03-04 15:43:55', 'administrator mengubah data konten profil dinas dengan ID = maklumat', '::1', 1, '2021-03-04 15:43:55'),
(212, '2021-03-04 15:51:59', 'administrator mengubah data Struktur Organisasi dengan ID = 1', '::1', 1, '2021-03-04 15:51:59'),
(213, '2021-03-04 15:52:11', 'administrator menambah data Struktur Organisasi dengan ID = 1', '::1', 1, '2021-03-04 15:52:11'),
(214, '2021-03-04 15:53:09', 'administrator mengubah data Struktur Organisasi dengan ID = 1', '::1', 1, '2021-03-04 15:53:09'),
(215, '2021-03-04 15:53:18', 'administrator menambah data Struktur Organisasi dengan ID = 1', '::1', 1, '2021-03-04 15:53:18'),
(216, '2021-03-04 15:53:29', 'administrator mengubah data Struktur Organisasi dengan ID = 1', '::1', 1, '2021-03-04 15:53:29'),
(217, '2021-03-04 15:53:40', 'administrator mengubah data Struktur Organisasi dengan ID = 1', '::1', 1, '2021-03-04 15:53:40'),
(218, '2021-03-04 15:53:56', 'administrator mengubah data Struktur Organisasi dengan ID = 1', '::1', 1, '2021-03-04 15:53:56'),
(219, '2021-03-04 15:56:35', 'administrator menambah data Struktur Organisasi dengan ID = 2', '::1', 1, '2021-03-04 15:56:35'),
(220, '2021-03-04 15:57:31', 'administrator menambah data Struktur Organisasi dengan ID = ', '::1', 1, '2021-03-04 15:57:31'),
(221, '2021-03-04 15:58:17', 'administrator menambah data Struktur Organisasi dengan ID = ', '::1', 1, '2021-03-04 15:58:17'),
(222, '2021-03-04 16:09:34', 'administrator menambah data Regulasi dengan ID = ', '::1', 1, '2021-03-04 16:09:34'),
(223, '2021-03-04 16:10:06', 'administrator menambah data Regulasi dengan ID = ', '::1', 1, '2021-03-04 16:10:06'),
(224, '2021-03-04 16:13:01', 'administrator menambah data Regulasi dengan ID = ', '::1', 1, '2021-03-04 16:13:01'),
(225, '2021-03-04 16:29:49', 'administrator menghapus layanan izin/surat dengan ID = 3 - Surat Izin Praktik Terapi Gigi dan Mulut', '::1', 1, '2021-03-04 16:29:49'),
(226, '2021-03-04 16:36:14', 'administrator menambah data layanan izin/surat Surat Izin Praktik Tenaga Gizi', '::1', 1, '2021-03-04 16:36:14'),
(227, '2021-03-04 16:37:14', 'administrator menambah data layanan izin/surat Surat Izin Praktik Tenaga Teknis Kefarmasian', '::1', 1, '2021-03-04 16:37:14'),
(228, '2021-03-04 16:38:04', 'administrator menambah data layanan izin/surat Surat Izin Praktik Terapi Gigi dan Mulut', '::1', 1, '2021-03-04 16:38:04'),
(229, '2021-03-04 16:39:00', 'administrator menambah Syarat Izin FC KTP', '::1', 1, '2021-03-04 16:39:00'),
(230, '2021-03-04 16:39:07', 'administrator menambah Syarat Izin FC NPWP', '::1', 1, '2021-03-04 16:39:07'),
(231, '2021-03-04 16:39:15', 'administrator menambah Syarat Izin FC STR', '::1', 1, '2021-03-04 16:39:15'),
(232, '2021-03-04 16:39:25', 'administrator menambah Syarat Izin FC KTP', '::1', 1, '2021-03-04 16:39:25'),
(233, '2021-03-04 16:39:32', 'administrator menambah Syarat Izin FC NPWP', '::1', 1, '2021-03-04 16:39:32'),
(234, '2021-03-04 16:39:39', 'administrator menambah Syarat Izin FC STR', '::1', 1, '2021-03-04 16:39:39'),
(235, '2021-03-04 16:39:50', 'administrator menambah Syarat Izin FC KTP', '::1', 1, '2021-03-04 16:39:50'),
(236, '2021-03-04 16:39:55', 'administrator menambah Syarat Izin FC NPWP', '::1', 1, '2021-03-04 16:39:55'),
(237, '2021-03-04 16:40:02', 'administrator menambah Syarat Izin FC STR', '::1', 1, '2021-03-04 16:40:02'),
(238, '2021-03-06 12:54:41', 'Administrator CodeIgniter melakukan login ke sistem', '::1', 1, '2021-03-06 12:54:41'),
(239, '2021-03-06 12:54:50', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '::1', 1, '2021-03-06 12:54:50'),
(240, '2021-03-06 14:47:21', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-06 14:47:21'),
(241, '2021-03-06 15:12:21', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-03-06 15:12:21'),
(242, '2021-03-06 15:13:26', 'administrator menghapus data message dengan ID = 5 - asdasd', '127.0.0.1', 1, '2021-03-06 15:13:26'),
(243, '2021-03-06 18:49:16', 'Administrator CodeIgniter melakukan login ke sistem', '::1', 1, '2021-03-06 18:49:16'),
(244, '2021-03-06 18:49:44', 'administrator menambah data Struktur Organisasi dengan nama = Tes', '::1', 1, '2021-03-06 18:49:44'),
(245, '2021-03-06 19:02:20', 'administrator menghapus data Struktur Organisasi dengan ID = 5 - 5', '::1', 1, '2021-03-06 19:02:20'),
(246, '2021-03-09 11:56:51', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-09 11:56:51'),
(247, '2021-03-09 12:19:08', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-09 12:19:08'),
(248, '2021-03-09 12:28:23', 'administrator mengubah data slider dengan ID = 3', '172.30.10.1', 1, '2021-03-09 12:28:23'),
(249, '2021-03-10 09:53:56', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-10 09:53:56'),
(250, '2021-03-10 09:56:50', 'administrator mengubah data slider dengan ID = 4', '172.30.10.1', 1, '2021-03-10 09:56:50'),
(251, '2021-03-10 09:58:21', 'administrator mengubah data slider dengan ID = 2', '172.30.10.1', 1, '2021-03-10 09:58:21'),
(252, '2021-03-10 09:58:37', 'administrator mengubah data slider dengan ID = 2', '172.30.10.1', 1, '2021-03-10 09:58:37'),
(253, '2021-03-10 09:58:47', 'administrator mengubah data slider dengan ID = 4', '172.30.10.1', 1, '2021-03-10 09:58:47'),
(254, '2021-03-10 15:23:39', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-10 15:23:39'),
(255, '2021-03-10 15:27:37', 'administrator mengubah data Struktur Organisasi dengan ID = 2', '172.30.10.1', 1, '2021-03-10 15:27:37'),
(256, '2021-03-10 15:28:18', 'administrator mengubah data Struktur Organisasi dengan ID = 3', '172.30.10.1', 1, '2021-03-10 15:28:18'),
(257, '2021-03-10 15:35:12', 'administrator menambah data Struktur Organisasi dengan nama = RACHMAT MAULANA, SH', '172.30.10.1', 1, '2021-03-10 15:35:12'),
(258, '2021-03-10 15:39:05', 'administrator menambah data Struktur Organisasi dengan nama = ARNI NADIMIN. S. Sos', '172.30.10.1', 1, '2021-03-10 15:39:05'),
(259, '2021-03-10 15:49:17', 'administrator menambah data Struktur Organisasi dengan nama = RUSTAM RUSLI, ST', '172.30.10.1', 1, '2021-03-10 15:49:17'),
(260, '2021-03-10 16:11:40', 'administrator menambah data Struktur Organisasi dengan nama = MUTMAINNAH UMAR, SH', '172.30.10.1', 1, '2021-03-10 16:11:40'),
(261, '2021-03-12 16:01:25', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-12 16:01:25'),
(262, '2021-03-12 16:35:54', 'administrator menghapus data Struktur Organisasi dengan ID = 4 - 4', '172.30.10.1', 1, '2021-03-12 16:35:54'),
(263, '2021-03-12 16:40:17', 'administrator menambah data Struktur Organisasi dengan nama = MAWARI, S.Pd., M.Sc.', '172.30.10.1', 1, '2021-03-12 16:40:17'),
(264, '2021-03-12 16:44:11', 'administrator menambah data Struktur Organisasi dengan nama = NISFUL IMTIKHAN, SH', '172.30.10.1', 1, '2021-03-12 16:44:11'),
(265, '2021-03-12 16:49:09', 'administrator menambah data Struktur Organisasi dengan nama = HARYONO, S. Sos', '172.30.10.1', 1, '2021-03-12 16:49:09'),
(266, '2021-03-12 16:53:13', 'administrator menambah data Struktur Organisasi dengan nama = DEWI SARTIKA', '172.30.10.1', 1, '2021-03-12 16:53:13'),
(267, '2021-03-12 16:58:02', 'administrator menambah data Struktur Organisasi dengan nama = NURFATMA, SH', '172.30.10.1', 1, '2021-03-12 16:58:02'),
(268, '2021-03-12 17:00:54', 'administrator menambah data Struktur Organisasi dengan nama = WAODE NURFALINA SUHA, SE', '172.30.10.1', 1, '2021-03-12 17:00:54'),
(269, '2021-03-12 17:41:22', 'administrator menambah data Struktur Organisasi dengan nama = HASNIAH, A. Md', '172.30.10.1', 1, '2021-03-12 17:41:22'),
(270, '2021-03-12 17:44:22', 'administrator menambah data Struktur Organisasi dengan nama = WA ODE ROSDIANA, SE', '172.30.10.1', 1, '2021-03-12 17:44:22'),
(271, '2021-03-12 17:46:26', 'administrator menambah data Struktur Organisasi dengan nama = WA ODE SITTI HASANAH', '172.30.10.1', 1, '2021-03-12 17:46:26'),
(272, '2021-03-15 00:21:57', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-15 00:21:57'),
(273, '2021-03-15 00:22:47', 'Update Informasi Sistem ', '172.30.10.1', 1, '2021-03-15 00:22:47'),
(274, '2021-03-15 09:28:07', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-15 09:28:07'),
(275, '2021-03-15 10:08:18', 'administrator menambah data Struktur Organisasi dengan nama = WA ODE SARWATI, S. Sos', '172.30.10.1', 1, '2021-03-15 10:08:18'),
(276, '2021-03-15 10:28:13', 'administrator menambah data Struktur Organisasi dengan nama = MAKSUDDIN BUCHARI, S.Pi', '172.30.10.1', 1, '2021-03-15 10:28:13'),
(277, '2021-03-15 10:49:55', 'administrator menambah data Struktur Organisasi dengan nama = TEGAR ARYU SAPUTRA, SH., MH', '172.30.10.1', 1, '2021-03-15 10:49:55'),
(278, '2021-03-15 11:28:06', 'administrator menambah data Struktur Organisasi dengan nama = HAFID, SE', '172.30.10.1', 1, '2021-03-15 11:28:06'),
(279, '2021-03-15 11:33:46', 'administrator menambah data Struktur Organisasi dengan nama = ZURYATI, SE', '172.30.10.1', 1, '2021-03-15 11:33:46'),
(280, '2021-03-15 13:23:28', 'administrator menambah data Struktur Organisasi dengan nama = MUHAMMAD SOFRIL, S.Pi., MM', '172.30.10.1', 1, '2021-03-15 13:23:28'),
(281, '2021-03-15 13:28:18', 'administrator menambah data Struktur Organisasi dengan nama = RYAN CARLOS', '172.30.10.1', 1, '2021-03-15 13:28:18'),
(282, '2021-03-15 13:33:39', 'administrator menambah data Struktur Organisasi dengan nama = LA ODE ADNAN, S.Sos', '172.30.10.1', 1, '2021-03-15 13:33:39'),
(283, '2021-03-15 13:38:54', 'administrator menambah data Struktur Organisasi dengan nama = VERA SUKMAWATI, SE', '172.30.10.1', 1, '2021-03-15 13:38:54'),
(284, '2021-03-15 13:57:59', 'administrator menambah data Struktur Organisasi dengan nama = WA ODE FARIDAH, SH', '172.30.10.1', 1, '2021-03-15 13:57:59'),
(285, '2021-03-15 14:14:45', 'administrator menambah data Struktur Organisasi dengan nama = POPY RISMA TRISANTI, A.Md', '172.30.10.1', 1, '2021-03-15 14:14:45'),
(286, '2021-03-15 14:52:28', 'administrator menambah data Struktur Organisasi dengan nama = LA ODE SAFRUDIN, A.Md.Komp', '172.30.10.1', 1, '2021-03-15 14:52:28'),
(287, '2021-03-15 15:04:42', 'administrator menambah data Struktur Organisasi dengan nama = HERLIN, SH', '172.30.10.1', 1, '2021-03-15 15:04:42'),
(288, '2021-03-15 15:23:19', 'administrator menambah data Struktur Organisasi dengan nama = YANA MILAWATY, SE', '172.30.10.1', 1, '2021-03-15 15:23:19'),
(289, '2021-03-15 15:40:52', 'administrator menambah data Struktur Organisasi dengan nama = FEMIYANI, SE', '172.30.10.1', 1, '2021-03-15 15:40:52'),
(290, '2021-03-16 11:21:34', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-16 11:21:34'),
(291, '2021-03-18 16:39:06', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-18 16:39:06'),
(292, '2021-03-18 17:27:03', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '172.30.10.1', 1, '2021-03-18 17:27:03'),
(293, '2021-03-18 17:28:37', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '172.30.10.1', 1, '2021-03-18 17:28:37'),
(295, '2021-03-23 12:00:55', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-03-23 12:00:55'),
(297, '2021-03-23 12:07:30', 'administrator mengubah data konten profil dinas dengan ID = struktur', '172.30.10.1', 1, '2021-03-23 12:07:30'),
(299, '2021-03-30 12:03:36', 'Inputer PTSP melakukan login ke sistem', '172.30.10.1', 2, '2021-03-30 12:03:36'),
(301, '2021-03-30 12:06:40', 'inputer mengubah data berita dengan ID = 5', '172.30.10.1', 2, '2021-03-30 12:06:40'),
(303, '2021-03-30 12:11:22', 'inputer mengubah data berita dengan ID = 4', '172.30.10.1', 2, '2021-03-30 12:11:22'),
(305, '2021-04-23 10:22:23', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-04-23 10:22:23'),
(307, '2021-04-23 10:22:46', 'Administrator CodeIgniter melakukan login ke sistem', '172.30.10.1', 1, '2021-04-23 10:22:46'),
(309, '2021-04-23 10:28:25', 'administrator mengubah data konten profil dinas dengan ID = maklumat', '172.30.10.1', 1, '2021-04-23 10:28:25'),
(311, '2021-04-23 10:30:06', 'administrator mengubah data sektor izin dengan ID = 1 - PENDIDIKAN', '172.30.10.1', 1, '2021-04-23 10:30:06'),
(313, '2021-04-23 10:52:20', 'administrator menambah data berita ', '172.30.10.1', 1, '2021-04-23 10:52:20'),
(315, '2021-04-23 10:55:48', 'administrator menambah data tracking anugrah', '172.30.10.1', 1, '2021-04-23 10:55:48'),
(317, '2021-04-23 10:56:17', 'administrator mengubah data tracking dengan ID = 3', '172.30.10.1', 1, '2021-04-23 10:56:17'),
(319, '2021-04-23 11:08:04', 'administrator menambah data user tegar', '172.30.10.1', 1, '2021-04-23 11:08:04'),
(321, '2021-04-23 11:08:52', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-04-23 11:08:52'),
(323, '2021-04-23 11:09:01', 'administrator menambah data user alief', '172.30.10.1', 1, '2021-04-23 11:09:01'),
(325, '2021-04-23 11:09:23', 'Alief Agung Nugraha melakukan login ke sistem', '172.30.10.1', 5, '2021-04-23 11:09:23'),
(327, '2021-04-23 11:10:50', 'Inputer PTSP melakukan login ke sistem', '172.30.10.1', 2, '2021-04-23 11:10:50'),
(329, '2021-04-27 11:34:53', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-04-27 11:34:53'),
(331, '2021-04-27 11:49:24', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-04-27 11:49:24'),
(333, '2021-04-27 11:51:58', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN APOTEK', '172.30.10.1', 3, '2021-04-27 11:51:58'),
(335, '2021-04-27 11:53:46', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN MENDIRIKAN BANGUNAN ALIH FUNGSI', '172.30.10.1', 3, '2021-04-27 11:53:46'),
(337, '2021-04-27 11:55:19', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN MENDIRIKAN BANGUNAN BALIK NAMA', '172.30.10.1', 3, '2021-04-27 11:55:19'),
(339, '2021-04-27 12:02:43', 'tegar mengubah data tracking dengan ID = 2', '172.30.10.1', 3, '2021-04-27 12:02:43'),
(341, '2021-04-27 12:05:43', 'tegar menambah data tracking TEGAR ARYU', '172.30.10.1', 3, '2021-04-27 12:05:43'),
(343, '2021-04-27 12:21:59', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-04-27 12:21:59'),
(345, '2021-04-28 10:18:50', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-04-28 10:18:50'),
(347, '2021-04-28 10:32:52', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN MENDIRIKAN BANGUNAN FASILITAS PEMERINTAHAN', '172.30.10.1', 3, '2021-04-28 10:32:52'),
(349, '2021-04-28 14:47:29', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-04-28 14:47:29'),
(351, '2021-04-28 14:48:42', 'tegar mengubah layanan izin/surat dengan ID = 15 - PERMOHONAN IZIN MENDIRIKAN BANGUNAN FASILITAS PEMERINTAH', '172.30.10.1', 3, '2021-04-28 14:48:42'),
(353, '2021-04-28 14:51:56', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN MENDIRIKAN BANGUNAN  FASILITAS PEMERINTAH RUMAH SAKIT', '172.30.10.1', 3, '2021-04-28 14:51:56'),
(355, '2021-05-04 10:39:27', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-05-04 10:39:27'),
(357, '2021-05-04 11:27:10', 'tegar menambah data berita ', '172.30.10.1', 3, '2021-05-04 11:27:10'),
(359, '2021-05-04 11:28:13', 'tegar menghapus data berita dengan ID = 9', '172.30.10.1', 3, '2021-05-04 11:28:13'),
(361, '2021-05-04 11:29:37', 'tegar menambah data berita ', '172.30.10.1', 3, '2021-05-04 11:29:37'),
(363, '2021-05-04 11:37:40', 'tegar mengubah data berita dengan ID = 11', '172.30.10.1', 3, '2021-05-04 11:37:40'),
(365, '2021-05-04 12:33:17', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN MENDIRIKAN BANGUNAN PAPAN REKLAME', '172.30.10.1', 3, '2021-05-04 12:33:17'),
(367, '2021-05-04 12:42:08', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN MENDIRIKAN BANGUNAN HUNIAN', '172.30.10.1', 3, '2021-05-04 12:42:08'),
(369, '2021-05-04 12:43:13', 'tegar menambah data layanan izin/surat PERMOHONAN IZIN MENDIRIKAN BANGUNAN PERUMAHAN', '172.30.10.1', 3, '2021-05-04 12:43:13'),
(371, '2021-05-04 12:59:29', 'tegar mengubah layanan izin/surat dengan ID = 17 - PERMOHONAN IZIN MENDIRIKAN BANGUNAN  FASILITAS PEMERINTAH RUMAH SAKIT', '172.30.10.1', 3, '2021-05-04 12:59:29'),
(373, '2021-05-06 13:02:21', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-05-06 13:02:21'),
(375, '2021-05-06 13:04:15', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-05-06 13:04:15'),
(377, '2021-05-10 10:26:01', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-05-10 10:26:01'),
(379, '2021-05-10 10:40:16', 'Update Informasi Sistem ', '172.30.10.1', 3, '2021-05-10 10:40:16'),
(381, '2021-05-17 10:56:44', 'Tegar melakukan login ke sistem', '172.30.10.1', 3, '2021-05-17 10:56:44'),
(383, '2021-05-21 10:20:00', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-05-21 10:20:00'),
(384, '2021-06-09 13:14:58', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-06-09 13:14:58'),
(385, '2021-06-09 13:32:58', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-06-09 13:32:58'),
(386, '2021-06-09 13:33:01', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-06-09 13:33:01'),
(387, '2021-06-09 13:33:12', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-06-09 13:33:12'),
(388, '2021-06-09 13:33:16', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-06-09 13:33:16'),
(389, '2021-06-09 13:36:01', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-09 13:36:01'),
(390, '2021-06-09 13:36:51', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-06-09 13:36:51'),
(391, '2021-06-09 13:44:29', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-06-09 13:44:29'),
(392, '2021-06-09 13:53:24', 'Update Informasi Sistem ', '127.0.0.1', 1, '2021-06-09 13:53:24'),
(393, '2021-06-10 07:12:00', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 07:12:00'),
(394, '2021-06-10 07:29:44', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 07:29:44'),
(395, '2021-06-10 07:56:24', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 07:56:24'),
(396, '2021-06-10 07:57:31', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 07:57:31'),
(397, '2021-06-10 08:07:29', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 08:07:29'),
(398, '2021-06-10 08:07:36', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 08:07:36'),
(399, '2021-06-10 08:10:31', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 08:10:31'),
(400, '2021-06-10 08:11:20', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 08:11:20'),
(401, '2021-06-10 08:11:47', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 08:11:47'),
(402, '2021-06-10 08:29:00', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 08:29:00'),
(403, '2021-06-10 08:29:39', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 08:29:39'),
(404, '2021-06-10 09:23:10', 'Administrator CodeIgniter melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 09:23:10'),
(405, '2021-06-10 09:24:13', 'administrator mengubah data konten profil dinas dengan ID = sejarah', '127.0.0.1', 1, '2021-06-10 09:24:13'),
(406, '2021-06-10 09:24:37', 'administrator mengubah data konten profil dinas dengan ID = visi', '127.0.0.1', 1, '2021-06-10 09:24:37'),
(407, '2021-06-10 09:26:22', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '127.0.0.1', 1, '2021-06-10 09:26:22'),
(408, '2021-06-10 09:26:49', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '127.0.0.1', 1, '2021-06-10 09:26:49'),
(409, '2021-06-10 09:26:58', 'administrator mengubah data konten profil dinas dengan ID = tupoksi', '127.0.0.1', 1, '2021-06-10 09:26:58'),
(410, '2021-06-10 09:27:08', 'administrator mengubah data konten profil dinas dengan ID = maklumat', '127.0.0.1', 1, '2021-06-10 09:27:08'),
(411, '2021-06-10 09:28:04', 'administrator mengubah data profile dengan ID = 1 - administrator', '127.0.0.1', 1, '2021-06-10 09:28:04'),
(412, '2021-06-10 10:34:03', 'administrator menambah data kategori produk hukum UU', '127.0.0.1', 1, '2021-06-10 10:34:03'),
(413, '2021-06-10 10:34:38', 'administrator menambah data kategori produk hukum UUD', '127.0.0.1', 1, '2021-06-10 10:34:38'),
(414, '2021-06-10 10:35:56', 'administrator mengubah data kategori produk hukum dengan ID = 2 - sUUD', '127.0.0.1', 1, '2021-06-10 10:35:56'),
(415, '2021-06-10 10:35:58', 'administrator menghapus data kategori produk hukum dengan ID = 2 - sUUD', '127.0.0.1', 1, '2021-06-10 10:35:58'),
(416, '2021-06-10 11:53:02', 'administrator mengubah data produk hukum dengan ID = 2', '127.0.0.1', 1, '2021-06-10 11:53:02'),
(417, '2021-06-10 11:54:34', 'administrator mengubah data produk hukum dengan ID = 2', '127.0.0.1', 1, '2021-06-10 11:54:34'),
(418, '2021-06-10 11:55:05', 'administrator mengubah data produk hukum dengan ID = 2', '127.0.0.1', 1, '2021-06-10 11:55:05'),
(419, '2021-06-10 11:57:26', 'administrator mengubah data produk hukum dengan ID = 2', '127.0.0.1', 1, '2021-06-10 11:57:26'),
(420, '2021-06-10 12:14:25', 'administrator menambah data kategori informasi Berita', '127.0.0.1', 1, '2021-06-10 12:14:25'),
(421, '2021-06-10 12:14:28', 'administrator menambah data kategori informasi Agenda', '127.0.0.1', 1, '2021-06-10 12:14:28'),
(422, '2021-06-10 12:14:38', 'administrator menambah data kategori informasi Artikel', '127.0.0.1', 1, '2021-06-10 12:14:38'),
(423, '2021-06-10 12:14:50', 'administrator menambah data kategori informasi Pengumuman', '127.0.0.1', 1, '2021-06-10 12:14:50'),
(424, '2021-06-10 12:14:56', 'administrator mengubah data kategori informasi dengan ID = 4 - Pengumumans', '127.0.0.1', 1, '2021-06-10 12:14:56'),
(425, '2021-06-10 12:14:58', 'administrator menghapus data kategori informasi dengan ID = 4 - Pengumumans', '127.0.0.1', 1, '2021-06-10 12:14:58'),
(426, '2021-06-10 12:15:50', 'administrator menambah data kategori informasi Berita', '127.0.0.1', 1, '2021-06-10 12:15:50'),
(427, '2021-06-10 12:15:54', 'administrator menambah data kategori informasi Agenda', '127.0.0.1', 1, '2021-06-10 12:15:54'),
(428, '2021-06-10 12:15:58', 'administrator menambah data kategori informasi Artikel', '127.0.0.1', 1, '2021-06-10 12:15:58'),
(429, '2021-06-10 12:16:50', 'administrator menambah data kategori informasi Pengumuman', '127.0.0.1', 1, '2021-06-10 12:16:50'),
(430, '2021-06-10 12:29:59', 'administrator menambah data kategori produk hukum UUD', '127.0.0.1', 1, '2021-06-10 12:29:59'),
(431, '2021-06-10 12:30:08', 'administrator menambah data kategori produk hukum Perpres', '127.0.0.1', 1, '2021-06-10 12:30:08'),
(432, '2021-06-10 12:30:16', 'administrator menambah data kategori produk hukum Permen', '127.0.0.1', 1, '2021-06-10 12:30:16'),
(433, '2021-06-10 12:30:37', 'administrator menambah data kategori produk hukum Pergub', '127.0.0.1', 1, '2021-06-10 12:30:37'),
(434, '2021-06-10 13:07:48', 'administrator menambah data informasi ', '127.0.0.1', 1, '2021-06-10 13:07:48'),
(435, '2021-06-10 13:12:34', 'administrator menambah data informasi ', '127.0.0.1', 1, '2021-06-10 13:12:34'),
(436, '2021-06-10 13:13:44', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 13:13:44'),
(437, '2021-06-10 13:27:51', 'administrator mengubah data kategori bidang berita dengan ID = 2 - Kepala Dinas', '127.0.0.1', 1, '2021-06-10 13:27:51'),
(438, '2021-06-10 13:27:56', 'administrator mengubah data kategori bidang berita dengan ID = 3 - Sekretariat', '127.0.0.1', 1, '2021-06-10 13:27:56'),
(439, '2021-06-10 13:32:07', 'administrator mengubah data informasi dengan ID = 2', '127.0.0.1', 1, '2021-06-10 13:32:07'),
(440, '2021-06-10 13:32:23', 'administrator mengubah data informasi dengan ID = 1', '127.0.0.1', 1, '2021-06-10 13:32:23'),
(441, '2021-06-10 13:39:32', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 13:39:32');
INSERT INTO `tbl_log` (`log_id`, `log_time`, `log_message`, `log_ipaddress`, `user_id`, `createtime`) VALUES
(442, '2021-06-10 16:21:38', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 16:21:38'),
(443, '2021-06-10 16:36:50', 'administrator menambah data link terkait dengan nama = link-20210610163650.png', '127.0.0.1', 1, '2021-06-10 16:36:50'),
(444, '2021-06-10 16:37:27', 'administrator mengubah data link terkait dengan ID = 1', '127.0.0.1', 1, '2021-06-10 16:37:27'),
(445, '2021-06-10 16:37:29', 'administrator menghapus data link terkait dengan ID = 1 - 1', '127.0.0.1', 1, '2021-06-10 16:37:29'),
(446, '2021-06-10 16:38:00', 'administrator menambah data link terkait dengan nama = link-20210610163800.png', '127.0.0.1', 1, '2021-06-10 16:38:00'),
(447, '2021-06-10 16:38:23', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 16:38:23'),
(448, '2021-06-10 16:38:29', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 16:38:29'),
(449, '2021-06-10 16:38:39', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 16:38:39'),
(450, '2021-06-10 16:38:47', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 16:38:47'),
(451, '2021-06-10 16:39:01', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 16:39:01'),
(452, '2021-06-10 16:39:24', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 16:39:24'),
(453, '2021-06-10 16:39:39', 'administrator menambah data link terkait dengan nama = link-20210610163939.png', '127.0.0.1', 1, '2021-06-10 16:39:39'),
(454, '2021-06-10 16:39:51', 'administrator menambah data link terkait dengan nama = link-20210610163951.png', '127.0.0.1', 1, '2021-06-10 16:39:51'),
(455, '2021-06-10 16:40:04', 'administrator menambah data link terkait dengan nama = link-20210610164004.png', '127.0.0.1', 1, '2021-06-10 16:40:04'),
(456, '2021-06-10 16:40:16', 'administrator mengubah data link terkait dengan ID = 4', '127.0.0.1', 1, '2021-06-10 16:40:16'),
(457, '2021-06-10 16:40:25', 'administrator menambah data link terkait dengan nama = link-20210610164025.png', '127.0.0.1', 1, '2021-06-10 16:40:25'),
(458, '2021-06-10 16:41:58', 'administrator menambah data produk hukum dengan nama = regulation-20210610164158.pdf', '127.0.0.1', 1, '2021-06-10 16:41:58'),
(459, '2021-06-10 16:42:09', 'administrator menambah data produk hukum dengan nama = regulation-20210610164209.pdf', '127.0.0.1', 1, '2021-06-10 16:42:09'),
(460, '2021-06-10 16:42:19', 'administrator menambah data produk hukum dengan nama = regulation-20210610164219.pdf', '127.0.0.1', 1, '2021-06-10 16:42:19'),
(461, '2021-06-10 16:43:23', 'administrator mengubah data konten profil dinas menu = sambutan', '127.0.0.1', 1, '2021-06-10 16:43:23'),
(462, '2021-06-10 16:44:28', 'administrator mengubah data slider dengan ID = 2', '127.0.0.1', 1, '2021-06-10 16:44:28'),
(463, '2021-06-10 16:44:43', 'administrator mengubah data slider dengan ID = 3', '127.0.0.1', 1, '2021-06-10 16:44:43'),
(464, '2021-06-10 16:45:50', 'administrator mengubah data slider dengan ID = 2', '127.0.0.1', 1, '2021-06-10 16:45:50'),
(465, '2021-06-10 16:45:56', 'administrator mengubah data slider dengan ID = 3', '127.0.0.1', 1, '2021-06-10 16:45:56'),
(466, '2021-06-10 16:46:16', 'administrator mengubah data slider dengan ID = 4', '127.0.0.1', 1, '2021-06-10 16:46:16'),
(467, '2021-06-10 16:49:27', 'administrator mengubah data informasi dengan ID = 2', '127.0.0.1', 1, '2021-06-10 16:49:27'),
(468, '2021-06-10 16:49:34', 'administrator mengubah data informasi dengan ID = 2', '127.0.0.1', 1, '2021-06-10 16:49:34'),
(469, '2021-06-10 16:53:00', 'administrator mengubah data informasi dengan ID = 2', '127.0.0.1', 1, '2021-06-10 16:53:00'),
(470, '2021-06-10 16:53:07', 'administrator mengubah data informasi dengan ID = 1', '127.0.0.1', 1, '2021-06-10 16:53:07'),
(471, '2021-06-10 16:55:26', 'administrator mengubah data informasi dengan ID = 2', '127.0.0.1', 1, '2021-06-10 16:55:26'),
(472, '2021-06-10 17:50:19', 'administrator menambah data galeri dengan nama = gallery-20210610175019.png', '127.0.0.1', 1, '2021-06-10 17:50:19'),
(473, '2021-06-10 17:56:18', 'administrator menambah data galeri dengan nama = gallery-20210610175618.png', '127.0.0.1', 1, '2021-06-10 17:56:18'),
(474, '2021-06-10 17:57:37', 'administrator mengubah data galeri dengan ID = 2', '127.0.0.1', 1, '2021-06-10 17:57:37'),
(475, '2021-06-10 17:57:45', 'administrator mengubah data galeri dengan ID = 2', '127.0.0.1', 1, '2021-06-10 17:57:45'),
(476, '2021-06-10 17:57:59', 'administrator menghapus data galeri dengan ID = 2 - 2', '127.0.0.1', 1, '2021-06-10 17:57:59'),
(477, '2021-06-10 17:58:56', 'administrator menambah data galeri dengan nama = gallery-20210610175856.png', '127.0.0.1', 1, '2021-06-10 17:58:56'),
(478, '2021-06-10 17:59:04', 'administrator menghapus data galeri dengan ID = 3 - 3', '127.0.0.1', 1, '2021-06-10 17:59:04'),
(479, '2021-06-10 17:59:25', 'administrator menambah data galeri dengan nama = gallery-20210610175925.png', '127.0.0.1', 1, '2021-06-10 17:59:25'),
(480, '2021-06-10 17:59:46', 'administrator menambah data galeri dengan nama = gallery-20210610175946.png', '127.0.0.1', 1, '2021-06-10 17:59:46'),
(481, '2021-06-10 18:35:05', 'administrator menambah data galeri dengan nama = gallery-20210610183505.png', '127.0.0.1', 1, '2021-06-10 18:35:05'),
(482, '2021-06-10 18:36:17', 'administrator menambah data galeri dengan nama = video-20210610183617.mp4', '127.0.0.1', 1, '2021-06-10 18:36:17'),
(483, '2021-06-10 19:36:21', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 19:36:21'),
(484, '2021-06-10 19:41:18', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-10 19:41:18'),
(485, '2021-06-10 20:46:03', 'administrator menghapus data form dengan ID = ', '127.0.0.1', 1, '2021-06-10 20:46:03'),
(486, '2021-06-10 20:47:10', 'administrator menghapus data form dengan ID = ', '127.0.0.1', 1, '2021-06-10 20:47:10'),
(487, '2021-06-10 20:47:40', 'administrator menghapus data form dengan ID = 3', '127.0.0.1', 1, '2021-06-10 20:47:40'),
(488, '2021-06-10 21:03:24', 'administrator menghapus data galeri dengan ID = 3 - 3', '127.0.0.1', 1, '2021-06-10 21:03:24'),
(489, '2021-06-10 21:17:15', 'administrator menambah data galeri dengan nama = gallery-20210610211715.png', '127.0.0.1', 1, '2021-06-10 21:17:15'),
(490, '2021-06-10 21:22:01', 'administrator menghapus data galeri dengan ID = 3 - 3', '127.0.0.1', 1, '2021-06-10 21:22:01'),
(491, '2021-06-10 21:37:52', 'administrator menambah data galeri dengan nama = ', '127.0.0.1', 1, '2021-06-10 21:37:52'),
(492, '2021-06-10 21:38:46', 'administrator menambah data galeri dengan nama = Pameran Y', '127.0.0.1', 1, '2021-06-10 21:38:46'),
(493, '2021-06-10 21:38:53', 'administrator menghapus data galeri dengan ID = 5 - 5', '127.0.0.1', 1, '2021-06-10 21:38:53'),
(494, '2021-06-10 21:40:01', 'administrator menghapus data galeri dengan ID = 5 - 5', '127.0.0.1', 1, '2021-06-10 21:40:01'),
(495, '2021-06-10 21:40:40', 'administrator menghapus data galeri dengan ID = 6 - 6', '127.0.0.1', 1, '2021-06-10 21:40:40'),
(496, '2021-06-10 21:41:16', 'administrator menambah data galeri dengan nama = Pameran Y', '127.0.0.1', 1, '2021-06-10 21:41:16'),
(497, '2021-06-10 21:41:23', 'administrator menambah data galeri dengan ID = 7', '127.0.0.1', 1, '2021-06-10 21:41:23'),
(498, '2021-06-10 21:41:49', 'administrator menghapus data galeri dengan ID = 7 - 7', '127.0.0.1', 1, '2021-06-10 21:41:49'),
(499, '2021-06-10 21:42:16', 'administrator menambah data galeri dengan nama = Pameran Y', '127.0.0.1', 1, '2021-06-10 21:42:16'),
(500, '2021-06-10 21:46:07', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-10 21:46:07'),
(501, '2021-06-11 00:21:38', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-11 00:21:38'),
(502, '2021-06-11 00:22:21', 'administrator mengubah data slider dengan ID = 2', '127.0.0.1', 1, '2021-06-11 00:22:21'),
(503, '2021-06-11 00:22:47', 'administrator mengubah data slider dengan ID = 2', '127.0.0.1', 1, '2021-06-11 00:22:47'),
(504, '2021-06-11 00:32:56', 'administrator mengubah data slider dengan ID = 2', '127.0.0.1', 1, '2021-06-11 00:32:56'),
(505, '2021-06-11 00:33:03', 'administrator mengubah data slider dengan ID = 3', '127.0.0.1', 1, '2021-06-11 00:33:03'),
(506, '2021-06-11 00:33:11', 'administrator mengubah data slider dengan ID = 4', '127.0.0.1', 1, '2021-06-11 00:33:11'),
(507, '2021-06-11 00:35:30', 'administrator mengubah data slider dengan ID = 2', '127.0.0.1', 1, '2021-06-11 00:35:30'),
(508, '2021-06-11 00:35:36', 'administrator mengubah data slider dengan ID = 3', '127.0.0.1', 1, '2021-06-11 00:35:36'),
(509, '2021-06-11 00:35:44', 'administrator mengubah data slider dengan ID = 4', '127.0.0.1', 1, '2021-06-11 00:35:44'),
(510, '2021-06-11 01:13:05', 'administrator mengubah data konten profil dinas dengan ID = sambutan', '127.0.0.1', 1, '2021-06-11 01:13:05'),
(511, '2021-06-11 08:33:38', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-11 08:33:38'),
(512, '2021-06-11 08:34:36', 'administrator mengubah data informasi dengan ID = 2', '127.0.0.1', 1, '2021-06-11 08:34:36'),
(513, '2021-06-11 08:35:10', 'administrator mengubah data informasi dengan ID = 1', '127.0.0.1', 1, '2021-06-11 08:35:10'),
(514, '2021-06-11 08:35:49', 'administrator menambah data informasi ', '127.0.0.1', 1, '2021-06-11 08:35:49'),
(515, '2021-06-11 08:36:57', 'administrator menambah data informasi ', '127.0.0.1', 1, '2021-06-11 08:36:57'),
(516, '2021-06-11 09:15:59', 'administrator mengubah data konten profil dinas dengan ID = struktur', '127.0.0.1', 1, '2021-06-11 09:15:59'),
(517, '2021-06-11 09:18:30', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-11 09:18:30'),
(518, '2021-06-11 09:19:05', 'administrator mengubah data konten profil dinas menu = struktur', '127.0.0.1', 1, '2021-06-11 09:19:05'),
(519, '2021-06-11 16:02:02', 'Update Informasi Sistem', '127.0.0.1', 1, '2021-06-11 16:02:02'),
(520, '2021-06-11 16:10:10', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-11 16:10:10'),
(521, '2021-06-11 19:01:54', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-11 19:01:54'),
(522, '2021-06-12 06:06:56', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-12 06:06:56'),
(523, '2021-06-12 06:20:05', 'administrator menambah data faq ', '127.0.0.1', 1, '2021-06-12 06:20:05'),
(524, '2021-06-12 06:20:11', 'administrator mengubah data faq dengan ID = 1', '127.0.0.1', 1, '2021-06-12 06:20:11'),
(525, '2021-06-12 06:20:17', 'administrator menghapus data faq dengan ID = 1', '127.0.0.1', 1, '2021-06-12 06:20:17'),
(526, '2021-06-12 06:20:36', 'administrator menambah data faq ', '127.0.0.1', 1, '2021-06-12 06:20:36'),
(527, '2021-06-12 06:21:26', 'administrator menambah data faq ', '127.0.0.1', 1, '2021-06-12 06:21:26'),
(528, '2021-06-12 06:22:42', 'administrator menambah data faq ', '127.0.0.1', 1, '2021-06-12 06:22:42'),
(529, '2021-06-12 06:22:54', 'administrator menghapus data message dengan ID = 1 - ', '127.0.0.1', 1, '2021-06-12 06:22:54'),
(530, '2021-06-12 08:44:00', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-12 08:44:00'),
(531, '2021-06-12 09:40:57', 'administrator mengubah data message dengan ID = 2', '127.0.0.1', 1, '2021-06-12 09:40:57'),
(532, '2021-06-12 09:42:52', 'administrator mengubah data message dengan ID = M-20210612085804', '127.0.0.1', 1, '2021-06-12 09:42:52'),
(533, '2021-06-12 18:37:37', 'Administrator Coreweb melakukan login ke sistem', '127.0.0.1', 1, '2021-06-12 18:37:37'),
(534, '2022-05-21 00:08:50', 'Administrator Coreweb melakukan login ke sistem', '::1', 1, '2022-05-21 00:08:50'),
(535, '2022-05-21 00:10:06', 'Update Informasi Sistem', '::1', 1, '2022-05-21 00:10:06'),
(536, '2022-05-21 00:10:24', 'Update Informasi Sistem', '::1', 1, '2022-05-21 00:10:24'),
(537, '2022-05-21 00:31:21', 'Update Informasi Sistem', '::1', 1, '2022-05-21 00:31:21'),
(538, '2022-05-21 00:33:12', 'administrator menghapus data user dengan ID = 3 - tegar', '::1', 1, '2022-05-21 00:33:12'),
(539, '2022-05-21 00:33:14', 'administrator menghapus data user dengan ID = 5 - alief', '::1', 1, '2022-05-21 00:33:14'),
(540, '2022-05-21 00:34:34', 'administrator menghapus data user dengan ID = 2 - inputer', '::1', 1, '2022-05-21 00:34:34'),
(541, '2022-05-21 00:35:01', 'administrator mengubah data user dengan ID = 1 - administrator', '::1', 1, '2022-05-21 00:35:01'),
(542, '2022-05-21 00:35:15', 'administrator mengubah data group dengan ID = 2 - User', '::1', 1, '2022-05-21 00:35:15'),
(543, '2022-05-21 00:35:53', 'administrator mengubah data user dengan ID = 1 - administrator', '::1', 1, '2022-05-21 00:35:53'),
(544, '2022-05-21 00:44:10', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-05-21 00:44:10'),
(545, '2022-05-21 00:49:32', 'administrator mengubah data profile dengan ID = 1 - administrator', '::1', 1, '2022-05-21 00:49:32'),
(546, '2022-05-21 00:53:49', 'Update Informasi Sistem', '::1', 1, '2022-05-21 00:53:49'),
(547, '2022-05-21 00:56:11', 'Update Informasi Sistem', '::1', 1, '2022-05-21 00:56:11'),
(548, '2022-05-21 00:58:29', 'administrator mengubah data profile dengan ID = 1 - administrator', '::1', 1, '2022-05-21 00:58:29'),
(549, '2022-05-21 01:33:51', 'administrator mengubah data doa dengan ID = 4', '::1', 1, '2022-05-21 01:33:51'),
(550, '2022-05-21 01:34:01', 'administrator mengubah data doa dengan ID = 3', '::1', 1, '2022-05-21 01:34:01'),
(551, '2022-05-21 01:34:13', 'administrator mengubah data doa dengan ID = 2', '::1', 1, '2022-05-21 01:34:13'),
(552, '2022-05-21 01:34:17', 'administrator mengubah data doa dengan ID = 2', '::1', 1, '2022-05-21 01:34:17'),
(553, '2022-05-21 01:34:59', 'administrator mengubah data doa dengan ID = 1', '::1', 1, '2022-05-21 01:34:59'),
(554, '2022-05-21 10:19:49', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-05-21 10:19:49'),
(555, '2022-05-21 22:05:53', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-05-21 22:05:53'),
(556, '2022-05-21 22:13:01', 'Update Informasi Sistem', '::1', 1, '2022-05-21 22:13:01'),
(557, '2022-05-21 22:13:18', 'Update Informasi Sistem', '::1', 1, '2022-05-21 22:13:18'),
(558, '2022-05-21 22:21:25', 'Update Informasi Sistem', '::1', 1, '2022-05-21 22:21:25'),
(559, '2022-05-21 22:28:30', 'administrator mengubah data doa dengan ID = 4', '::1', 1, '2022-05-21 22:28:30'),
(560, '2022-05-21 22:35:02', 'administrator mengubah data doa dengan ID = 4', '::1', 1, '2022-05-21 22:35:02'),
(561, '2022-05-21 22:39:41', 'administrator mengubah data kategori bidang berita dengan ID = 1 - HR. Abu Dawud', '::1', 1, '2022-05-21 22:39:41'),
(562, '2022-05-21 22:39:52', 'administrator mengubah data kategori bidang berita dengan ID = 2 - HR. Bukhari', '::1', 1, '2022-05-21 22:39:52'),
(563, '2022-05-21 22:39:58', 'administrator mengubah data kategori bidang berita dengan ID = 3 - HR. Ahmad', '::1', 1, '2022-05-21 22:39:58'),
(564, '2022-05-21 22:40:10', 'administrator mengubah data kategori bidang berita dengan ID = 4 - HR. ath-Thabrani', '::1', 1, '2022-05-21 22:40:10'),
(565, '2022-05-21 22:40:19', 'administrator mengubah data kategori bidang berita dengan ID = 5 - HR. at-Tirmiz', '::1', 1, '2022-05-21 22:40:19'),
(566, '2022-05-21 22:40:53', 'administrator mengubah data kategori informasi dengan ID = 1 - Kategori 1', '::1', 1, '2022-05-21 22:40:53'),
(567, '2022-05-21 22:40:59', 'administrator mengubah data kategori informasi dengan ID = 2 - Kategori 2', '::1', 1, '2022-05-21 22:40:59'),
(568, '2022-05-21 22:41:03', 'administrator mengubah data kategori informasi dengan ID = 3 - Kategori 2', '::1', 1, '2022-05-21 22:41:03'),
(569, '2022-05-21 22:41:10', 'administrator mengubah data kategori informasi dengan ID = 4 - Kategori 3', '::1', 1, '2022-05-21 22:41:10'),
(570, '2022-05-21 22:41:13', 'administrator mengubah data kategori informasi dengan ID = 4 - Kategori 4', '::1', 1, '2022-05-21 22:41:13'),
(571, '2022-05-21 22:41:17', 'administrator mengubah data kategori informasi dengan ID = 3 - Kategori 3', '::1', 1, '2022-05-21 22:41:17'),
(572, '2022-05-22 17:54:20', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-05-22 17:54:20'),
(573, '2022-05-23 00:47:41', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-05-23 00:47:41'),
(574, '2022-05-23 00:52:15', 'administrator mengubah data doa dengan ID = 4', '::1', 1, '2022-05-23 00:52:15'),
(575, '2022-05-23 00:52:24', 'administrator mengubah data doa dengan ID = 4', '::1', 1, '2022-05-23 00:52:24'),
(576, '2022-05-23 00:53:00', 'administrator mengubah data doa dengan ID = 4', '::1', 1, '2022-05-23 00:53:00'),
(577, '2022-05-23 00:53:36', 'administrator menambah data informasi ', '::1', 1, '2022-05-23 00:53:36'),
(578, '2022-05-23 00:53:46', 'administrator mengubah data doa dengan ID = 5', '::1', 1, '2022-05-23 00:53:46'),
(579, '2022-05-26 10:29:40', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-05-26 10:29:40'),
(580, '2022-05-26 10:37:11', 'administrator mengubah data kategori informasi dengan ID = 1 - Pernikahan', '::1', 1, '2022-05-26 10:37:11'),
(581, '2022-05-26 10:37:16', 'administrator mengubah data kategori informasi dengan ID = 2 - Jenazah', '::1', 1, '2022-05-26 10:37:16'),
(582, '2022-05-26 10:37:33', 'administrator mengubah data kategori informasi dengan ID = 3 - Wudhu dan Sholat', '::1', 1, '2022-05-26 10:37:33'),
(583, '2022-05-26 10:37:39', 'administrator mengubah data kategori informasi dengan ID = 4 - Harian', '::1', 1, '2022-05-26 10:37:39'),
(584, '2022-05-26 10:37:44', 'administrator menambah data kategori informasi Alam', '::1', 1, '2022-05-26 10:37:44'),
(585, '2022-05-26 10:37:48', 'administrator menambah data kategori informasi Lainnya', '::1', 1, '2022-05-26 10:37:48'),
(586, '2022-05-26 13:43:56', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-05-26 13:43:56'),
(587, '2022-06-03 11:44:59', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-03 11:44:59'),
(588, '2022-06-04 13:54:22', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-04 13:54:22'),
(589, '2022-06-05 00:02:27', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-05 00:02:27'),
(590, '2022-06-05 00:13:53', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:13:53'),
(591, '2022-06-05 00:13:58', 'administrator menghapus data panduan dengan ID = 5', '::1', 1, '2022-06-05 00:13:58'),
(592, '2022-06-05 00:22:46', 'administrator mengubah data panduan dengan ID = 3', '::1', 1, '2022-06-05 00:22:46'),
(593, '2022-06-05 00:26:15', 'administrator mengubah data panduan dengan ID = 2', '::1', 1, '2022-06-05 00:26:15'),
(594, '2022-06-05 00:26:21', 'administrator mengubah data panduan dengan ID = 2', '::1', 1, '2022-06-05 00:26:21'),
(595, '2022-06-05 00:26:36', 'administrator mengubah data panduan dengan ID = 4', '::1', 1, '2022-06-05 00:26:36'),
(596, '2022-06-05 00:28:12', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:28:12'),
(597, '2022-06-05 00:28:32', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:28:32'),
(598, '2022-06-05 00:28:43', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:28:43'),
(599, '2022-06-05 00:29:00', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:29:00'),
(600, '2022-06-05 00:29:11', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:29:11'),
(601, '2022-06-05 00:29:25', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:29:25'),
(602, '2022-06-05 00:29:36', 'administrator menambah data panduan ', '::1', 1, '2022-06-05 00:29:36'),
(603, '2022-06-05 18:33:13', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-05 18:33:13'),
(604, '2022-06-08 13:51:21', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-08 13:51:21'),
(605, '2022-06-10 00:43:24', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-10 00:43:24'),
(606, '2022-06-14 12:49:51', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-14 12:49:51'),
(607, '2022-06-14 15:27:09', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:27:09'),
(608, '2022-06-14 15:27:41', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:27:41'),
(609, '2022-06-14 15:27:55', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:27:55'),
(610, '2022-06-14 15:27:59', 'administrator menghapus data doa dengan ID = 6', '::1', 1, '2022-06-14 15:27:59'),
(611, '2022-06-14 15:28:42', 'administrator menghapus data doa dengan ID = 8', '::1', 1, '2022-06-14 15:28:42'),
(612, '2022-06-14 15:28:44', 'administrator menghapus data doa dengan ID = 7', '::1', 1, '2022-06-14 15:28:44'),
(613, '2022-06-14 15:28:55', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:28:55'),
(614, '2022-06-14 15:30:43', 'administrator menambah data kategori informasi -', '::1', 1, '2022-06-14 15:30:43'),
(615, '2022-06-14 15:31:33', 'administrator menambah data kategori bidang berita -', '::1', 1, '2022-06-14 15:31:33'),
(616, '2022-06-14 15:32:03', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:32:03'),
(617, '2022-06-14 15:40:27', 'administrator menghapus data doa dengan ID = 9', '::1', 1, '2022-06-14 15:40:27'),
(618, '2022-06-14 15:42:43', 'administrator mengubah data doa dengan ID = 10', '::1', 1, '2022-06-14 15:42:43'),
(619, '2022-06-14 15:42:54', 'administrator mengubah data doa dengan ID = 10', '::1', 1, '2022-06-14 15:42:54'),
(620, '2022-06-14 15:43:04', 'administrator mengubah data doa dengan ID = 10', '::1', 1, '2022-06-14 15:43:04'),
(621, '2022-06-14 15:44:26', 'administrator mengubah data doa dengan ID = 10', '::1', 1, '2022-06-14 15:44:26'),
(622, '2022-06-14 15:44:31', 'administrator mengubah data doa dengan ID = 10', '::1', 1, '2022-06-14 15:44:31'),
(623, '2022-06-14 15:45:09', 'administrator menghapus data doa dengan ID = 1', '::1', 1, '2022-06-14 15:45:09'),
(624, '2022-06-14 15:45:11', 'administrator menghapus data doa dengan ID = 2', '::1', 1, '2022-06-14 15:45:11'),
(625, '2022-06-14 15:45:13', 'administrator menghapus data doa dengan ID = 3', '::1', 1, '2022-06-14 15:45:13'),
(626, '2022-06-14 15:45:15', 'administrator menghapus data doa dengan ID = 4', '::1', 1, '2022-06-14 15:45:15'),
(627, '2022-06-14 15:45:17', 'administrator menghapus data doa dengan ID = 5', '::1', 1, '2022-06-14 15:45:17'),
(628, '2022-06-14 15:45:26', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:45:26'),
(629, '2022-06-14 15:45:32', 'administrator mengubah data doa dengan ID = 11', '::1', 1, '2022-06-14 15:45:32'),
(630, '2022-06-14 15:58:39', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:58:39'),
(631, '2022-06-14 15:58:51', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 15:58:51'),
(632, '2022-06-14 15:59:20', 'administrator menghapus data doa dengan ID = 12', '::1', 1, '2022-06-14 15:59:20'),
(633, '2022-06-14 15:59:22', 'administrator menghapus data doa dengan ID = 13', '::1', 1, '2022-06-14 15:59:22'),
(634, '2022-06-14 16:16:47', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 16:16:47'),
(635, '2022-06-14 16:17:06', 'administrator menambah data informasi ', '::1', 1, '2022-06-14 16:17:06'),
(636, '2022-06-15 13:17:42', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-15 13:17:42'),
(637, '2022-06-15 13:54:27', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 13:54:27'),
(638, '2022-06-15 13:55:48', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 13:55:48'),
(639, '2022-06-15 13:56:21', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 13:56:21'),
(640, '2022-06-15 13:56:41', 'administrator menghapus data doa dengan ID = 17', '::1', 1, '2022-06-15 13:56:41'),
(641, '2022-06-15 13:56:46', 'administrator menghapus data doa dengan ID = 18', '::1', 1, '2022-06-15 13:56:46'),
(642, '2022-06-15 14:04:30', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 14:04:30'),
(643, '2022-06-15 14:40:09', 'administrator menghapus data doa dengan ID = 19', '::1', 1, '2022-06-15 14:40:09'),
(644, '2022-06-15 14:40:31', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 14:40:31'),
(645, '2022-06-15 14:40:54', 'administrator mengubah data doa dengan ID = 20', '::1', 1, '2022-06-15 14:40:54'),
(646, '2022-06-15 14:40:58', 'administrator menghapus data doa dengan ID = 20', '::1', 1, '2022-06-15 14:40:58'),
(647, '2022-06-15 14:47:48', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 14:47:48'),
(648, '2022-06-15 14:59:49', 'administrator mengubah data doa dengan ID = 21', '::1', 1, '2022-06-15 14:59:49'),
(649, '2022-06-15 15:00:01', 'administrator mengubah data doa dengan ID = 21', '::1', 1, '2022-06-15 15:00:01'),
(650, '2022-06-15 15:00:14', 'administrator mengubah data doa dengan ID = 21', '::1', 1, '2022-06-15 15:00:14'),
(651, '2022-06-15 15:01:25', 'administrator mengubah data doa dengan ID = 21', '::1', 1, '2022-06-15 15:01:25'),
(652, '2022-06-15 15:01:32', 'administrator mengubah data doa dengan ID = 21', '::1', 1, '2022-06-15 15:01:32'),
(653, '2022-06-15 15:02:53', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 15:02:53'),
(654, '2022-06-15 15:03:06', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:03:06'),
(655, '2022-06-15 15:12:25', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:12:25'),
(656, '2022-06-15 15:12:46', 'administrator mengubah data doa dengan ID = 21', '::1', 1, '2022-06-15 15:12:46'),
(657, '2022-06-15 15:27:19', 'administrator mengubah data doa dengan ID = 21', '::1', 1, '2022-06-15 15:27:19'),
(658, '2022-06-15 15:28:20', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:28:20'),
(659, '2022-06-15 15:28:29', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:28:29'),
(660, '2022-06-15 15:28:46', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:28:46'),
(661, '2022-06-15 15:28:54', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:28:54'),
(662, '2022-06-15 15:29:05', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:29:05'),
(663, '2022-06-15 15:29:19', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:29:19'),
(664, '2022-06-15 15:29:49', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:29:49'),
(665, '2022-06-15 15:29:56', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:29:56'),
(666, '2022-06-15 15:30:05', 'administrator mengubah data doa dengan ID = 22', '::1', 1, '2022-06-15 15:30:05'),
(667, '2022-06-15 15:30:09', 'administrator menghapus data doa dengan ID = 22', '::1', 1, '2022-06-15 15:30:09'),
(668, '2022-06-15 15:30:12', 'administrator menghapus data doa dengan ID = 21', '::1', 1, '2022-06-15 15:30:12'),
(669, '2022-06-15 15:30:29', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 15:30:29'),
(670, '2022-06-15 15:30:49', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 15:30:49'),
(671, '2022-06-15 15:31:14', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 15:31:14'),
(672, '2022-06-15 15:31:31', 'administrator menghapus data doa dengan ID = 25', '::1', 1, '2022-06-15 15:31:31'),
(673, '2022-06-15 15:32:20', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 15:32:20'),
(674, '2022-06-15 15:32:48', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 15:32:48'),
(675, '2022-06-15 15:34:37', 'administrator menghapus data doa dengan ID = 10', '::1', 1, '2022-06-15 15:34:37'),
(676, '2022-06-15 15:34:42', 'administrator menghapus data doa dengan ID = 23', '::1', 1, '2022-06-15 15:34:42'),
(677, '2022-06-15 15:34:44', 'administrator menghapus data doa dengan ID = 26', '::1', 1, '2022-06-15 15:34:44'),
(678, '2022-06-15 15:34:46', 'administrator menghapus data doa dengan ID = 27', '::1', 1, '2022-06-15 15:34:46'),
(679, '2022-06-15 15:36:38', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 15:36:38'),
(680, '2022-06-15 15:44:25', 'administrator mengubah data group dengan ID = 2 - Inputer', '::1', 1, '2022-06-15 15:44:25'),
(681, '2022-06-15 15:45:13', 'administrator menambah data user yara', '::1', 1, '2022-06-15 15:45:13'),
(682, '2022-06-15 15:45:22', 'Hayara melakukan login ke sistem', '::1', 6, '2022-06-15 15:45:22'),
(683, '2022-06-15 15:48:24', 'Hayara melakukan login ke sistem', '::1', 6, '2022-06-15 15:48:24'),
(684, '2022-06-15 16:02:50', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-15 16:02:50'),
(685, '2022-06-15 16:03:02', 'Update Informasi Sistem', '::1', 1, '2022-06-15 16:03:02'),
(686, '2022-06-15 16:07:08', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-15 16:07:08'),
(687, '2022-06-15 16:07:21', 'Update Informasi Sistem', '::1', 1, '2022-06-15 16:07:21'),
(688, '2022-06-15 16:07:45', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-15 16:07:45'),
(689, '2022-06-15 16:07:58', 'Update Informasi Sistem', '::1', 1, '2022-06-15 16:07:58'),
(690, '2022-06-15 16:17:05', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-15 16:17:05'),
(691, '2022-06-15 16:28:08', 'administrator menambah data informasi ', '::1', 1, '2022-06-15 16:28:08'),
(692, '2022-06-15 16:28:58', 'Update Informasi Sistem', '::1', 1, '2022-06-15 16:28:58'),
(693, '2022-06-15 16:30:10', 'Update Informasi Sistem', '::1', 1, '2022-06-15 16:30:10'),
(694, '2022-06-15 16:30:17', 'Update Informasi Sistem', '::1', 1, '2022-06-15 16:30:17'),
(695, '2022-06-16 07:46:38', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-16 07:46:38'),
(696, '2022-06-16 07:47:04', 'administrator menambah data informasi ', '::1', 1, '2022-06-16 07:47:04'),
(697, '2022-06-16 07:47:16', 'administrator mengubah data doa dengan ID = 30', '::1', 1, '2022-06-16 07:47:16'),
(698, '2022-06-18 16:25:21', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-06-18 16:25:21'),
(699, '2022-08-04 16:16:10', 'Nur Aisyah melakukan login ke sistem', '::1', 1, '2022-08-04 16:16:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_panduan`
--

CREATE TABLE `tbl_panduan` (
  `panduan_id` int(11) NOT NULL,
  `panduan_title` text NOT NULL,
  `panduan_deskripsi` text NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_panduan`
--

INSERT INTO `tbl_panduan` (`panduan_id`, `panduan_title`, `panduan_deskripsi`, `createtime`) VALUES
(2, 'Definisi dan Macam-Macam Doa', '<p>Anda bisa mencari lokasi kantor kami di google maps dengan keyword &quot;Techno&#39;s Studio&quot;, atau mengunjungi kami di Jl. Supu Yusuf No.9</p>\r\n', '2021-06-12 06:20:36'),
(3, 'Adab-adab Berdoa', '<p style=\"margin-left:42.5500pt; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri\"><strong><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\"><strong>Bershalawat Kepada Nabi</strong></span></span></strong></span></span></p>\r\n\r\n<p style=\"margin-left:56.7000pt; text-align:justify\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">Dari Fadhalah bin Ubaid, ia berkata, Rasulullah bersabda&#39; Apabila salah seorang kalian berdoa, maka hendaklah ia mulai dengan memuji dan menyanjung RabbNya, kemudian bershalawat kepada Nabi, kemudian berdoa sesudah itu dengan apa yang dia inginkan.(H.R. Abu Dawud 2/77). </span></span></p>\r\n\r\n<p style=\"margin-left:42.5500pt; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ibnul Qayyim menyatakan bahwa shalawat kepada Nabi ketika berdoa ada tiga</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:42.5500pt; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tingkatan:</span></span></span></span></p>\r\n\r\n<ol>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">Bershalawat kepada Nabi sebelum berdoa, setelah puji-pujian kepada Allah,</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">Mengucap shalawat kepada Nabi di permulaan, pertengahan dan akhir doa,</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">Bershalawat kepada Nabi di awal dan di akhir doa, sedangkan doa yang dimohonkan di tengah kedua shalwat tersebut. (Jala Al-Afham fi Fadhl Ash-Sholah wa As-Salam Ala Muhammad Khair Al-Anam, hal. 375).</span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:56.7000pt; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:42.5500pt; text-align:justify\"><strong><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\"><strong>Berdoa di kala senang dan susah</strong></span></span></strong></p>\r\n\r\n<p style=\"margin-left:42.5500pt; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:56.7000pt; text-align:justify\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">Dari Abu Hurairah Beliau berkata, Rasululah bersabda, Barangsiapa senang bahwa Allah mengabulkan doanya ketika ia sedang kesusahan dan kesempitan hidup, maka hendaklah ia perbanyak doa di waktu lapang (senang).(H.R. At-Tirdmidzi 5/462).</span></span></p>\r\n\r\n<p style=\"margin-left:56.7000pt; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:42.5500pt; text-align:justify\"><strong><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\"><strong>Merendahkan suara ketika berdoa</strong></span></span></strong></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:Calibri\">&nbsp;&nbsp;&nbsp;&nbsp;Allah berfirman: Dan sebutlah (nama) Rabbmu dalam hatimu dengan merendahkan diri dan rasa takut, dan dengan tidak mengeraskan suara, di waktu pagi dan petang, dan janganlah kamu termasuk orang-orang yang lalai. (Al-A&#39;raf: 205).</span></span></span></span></p>\r\n', '2021-06-12 06:21:26'),
(4, 'Pastikah Doa dikabulkan', '<p>Kami menyediakan jasa konsultasi dan pembuatan aplikasi berbasis web, desktop hingga android</p>\r\n', '2021-06-12 06:22:42'),
(6, 'Syarat Terkabulnya doa', '<p>data doa</p>\r\n', '2022-06-05 00:28:12'),
(7, 'Penghalang terkabulnya doa', '<p>data panduan</p>\r\n', '2022-06-05 00:28:32'),
(8, 'Adab-adab berdoa', '<p>data panduan</p>\r\n', '2022-06-05 00:28:43'),
(9, 'Orang yang dikabulkan doanya', '<p>data panduan</p>\r\n', '2022-06-05 00:29:00'),
(10, 'Perkara Pentingyang harus dimintai hamba', '<p>data panduan</p>\r\n', '2022-06-05 00:29:11'),
(11, 'Tempat Mustajab Untuk Berdoa', '<p>data panduan</p>\r\n', '2022-06-05 00:29:25'),
(12, 'Waktu-Waktu Mustajab', '<p>data panduan</p>\r\n', '2022-06-05 00:29:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwayat`
--

CREATE TABLE `tbl_riwayat` (
  `riwayat_id` int(11) NOT NULL,
  `riwayat_name` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_riwayat`
--

INSERT INTO `tbl_riwayat` (`riwayat_id`, `riwayat_name`, `createtime`) VALUES
(0, '-', '2022-06-14 15:31:33'),
(1, 'HR. Abu Dawud', '2021-03-02 16:01:40'),
(2, 'HR. Bukhari', '2021-03-02 16:02:04'),
(3, 'HR. Ahmad', '2021-03-02 16:02:23'),
(4, 'HR. ath-Thabrani', '2021-03-02 16:02:42'),
(5, 'HR. at-Tirmiz', '2021-03-02 16:02:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `setting_id` int(11) NOT NULL,
  `setting_appname` varchar(100) NOT NULL,
  `setting_short_appname` varchar(10) NOT NULL,
  `setting_origin_app` varchar(100) NOT NULL,
  `setting_owner_name` varchar(100) NOT NULL,
  `setting_phone` varchar(30) NOT NULL,
  `setting_email` varchar(100) NOT NULL,
  `setting_address` text NOT NULL,
  `setting_logo` varchar(50) NOT NULL,
  `setting_background` varchar(50) NOT NULL,
  `setting_color` varchar(30) NOT NULL,
  `setting_layout` varchar(20) NOT NULL,
  `setting_apikey_map` text NOT NULL,
  `setting_apikey_firebase` text NOT NULL,
  `setting_running_text` text NOT NULL,
  `setting_about` text NOT NULL,
  `setting_coordinate` text NOT NULL,
  `setting_instagram` text NOT NULL,
  `setting_facebook` text NOT NULL,
  `setting_youtube` text NOT NULL,
  `setting_twitter` text NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_setting`
--

INSERT INTO `tbl_setting` (`setting_id`, `setting_appname`, `setting_short_appname`, `setting_origin_app`, `setting_owner_name`, `setting_phone`, `setting_email`, `setting_address`, `setting_logo`, `setting_background`, `setting_color`, `setting_layout`, `setting_apikey_map`, `setting_apikey_firebase`, `setting_running_text`, `setting_about`, `setting_coordinate`, `setting_instagram`, `setting_facebook`, `setting_youtube`, `setting_twitter`, `createtime`) VALUES
(1, 'Ayomi Berdoa!', 'Ayo Berdoa', 'Kendari', 'Teknik Informatika UHO', '+6281234567890', 'nur-aisyah@gmail.com', '', 'base-logo120220615160758.png', 'base-background120220615160302.png', 'skin-green-light', '', '', '', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '', '', '', '', '', '2021-02-02 13:29:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_lastlogin` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_password`, `user_fullname`, `user_photo`, `user_email`, `user_lastlogin`, `group_id`, `createtime`) VALUES
(1, 'administrator', '$2y$10$6ELmhIbfosdPtGcQReBXbuMevkFPXZTJUi4au9oh4mxx1iF90tqyy', 'Nur Aisyah', 'profile-1-20220521005829.jpg', 'aisyah@gmail.com', '2021-02-02 19:40:31', 1, '2021-02-02 19:40:31'),
(6, 'yara', '$2y$10$Dkg21bSWrlg7cn5pB8WwdOTkNzLscpKWJW0v.kD7o58YFUTReh3LC', 'Hayara', '', 'yara@gmail.com', '0000-00-00 00:00:00', 2, '2022-06-15 15:45:13');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_doa`
--
ALTER TABLE `tbl_doa`
  ADD PRIMARY KEY (`doa_id`);

--
-- Indeks untuk tabel `tbl_group`
--
ALTER TABLE `tbl_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indeks untuk tabel `tbl_panduan`
--
ALTER TABLE `tbl_panduan`
  ADD PRIMARY KEY (`panduan_id`);

--
-- Indeks untuk tabel `tbl_riwayat`
--
ALTER TABLE `tbl_riwayat`
  ADD PRIMARY KEY (`riwayat_id`);

--
-- Indeks untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_doa`
--
ALTER TABLE `tbl_doa`
  MODIFY `doa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tbl_group`
--
ALTER TABLE `tbl_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700;

--
-- AUTO_INCREMENT untuk tabel `tbl_panduan`
--
ALTER TABLE `tbl_panduan`
  MODIFY `panduan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_riwayat`
--
ALTER TABLE `tbl_riwayat`
  MODIFY `riwayat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
