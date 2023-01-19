-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jan 2023 pada 06.52
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
-- Database: `db_antrian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_antrian`
--

CREATE TABLE `tbl_antrian` (
  `antrian_kode` varchar(30) NOT NULL,
  `antrian_nomor` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `spesialis_id` int(11) NOT NULL,
  `arrival_time` time NOT NULL,
  `service_start_time` time NOT NULL,
  `service_end_time` time NOT NULL,
  `antrian_status` enum('arrival_time','start_service','end_service','') NOT NULL DEFAULT 'arrival_time',
  `createtime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_antrian`
--

INSERT INTO `tbl_antrian` (`antrian_kode`, `antrian_nomor`, `user_id`, `spesialis_id`, `arrival_time`, `service_start_time`, `service_end_time`, `antrian_status`, `createtime`) VALUES
('FN-2023011913193615', 'B-1', 15, 2, '13:19:36', '00:00:00', '00:00:00', 'arrival_time', '2023-01-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_antrian_berjalan`
--

CREATE TABLE `tbl_antrian_berjalan` (
  `antrian_berjalan_id` int(11) NOT NULL,
  `spesialis_id` int(11) NOT NULL,
  `antrian_saat_ini` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_antrian_berjalan`
--

INSERT INTO `tbl_antrian_berjalan` (`antrian_berjalan_id`, `spesialis_id`, `antrian_saat_ini`) VALUES
(1, 1, '0'),
(2, 2, '0'),
(3, 3, '0'),
(4, 4, '0'),
(5, 5, '0');

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
(1, 'Super Admin', '2021-02-02 19:26:11'),
(2, 'Admin', '2021-02-05 14:03:49'),
(3, 'Pasien', '2022-10-05 10:40:09'),
(4, 'Dokter', '2022-11-08 13:46:38');

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
(1, '2023-01-02 09:42:54', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 09:42:54'),
(2, '2023-01-02 09:43:05', 'mega mengubah data user dengan ID = 21 - krisman', '::1', 6, '2023-01-02 09:43:05'),
(3, '2023-01-02 09:43:12', 'krisman melakukan login ke sistem', '::1', 21, '2023-01-02 09:43:12'),
(4, '2023-01-02 12:22:44', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 12:22:44'),
(5, '2023-01-02 12:23:42', 'krisman melakukan login ke sistem', '::1', 21, '2023-01-02 12:23:42'),
(6, '2023-01-02 12:35:44', 'Behasil menambah data antrian FN-2023010212354421 dengan nomor antrian A-1', '::1', 21, '2023-01-02 12:35:44'),
(7, '2023-01-02 12:36:00', 'Behasil menambah data antrian FN-2023010212360021 dengan nomor antrian A-2', '::1', 21, '2023-01-02 12:36:00'),
(8, '2023-01-02 12:36:05', 'Behasil menambah data antrian FN-2023010212360521 dengan nomor antrian A-2', '::1', 21, '2023-01-02 12:36:05'),
(9, '2023-01-02 12:36:08', 'krisman menghapus data spesialis dengan ID =  - ', '::1', 21, '2023-01-02 12:36:08'),
(10, '2023-01-02 12:36:12', 'krisman menghapus data spesialis dengan ID =  - ', '::1', 21, '2023-01-02 12:36:12'),
(11, '2023-01-02 12:36:15', 'krisman menghapus data spesialis dengan ID =  - ', '::1', 21, '2023-01-02 12:36:15'),
(12, '2023-01-02 13:09:14', 'Behasil menambah data antrian FN-2023010213091421 dengan nomor antrian A-1', '::1', 21, '2023-01-02 13:09:14'),
(13, '2023-01-02 13:11:45', 'Behasil menambah data antrian FN-2023010213114521 dengan nomor antrian A-2', '::1', 21, '2023-01-02 13:11:45'),
(14, '2023-01-02 13:23:33', 'Behasil menambah data antrian FN-2023010213233321 dengan nomor antrian A-2', '::1', 21, '2023-01-02 13:23:33'),
(15, '2023-01-02 13:25:52', 'krisman menghapus data antrian dengan kode = FN-2023010213091421 - FN-2023010213091421', '::1', 21, '2023-01-02 13:25:52'),
(16, '2023-01-02 13:29:48', 'Behasil menambah data antrian FN-2023010213294821 dengan nomor antrian A-3', '::1', 21, '2023-01-02 13:29:48'),
(17, '2023-01-02 13:29:55', 'krisman menghapus data antrian dengan kode = FN-2023010213114521 - FN-2023010213114521', '::1', 21, '2023-01-02 13:29:55'),
(18, '2023-01-02 13:29:57', 'krisman menghapus data antrian dengan kode = FN-2023010213233321 - FN-2023010213233321', '::1', 21, '2023-01-02 13:29:57'),
(19, '2023-01-02 13:29:59', 'krisman menghapus data antrian dengan kode = FN-2023010213294821 - FN-2023010213294821', '::1', 21, '2023-01-02 13:29:59'),
(20, '2023-01-02 13:30:04', 'Behasil menambah data antrian FN-2023010213300421 dengan nomor antrian A-1', '::1', 21, '2023-01-02 13:30:04'),
(21, '2023-01-02 13:30:08', 'Behasil menambah data antrian FN-2023010213300821 dengan nomor antrian A-2', '::1', 21, '2023-01-02 13:30:08'),
(22, '2023-01-02 13:30:11', 'Behasil menambah data antrian FN-2023010213301121 dengan nomor antrian A-2', '::1', 21, '2023-01-02 13:30:11'),
(23, '2023-01-02 13:30:20', 'krisman menghapus data antrian dengan kode = FN-2023010213300421 - FN-2023010213300421', '::1', 21, '2023-01-02 13:30:20'),
(24, '2023-01-02 13:30:23', 'krisman menghapus data antrian dengan kode = FN-2023010213300821 - FN-2023010213300821', '::1', 21, '2023-01-02 13:30:23'),
(25, '2023-01-02 13:30:25', 'krisman menghapus data antrian dengan kode = FN-2023010213301121 - FN-2023010213301121', '::1', 21, '2023-01-02 13:30:25'),
(26, '2023-01-02 13:31:11', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 13:31:11'),
(27, '2023-01-02 14:27:26', 'krisman melakukan login ke sistem', '::1', 21, '2023-01-02 14:27:26'),
(28, '2023-01-02 14:30:52', 'krisman melakukan login ke sistem', '::1', 21, '2023-01-02 14:30:52'),
(29, '2023-01-02 14:31:46', 'krisman melakukan login ke sistem', '::1', 21, '2023-01-02 14:31:46'),
(30, '2023-01-02 14:32:50', 'Behasil menambah data antrian FN-2023010214325021 dengan nomor antrian A-1', '::1', 21, '2023-01-02 14:32:50'),
(31, '2023-01-02 14:33:10', 'Behasil menambah data antrian FN-2023010214331021 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:33:10'),
(32, '2023-01-02 14:33:15', 'Behasil menambah data antrian FN-2023010214331521 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:33:15'),
(33, '2023-01-02 14:33:17', 'krisman menghapus data antrian dengan kode = FN-2023010214325021 - FN-2023010214325021', '::1', 21, '2023-01-02 14:33:17'),
(34, '2023-01-02 14:33:29', 'Behasil menambah data antrian FN-2023010214332921 dengan nomor antrian A-3', '::1', 21, '2023-01-02 14:33:29'),
(35, '2023-01-02 14:33:41', 'krisman menghapus data antrian dengan kode = FN-2023010214331021 - FN-2023010214331021', '::1', 21, '2023-01-02 14:33:41'),
(36, '2023-01-02 14:34:48', 'krisman menghapus data antrian dengan kode = FN-2023010214331521 - FN-2023010214331521', '::1', 21, '2023-01-02 14:34:48'),
(37, '2023-01-02 14:34:52', 'Behasil menambah data antrian FN-2023010214345221 dengan nomor antrian A-4', '::1', 21, '2023-01-02 14:34:52'),
(38, '2023-01-02 14:34:55', 'krisman menghapus data antrian dengan kode = FN-2023010214332921 - FN-2023010214332921', '::1', 21, '2023-01-02 14:34:55'),
(39, '2023-01-02 14:34:57', 'krisman menghapus data antrian dengan kode = FN-2023010214345221 - FN-2023010214345221', '::1', 21, '2023-01-02 14:34:57'),
(40, '2023-01-02 14:35:00', 'Behasil menambah data antrian FN-2023010214350021 dengan nomor antrian A-1', '::1', 21, '2023-01-02 14:35:00'),
(41, '2023-01-02 14:35:04', 'Behasil menambah data antrian FN-2023010214350421 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:35:04'),
(42, '2023-01-02 14:35:07', 'Behasil menambah data antrian FN-2023010214350721 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:35:07'),
(43, '2023-01-02 14:35:12', 'Behasil menambah data antrian FN-2023010214351221 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:35:12'),
(44, '2023-01-02 14:35:19', 'krisman menghapus data antrian dengan kode = FN-2023010214350021 - FN-2023010214350021', '::1', 21, '2023-01-02 14:35:19'),
(45, '2023-01-02 14:35:22', 'Behasil menambah data antrian FN-2023010214352221 dengan nomor antrian A-3', '::1', 21, '2023-01-02 14:35:22'),
(46, '2023-01-02 14:35:26', 'Behasil menambah data antrian FN-2023010214352621 dengan nomor antrian A-3', '::1', 21, '2023-01-02 14:35:26'),
(47, '2023-01-02 14:35:32', 'krisman menghapus data antrian dengan kode = FN-2023010214350421 - FN-2023010214350421', '::1', 21, '2023-01-02 14:35:32'),
(48, '2023-01-02 14:35:34', 'krisman menghapus data antrian dengan kode = FN-2023010214350721 - FN-2023010214350721', '::1', 21, '2023-01-02 14:35:34'),
(49, '2023-01-02 14:35:35', 'krisman menghapus data antrian dengan kode = FN-2023010214351221 - FN-2023010214351221', '::1', 21, '2023-01-02 14:35:35'),
(50, '2023-01-02 14:35:38', 'krisman menghapus data antrian dengan kode = FN-2023010214352221 - FN-2023010214352221', '::1', 21, '2023-01-02 14:35:38'),
(51, '2023-01-02 14:36:00', 'krisman menghapus data antrian dengan kode = FN-2023010214352621 - FN-2023010214352621', '::1', 21, '2023-01-02 14:36:00'),
(52, '2023-01-02 14:36:31', 'Behasil menambah data antrian FN-2023010214363121 dengan nomor antrian A-1', '::1', 21, '2023-01-02 14:36:31'),
(53, '2023-01-02 14:36:35', 'Behasil menambah data antrian FN-2023010214363521 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:36:35'),
(54, '2023-01-02 14:42:35', 'Behasil menambah data antrian FN-2023010214423521 dengan nomor antrian -1', '::1', 21, '2023-01-02 14:42:35'),
(55, '2023-01-02 14:44:01', 'Behasil menambah data antrian FN-2023010214440121 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:44:01'),
(56, '2023-01-02 14:44:14', 'krisman menghapus data antrian dengan kode = FN-2023010214440121 - FN-2023010214440121', '::1', 21, '2023-01-02 14:44:14'),
(57, '2023-01-02 14:45:07', 'Behasil menambah data antrian FN-2023010214450721 dengan nomor antrian A-2', '::1', 21, '2023-01-02 14:45:07'),
(58, '2023-01-02 14:45:22', 'krisman menghapus data antrian dengan kode = FN-2023010214450721 - FN-2023010214450721', '::1', 21, '2023-01-02 14:45:22'),
(59, '2023-01-02 14:50:57', 'Behasil menambah data antrian FN-2023010214505721 dengan nomor antrian -1', '::1', 21, '2023-01-02 14:50:57'),
(60, '2023-01-02 14:51:05', 'krisman menghapus data antrian dengan kode = FN-2023010214505721 - FN-2023010214505721', '::1', 21, '2023-01-02 14:51:05'),
(61, '2023-01-02 14:51:08', 'Behasil menambah data antrian FN-2023010214510821 dengan nomor antrian -1', '::1', 21, '2023-01-02 14:51:08'),
(62, '2023-01-02 14:51:28', 'Behasil menambah data antrian FN-2023010214512821 dengan nomor antrian -2', '::1', 21, '2023-01-02 14:51:28'),
(63, '2023-01-02 14:51:31', 'krisman menghapus data antrian dengan kode = FN-2023010214512821 - FN-2023010214512821', '::1', 21, '2023-01-02 14:51:31'),
(64, '2023-01-02 14:51:33', 'krisman menghapus data antrian dengan kode = FN-2023010214510821 - FN-2023010214510821', '::1', 21, '2023-01-02 14:51:33'),
(65, '2023-01-02 14:54:34', 'Behasil menambah data antrian FN-2023010214543421 dengan nomor antrian A-3', '::1', 21, '2023-01-02 14:54:34'),
(66, '2023-01-02 14:54:39', 'Behasil menambah data antrian FN-2023010214543921 dengan nomor antrian A-4', '::1', 21, '2023-01-02 14:54:39'),
(67, '2023-01-02 14:54:42', 'Behasil menambah data antrian FN-2023010214544221 dengan nomor antrian A-5', '::1', 21, '2023-01-02 14:54:42'),
(68, '2023-01-02 14:54:46', 'krisman menghapus data antrian dengan kode = FN-2023010214544221 - FN-2023010214544221', '::1', 21, '2023-01-02 14:54:46'),
(69, '2023-01-02 14:54:49', 'Behasil menambah data antrian FN-2023010214544921 dengan nomor antrian A-5', '::1', 21, '2023-01-02 14:54:49'),
(70, '2023-01-02 14:54:52', 'Behasil menambah data antrian FN-2023010214545221 dengan nomor antrian A-6', '::1', 21, '2023-01-02 14:54:52'),
(71, '2023-01-02 16:51:50', 'Behasil menambah data antrian FN-2023010216515021 dengan nomor antrian B-1', '::1', 21, '2023-01-02 16:51:50'),
(72, '2023-01-02 16:51:54', 'Behasil menambah data antrian FN-2023010216515421 dengan nomor antrian A-7', '::1', 21, '2023-01-02 16:51:54'),
(73, '2023-01-02 16:52:02', 'Behasil menambah data antrian FN-2023010216520221 dengan nomor antrian B-2', '::1', 21, '2023-01-02 16:52:02'),
(74, '2023-01-02 16:52:07', 'Behasil menambah data antrian FN-2023010216520721 dengan nomor antrian B-3', '::1', 21, '2023-01-02 16:52:07'),
(75, '2023-01-02 16:52:12', 'Behasil menambah data antrian FN-2023010216521221 dengan nomor antrian C-1', '::1', 21, '2023-01-02 16:52:12'),
(76, '2023-01-02 16:52:17', 'Behasil menambah data antrian FN-2023010216521721 dengan nomor antrian D-1', '::1', 21, '2023-01-02 16:52:17'),
(77, '2023-01-02 16:52:21', 'Behasil menambah data antrian FN-2023010216522121 dengan nomor antrian E-1', '::1', 21, '2023-01-02 16:52:21'),
(78, '2023-01-02 16:52:28', 'Behasil menambah data antrian FN-2023010216522821 dengan nomor antrian E-2', '::1', 21, '2023-01-02 16:52:28'),
(79, '2023-01-02 16:52:33', 'Behasil menambah data antrian FN-2023010216523321 dengan nomor antrian D-2', '::1', 21, '2023-01-02 16:52:33'),
(80, '2023-01-02 16:52:43', 'Behasil menambah data antrian FN-2023010216524321 dengan nomor antrian B-4', '::1', 21, '2023-01-02 16:52:43'),
(81, '2023-01-02 16:52:50', 'Behasil menambah data antrian FN-2023010216525021 dengan nomor antrian C-2', '::1', 21, '2023-01-02 16:52:50'),
(82, '2023-01-02 16:52:53', 'Behasil menambah data antrian FN-2023010216525321 dengan nomor antrian D-3', '::1', 21, '2023-01-02 16:52:53'),
(83, '2023-01-02 16:52:57', 'Behasil menambah data antrian FN-2023010216525721 dengan nomor antrian A-8', '::1', 21, '2023-01-02 16:52:57'),
(84, '2023-01-02 16:53:03', 'Behasil menambah data antrian FN-2023010216530321 dengan nomor antrian D-4', '::1', 21, '2023-01-02 16:53:03'),
(85, '2023-01-02 16:53:49', 'Behasil menambah data antrian FN-2023010216534921 dengan nomor antrian A-1', '::1', 21, '2023-01-02 16:53:49'),
(86, '2023-01-02 16:53:54', 'Behasil menambah data antrian FN-2023010216535421 dengan nomor antrian B-1', '::1', 21, '2023-01-02 16:53:54'),
(87, '2023-01-02 16:54:26', 'krisman menghapus data antrian dengan kode = FN-2023010216535421 - FN-2023010216535421', '::1', 21, '2023-01-02 16:54:26'),
(88, '2023-01-02 16:56:41', 'Behasil menambah data antrian FN-2023010216564121 dengan nomor antrian A-2', '::1', 21, '2023-01-02 16:56:41'),
(89, '2023-01-02 16:56:58', 'krisman menghapus data antrian dengan kode = FN-2023010216564121 - FN-2023010216564121', '::1', 21, '2023-01-02 16:56:58'),
(90, '2023-01-02 17:00:43', 'Behasil menambah data antrian FN-2023010217004321 dengan nomor antrian A-2', '::1', 21, '2023-01-02 17:00:43'),
(91, '2023-01-02 17:00:46', 'krisman menghapus data antrian dengan kode = FN-2023010217004321 - FN-2023010217004321', '::1', 21, '2023-01-02 17:00:46'),
(92, '2023-01-02 17:00:49', 'Behasil menambah data antrian FN-2023010217004921 dengan nomor antrian A-2', '::1', 21, '2023-01-02 17:00:49'),
(93, '2023-01-02 17:04:01', 'krisman menghapus data antrian dengan kode = FN-2023010217004921 - FN-2023010217004921', '::1', 21, '2023-01-02 17:04:01'),
(94, '2023-01-02 17:10:08', 'Behasil menambah data antrian FN-2023010217100821 dengan nomor antrian A-2', '::1', 21, '2023-01-02 17:10:08'),
(95, '2023-01-02 17:10:13', 'krisman menghapus data antrian dengan kode = FN-2023010217100821 - FN-2023010217100821', '::1', 21, '2023-01-02 17:10:13'),
(96, '2023-01-02 17:10:17', 'Behasil menambah data antrian FN-2023010217101721 dengan nomor antrian A-2', '::1', 21, '2023-01-02 17:10:17'),
(97, '2023-01-02 17:10:22', 'Behasil menambah data antrian FN-2023010217102221 dengan nomor antrian A-3', '::1', 21, '2023-01-02 17:10:22'),
(98, '2023-01-02 17:10:26', 'krisman menghapus data antrian dengan kode = FN-2023010217102221 - FN-2023010217102221', '::1', 21, '2023-01-02 17:10:26'),
(99, '2023-01-02 17:10:28', 'krisman menghapus data antrian dengan kode = FN-2023010216534921 - FN-2023010216534921', '::1', 21, '2023-01-02 17:10:28'),
(100, '2023-01-02 17:12:47', 'Behasil menambah data antrian FN-2023010217124721 dengan nomor antrian A-3', '::1', 21, '2023-01-02 17:12:47'),
(101, '2023-01-02 17:12:50', 'krisman menghapus data antrian dengan kode = FN-2023010217124721 - FN-2023010217124721', '::1', 21, '2023-01-02 17:12:50'),
(102, '2023-01-02 17:12:54', 'krisman menghapus data antrian dengan kode = FN-2023010217101721 - FN-2023010217101721', '::1', 21, '2023-01-02 17:12:54'),
(103, '2023-01-02 17:13:00', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 17:13:00'),
(104, '2023-01-02 17:13:26', 'mega mengubah data user dengan ID = 9 - megas', '::1', 6, '2023-01-02 17:13:26'),
(105, '2023-01-02 17:13:35', 'mega mengubah data user dengan ID = 11 - yanti', '::1', 6, '2023-01-02 17:13:35'),
(106, '2023-01-02 17:13:41', 'yanti melakukan login ke sistem', '::1', 11, '2023-01-02 17:13:41'),
(107, '2023-01-02 17:14:25', 'Behasil menambah data antrian FN-2023010217142511 dengan nomor antrian A-1', '::1', 11, '2023-01-02 17:14:25'),
(108, '2023-01-02 17:15:29', 'Behasil menambah data antrian FN-2023010217152911 dengan nomor antrian A-2', '::1', 11, '2023-01-02 17:15:29'),
(109, '2023-01-02 17:15:57', 'yanti menghapus data antrian dengan kode = FN-2023010217152911 - FN-2023010217152911', '::1', 11, '2023-01-02 17:15:57'),
(110, '2023-01-02 17:18:41', 'yanti menghapus data antrian dengan kode = FN-2023010217142511 - FN-2023010217142511', '::1', 11, '2023-01-02 17:18:41'),
(111, '2023-01-02 17:19:22', 'Behasil menambah data antrian FN-2023010217192211 dengan nomor antrian A-1', '::1', 11, '2023-01-02 17:19:22'),
(112, '2023-01-02 17:19:34', 'krisman melakukan login ke sistem', '::1', 21, '2023-01-02 17:19:34'),
(113, '2023-01-02 17:19:37', 'Behasil menambah data antrian FN-2023010217193721 dengan nomor antrian B-1', '::1', 21, '2023-01-02 17:19:37'),
(114, '2023-01-02 17:22:29', 'krisman menghapus data antrian dengan kode = FN-2023010217193721 - FN-2023010217193721', '::1', 21, '2023-01-02 17:22:29'),
(115, '2023-01-02 17:22:32', 'Behasil menambah data antrian FN-2023010217223221 dengan nomor antrian A-2', '::1', 21, '2023-01-02 17:22:32'),
(116, '2023-01-02 17:22:56', 'yanti melakukan login ke sistem', '::1', 11, '2023-01-02 17:22:56'),
(117, '2023-01-02 17:23:21', 'yanti menghapus data antrian dengan kode = FN-2023010217192211 - FN-2023010217192211', '::1', 11, '2023-01-02 17:23:21'),
(118, '2023-01-02 17:23:25', 'Behasil menambah data antrian FN-2023010217232511 dengan nomor antrian A-3', '::1', 11, '2023-01-02 17:23:25'),
(119, '2023-01-02 17:23:36', 'yanti menghapus data antrian dengan kode = FN-2023010217232511 - FN-2023010217232511', '::1', 11, '2023-01-02 17:23:36'),
(120, '2023-01-02 17:24:08', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 17:24:08'),
(121, '2023-01-02 17:25:01', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-02 17:25:01'),
(122, '2023-01-02 17:27:51', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 17:27:51'),
(123, '2023-01-02 17:28:28', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 17:28:28'),
(124, '2023-01-02 17:28:41', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 17:28:41'),
(125, '2023-01-02 17:31:31', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-02 17:31:31'),
(126, '2023-01-02 19:58:25', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-02 19:58:25'),
(127, '2023-01-03 21:23:29', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-03 21:23:29'),
(128, '2023-01-04 00:38:07', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-04 00:38:07'),
(129, '2023-01-05 16:51:30', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-05 16:51:30'),
(130, '2023-01-06 09:07:47', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-06 09:07:47'),
(131, '2023-01-07 21:06:59', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-07 21:06:59'),
(132, '2023-01-08 00:50:48', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-08 00:50:48'),
(133, '2023-01-08 09:14:48', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-08 09:14:48'),
(134, '2023-01-08 19:29:30', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-08 19:29:30'),
(135, '2023-01-11 17:15:10', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-11 17:15:10'),
(136, '2023-01-11 17:34:22', 'admin mega melakukan login ke sistem', '::1', 6, '2023-01-11 17:34:22'),
(137, '2023-01-11 17:34:50', 'yanti melakukan login ke sistem', '::1', 11, '2023-01-11 17:34:50'),
(138, '2023-01-11 17:36:12', 'Behasil menambah data antrian FN-2023011117361211 dengan nomor antrian A-3', '::1', 11, '2023-01-11 17:36:12'),
(139, '2023-01-11 17:39:52', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-11 17:39:52'),
(140, '2023-01-11 17:52:21', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-11 17:52:21'),
(141, '2023-01-11 22:27:46', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-11 22:27:46'),
(142, '2023-01-12 21:15:08', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-12 21:15:08'),
(143, '2023-01-12 22:16:08', 'fani mengubah data profile dengan ID = 1 - fani', '::1', 1, '2023-01-12 22:16:08'),
(144, '2023-01-12 22:16:27', 'fani mengubah data profile dengan ID = 1 - fani', '::1', 1, '2023-01-12 22:16:27'),
(145, '2023-01-13 19:54:13', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-13 19:54:13'),
(146, '2023-01-14 02:54:54', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-14 02:54:54'),
(147, '2023-01-14 11:54:10', 'Iqbal Tahir melakukan login ke sistem', '::1', 34, '2023-01-14 11:54:10'),
(148, '2023-01-14 11:54:19', 'Behasil menambah data antrian FN-2023011411541934 dengan nomor antrian A-4', '::1', 34, '2023-01-14 11:54:19'),
(149, '2023-01-14 11:54:26', 'iqbaltahir menghapus data antrian dengan kode = FN-2023011411541934 - FN-2023011411541934', '::1', 34, '2023-01-14 11:54:26'),
(150, '2023-01-14 11:55:10', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-14 11:55:10'),
(151, '2023-01-14 12:29:28', 'fani menghapus data antrian dengan kode = FN-2023011117361211 - FN-2023011117361211', '::1', 1, '2023-01-14 12:29:28'),
(152, '2023-01-14 12:29:30', 'fani menghapus data antrian dengan kode = FN-2023010217223222 - FN-2023010217223222', '::1', 1, '2023-01-14 12:29:30'),
(153, '2023-01-14 12:29:34', 'fani menghapus data antrian dengan kode = FN-2023010217223221 - FN-2023010217223221', '::1', 1, '2023-01-14 12:29:34'),
(154, '2023-01-14 18:41:23', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-14 18:41:23'),
(155, '2023-01-14 21:00:38', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-14 21:00:38'),
(156, '2023-01-16 12:46:37', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-16 12:46:37'),
(157, '2023-01-16 13:00:51', 'fani mengubah data spesialis dengan ID = 1 - Ahli penyakit  Saraf', '::1', 1, '2023-01-16 13:00:51'),
(158, '2023-01-16 13:00:56', 'fani mengubah data spesialis dengan ID = 1 - Ahli penyakit  Saraf', '::1', 1, '2023-01-16 13:00:56'),
(159, '2023-01-17 01:47:45', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 01:47:45'),
(160, '2023-01-17 01:48:21', 'Update Informasi Sistem', '::1', 1, '2023-01-17 01:48:21'),
(161, '2023-01-17 01:58:50', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 01:58:50'),
(162, '2023-01-17 02:03:20', 'fani mengubah data profile dengan ID = 1 - fani', '::1', 1, '2023-01-17 02:03:20'),
(163, '2023-01-17 02:03:52', 'fani mengubah data profile dengan ID = 1 - fani', '::1', 1, '2023-01-17 02:03:52'),
(164, '2023-01-17 02:03:55', 'fani mengubah data profile dengan ID = 1 - fani', '::1', 1, '2023-01-17 02:03:55'),
(165, '2023-01-17 02:04:36', 'fani mengubah data profile dengan ID = 1 - fani', '::1', 1, '2023-01-17 02:04:36'),
(166, '2023-01-17 02:04:46', 'Fani mengubah data profile dengan ID = 1 - Fani', '::1', 1, '2023-01-17 02:04:46'),
(167, '2023-01-17 02:05:55', 'Fani mengubah data profile dengan ID = 1 - Fani', '::1', 1, '2023-01-17 02:05:55'),
(168, '2023-01-17 02:05:57', 'Fani mengubah data profile dengan ID = 1 - Fani', '::1', 1, '2023-01-17 02:05:57'),
(169, '2023-01-17 02:06:03', 'Fani mengubah data profile dengan ID = 1 - Fani', '::1', 1, '2023-01-17 02:06:03'),
(170, '2023-01-17 02:06:43', 'Fani mengubah data profile dengan ID = 1 - Fani', '::1', 1, '2023-01-17 02:06:43'),
(171, '2023-01-17 02:08:36', 'Update Informasi Sistem', '::1', 1, '2023-01-17 02:08:36'),
(172, '2023-01-17 02:15:18', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 02:15:18'),
(173, '2023-01-17 02:15:29', 'Update Informasi Sistem', '::1', 1, '2023-01-17 02:15:29'),
(174, '2023-01-17 02:36:11', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 02:36:11'),
(175, '2023-01-17 12:35:32', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 12:35:32'),
(176, '2023-01-17 12:36:55', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 12:36:55'),
(177, '2023-01-17 12:51:26', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 12:51:26'),
(178, '2023-01-17 13:19:46', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 13:19:46'),
(179, '2023-01-17 13:22:02', 'gita melakukan login ke sistem', '::1', 15, '2023-01-17 13:22:02'),
(180, '2023-01-17 13:24:25', 'gita melakukan login ke sistem', '::1', 15, '2023-01-17 13:24:25'),
(181, '2023-01-17 13:24:35', 'Behasil menambah data antrian FN-2023011713243515 dengan nomor antrian A-1', '::1', 15, '2023-01-17 13:24:35'),
(182, '2023-01-17 13:26:04', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 13:26:04'),
(183, '2023-01-17 14:05:00', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 14:05:00'),
(184, '2023-01-17 14:05:11', 'Update Informasi Sistem', '::1', 1, '2023-01-17 14:05:11'),
(185, '2023-01-17 14:09:50', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 14:09:50'),
(186, '2023-01-17 14:11:30', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 14:11:30'),
(187, '2023-01-17 15:20:44', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-17 15:20:44'),
(188, '2023-01-18 15:29:18', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-18 15:29:18'),
(189, '2023-01-18 15:29:33', 'Update Informasi Sistem', '::1', 1, '2023-01-18 15:29:33'),
(190, '2023-01-18 20:27:25', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-18 20:27:25'),
(191, '2023-01-18 20:27:37', 'gita melakukan login ke sistem', '::1', 15, '2023-01-18 20:27:37'),
(192, '2023-01-18 23:51:50', 'gita melakukan login ke sistem', '::1', 15, '2023-01-18 23:51:50'),
(193, '2023-01-19 00:48:34', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 00:48:34'),
(194, '2023-01-19 00:48:50', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 00:48:50'),
(195, '2023-01-19 00:59:47', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 00:59:47'),
(196, '2023-01-19 01:15:52', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 01:15:52'),
(197, '2023-01-19 01:31:25', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 01:31:25'),
(198, '2023-01-19 01:41:01', 'Aprilia Gita Risqi Tahir mengubah data profile dengan ID =  - Aprilia Gita Risqi Tahir', '::1', 15, '2023-01-19 01:41:01'),
(199, '2023-01-19 01:42:40', 'Aprilia Gita Risqi Tahir mengubah data profile dengan ID = 15 - Aprilia Gita Risqi Tahir', '::1', 15, '2023-01-19 01:42:40'),
(200, '2023-01-19 01:53:37', ' menghapus data antrian dengan kode = FN-91019018 - FN-91019018', '::1', 15, '2023-01-19 01:53:37'),
(201, '2023-01-19 01:55:49', 'Behasil menambah data antrian FN-2023011901554915 dengan nomor antrian A-1', '::1', 15, '2023-01-19 01:55:49'),
(202, '2023-01-19 01:55:58', ' menghapus data antrian dengan kode = FN-2023011901554915 - FN-2023011901554915', '::1', 15, '2023-01-19 01:55:58'),
(203, '2023-01-19 01:56:02', 'Behasil menambah data antrian FN-2023011901560215 dengan nomor antrian A-1', '::1', 15, '2023-01-19 01:56:02'),
(204, '2023-01-19 01:59:13', ' menghapus data antrian dengan kode = FN-2023011901560215 - FN-2023011901560215', '::1', 15, '2023-01-19 01:59:13'),
(205, '2023-01-19 01:59:18', 'Behasil menambah data antrian FN-2023011901591815 dengan nomor antrian A-1', '::1', 15, '2023-01-19 01:59:18'),
(206, '2023-01-19 02:02:11', ' menghapus data antrian dengan kode = FN-2023011901591815 - FN-2023011901591815', '::1', 15, '2023-01-19 02:02:11'),
(207, '2023-01-19 02:02:14', 'Behasil menambah data antrian FN-2023011902021415 dengan nomor antrian C-1', '::1', 15, '2023-01-19 02:02:14'),
(208, '2023-01-19 02:02:18', ' menghapus data antrian dengan kode = FN-2023011902021415 - FN-2023011902021415', '::1', 15, '2023-01-19 02:02:18'),
(209, '2023-01-19 02:02:31', 'Behasil menambah data antrian FN-2023011902023115 dengan nomor antrian E-1', '::1', 15, '2023-01-19 02:02:31'),
(210, '2023-01-19 02:02:37', ' menghapus data antrian dengan kode = FN-2023011902023115 - FN-2023011902023115', '::1', 15, '2023-01-19 02:02:37'),
(211, '2023-01-19 02:02:51', 'Fanny melakukan login ke sistem', '::1', 1, '2023-01-19 02:02:51'),
(212, '2023-01-19 02:04:53', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 02:04:53'),
(213, '2023-01-19 02:05:33', 'Behasil menambah data antrian FN-2023011902053315 dengan nomor antrian A-1', '::1', 15, '2023-01-19 02:05:33'),
(214, '2023-01-19 02:13:16', 'Fanny mengubah data user dengan ID = 1 - Fani Aprilia', '::1', 1, '2023-01-19 02:13:16'),
(215, '2023-01-19 02:13:39', 'Fanny menambah data user ibal', '::1', 1, '2023-01-19 02:13:39'),
(216, '2023-01-19 02:19:33', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 02:19:33'),
(217, '2023-01-19 02:20:45', 'Fani Aprilia melakukan login ke sistem', '::1', 1, '2023-01-19 02:20:45'),
(218, '2023-01-19 02:20:54', 'Update Informasi Sistem', '::1', 1, '2023-01-19 02:20:54'),
(219, '2023-01-19 02:42:14', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 02:42:14'),
(220, '2023-01-19 02:54:34', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 02:54:34'),
(221, '2023-01-19 13:08:14', 'Fani Aprilia melakukan login ke sistem', '::1', 1, '2023-01-19 13:08:14'),
(222, '2023-01-19 13:14:07', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 13:14:07'),
(223, '2023-01-19 13:15:03', 'Update Informasi Sistem', '::1', 1, '2023-01-19 13:15:03'),
(224, '2023-01-19 13:15:24', 'Behasil menambah data antrian FN-2023011913152415 dengan nomor antrian B-1', '::1', 15, '2023-01-19 13:15:24'),
(225, '2023-01-19 13:15:47', ' menghapus data antrian dengan kode = FN-2023011913152415 - FN-2023011913152415', '::1', 15, '2023-01-19 13:15:47'),
(226, '2023-01-19 13:15:54', 'Behasil menambah data antrian FN-2023011913155415 dengan nomor antrian E-1', '::1', 15, '2023-01-19 13:15:54'),
(227, '2023-01-19 13:19:19', 'Aprilia Gita Risqi Tahir melakukan login ke sistem', '::1', 15, '2023-01-19 13:19:19'),
(228, '2023-01-19 13:19:26', ' menghapus data antrian dengan kode = FN-2023011913155415 - FN-2023011913155415', '::1', 15, '2023-01-19 13:19:26'),
(229, '2023-01-19 13:19:36', 'Behasil menambah data antrian FN-2023011913193615 dengan nomor antrian B-1', '::1', 15, '2023-01-19 13:19:36'),
(230, '2023-01-19 13:20:51', 'Fani Aprilia melakukan login ke sistem', '::1', 1, '2023-01-19 13:20:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwayat_antrian`
--

CREATE TABLE `tbl_riwayat_antrian` (
  `riwayat_antrian_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `spesialis_id` int(11) NOT NULL,
  `antrian_nomor` varchar(30) NOT NULL,
  `arrival_time` time NOT NULL,
  `service_start_time` time NOT NULL,
  `service_end_time` time NOT NULL,
  `createtime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_riwayat_antrian`
--

INSERT INTO `tbl_riwayat_antrian` (`riwayat_antrian_id`, `user_id`, `spesialis_id`, `antrian_nomor`, `arrival_time`, `service_start_time`, `service_end_time`, `createtime`) VALUES
(1, 19, 1, 'A1', '17:40:00', '19:00:00', '19:06:00', '2022-12-30'),
(2, 20, 1, 'A2', '17:46:00', '19:06:00', '19:12:00', '2022-12-30'),
(3, 18, 1, 'A3', '17:47:00', '19:12:00', '19:18:00', '2022-12-30'),
(4, 27, 1, 'A4', '17:50:00', '19:18:00', '19:24:00', '2022-12-30'),
(5, 22, 1, 'A5', '17:59:00', '19:24:00', '19:30:00', '2022-12-30'),
(6, 23, 1, 'A6', '18:01:00', '19:30:00', '19:36:00', '2022-12-30'),
(7, 24, 1, 'A7', '18:10:00', '19:36:00', '19:42:00', '2022-12-30'),
(8, 25, 1, 'A8', '18:30:00', '19:42:00', '19:48:00', '2022-12-30'),
(9, 11, 1, 'A9', '18:34:00', '19:48:00', '19:54:00', '2022-12-30'),
(10, 12, 1, 'A10', '18:34:00', '19:54:00', '20:01:00', '2022-12-30'),
(11, 14, 1, 'A11', '18:34:00', '20:01:00', '20:06:00', '2022-12-30'),
(12, 15, 1, 'A12', '18:37:00', '20:06:00', '20:12:00', '2022-12-30'),
(13, 16, 1, 'A13', '18:37:00', '20:12:00', '20:19:00', '2022-12-30'),
(14, 21, 1, 'A14', '18:43:00', '20:19:00', '20:24:00', '2022-12-30'),
(15, 26, 1, 'A15', '18:50:00', '20:24:00', '20:30:00', '2022-12-30'),
(16, 17, 1, 'A16', '18:51:00', '20:30:00', '20:36:00', '2022-12-30'),
(37, 21, 1, 'A17', '18:53:00', '20:36:00', '20:42:00', '2022-12-30'),
(38, 30, 1, 'A18', '18:55:00', '20:42:00', '20:47:00', '2022-12-30'),
(39, 31, 1, 'A19', '18:56:00', '20:47:00', '20:53:00', '2022-12-30'),
(40, 31, 1, 'A20', '18:59:00', '20:53:00', '21:00:00', '2022-12-30'),
(59, 15, 2, 'B1', '13:19:36', '13:48:15', '13:48:17', '2023-01-19');

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
  `setting_about` text NOT NULL,
  `setting_help` text NOT NULL,
  `setting_max_antrian` int(11) NOT NULL,
  `setting_jam_buka` time NOT NULL,
  `setting_jam_tutup` time NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_setting`
--

INSERT INTO `tbl_setting` (`setting_id`, `setting_appname`, `setting_short_appname`, `setting_origin_app`, `setting_owner_name`, `setting_phone`, `setting_email`, `setting_address`, `setting_logo`, `setting_background`, `setting_color`, `setting_layout`, `setting_about`, `setting_help`, `setting_max_antrian`, `setting_jam_buka`, `setting_jam_tutup`, `createtime`) VALUES
(1, 'Klinik Mono Valensi', 'Antrian', 'Kota Kendari', 'Klinik Mono Valensi', '+6281234567890', 'monovalensi@gmail.com', 'Lepo-Lepo Kendari Barat\r\n', 'base-logo120230119022054.png', 'base-background120230118152933.png', 'skin-blue-light', 'default', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 'help', 20, '01:00:00', '22:00:00', '2021-02-02 13:29:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_spesialis`
--

CREATE TABLE `tbl_spesialis` (
  `spesialis_id` int(11) NOT NULL,
  `spesialis_nama` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `spesialis_active` int(11) NOT NULL,
  `spesialis_kode_antrian` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_spesialis`
--

INSERT INTO `tbl_spesialis` (`spesialis_id`, `spesialis_nama`, `user_id`, `spesialis_active`, `spesialis_kode_antrian`) VALUES
(1, 'Ahli penyakit  Saraf', 7, 0, 'A'),
(2, 'Spesialis Patologi Anatomi', 8, 1, 'B'),
(3, 'Spesialis Ortopedi dan Traumatologim', 10, 1, 'C'),
(4, 'Jantung dan Pembuluh Darah', 12, 1, 'D'),
(5, 'Umum', 13, 1, 'E');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  `user_phone` varchar(30) NOT NULL,
  `user_lastlogin` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_password`, `user_fullname`, `user_photo`, `user_phone`, `user_lastlogin`, `group_id`, `createtime`) VALUES
(1, '$2y$10$UYxuPgDeRR4/O4jrn2byyuCKuDg9/hyjHtwhpaYUp4e/hQo23J6zK', 'Fani Aprilia', 'profile-1-20230117020603.png', '088', '2021-02-02 19:40:31', 1, '2021-02-02 19:40:31'),
(6, '$2y$10$KqVyjh667iEcAO62Y/u5quQPgNebdeM71eo5IHvsQJOuMJlbpojGG', 'admin mega', '', '', '0000-00-00 00:00:00', 2, '2022-05-23 16:08:55'),
(7, '$2y$10$ZTA5zp6VYpBhsLY5/rOjaeceVTOXg8vvMLPisFnUurOF3jr7H94y.', 'Nur Sabri Abdillah', '', '', '0000-00-00 00:00:00', 4, '2022-10-05 11:47:09'),
(8, '$2y$10$Q0Yz7mzi/pZ/Imyy3d2fMe5I2m3.jCfW5y2ALmA2E8RDy2LtB1QTW', 'Nur Azizah Tadjuddin', '', '', '0000-00-00 00:00:00', 4, '2022-10-06 00:20:43'),
(9, '$2y$10$TW.aFDCoM9/46pDn97FYUec/dgGNIeMD5IHlvgdrglIun8z1bZ5eW', 'Mega', '', '', '0000-00-00 00:00:00', 3, '2022-10-16 10:19:04'),
(10, '$2y$10$kQl2gF8QMrywIQZjv2cOzOtjjA3VD4lLh6gx6SOieBEQbcieqACia', 'Nur Fadillah Badwi', '', '', '2022-11-08 13:50:16', 4, '2022-11-08 13:50:16'),
(11, '$2y$10$nlY0Q51Fel8NC13uHZOr4O2UGOHiloVWQ3ylf0.fp3udF1TeAguo2', 'yanti', '', '', '2022-11-12 08:38:06', 3, '2022-11-12 08:38:06'),
(12, '$2y$10$pruHbnC6dU8YfXVzPQQ2eumFRyWoWdMmA0JcNTHQdgpOobEvKOC8W', 'Muhamad Danil', '', '', '0000-00-00 00:00:00', 4, '2022-12-18 15:47:22'),
(13, '$2y$10$o4hQhbBboCLLuUGmaxDO8e/fCVr0055hQq0Ch6NslDLEtfaHTY6km', 'Hayara Octaviani', '', '', '0000-00-00 00:00:00', 4, '2022-12-18 15:47:56'),
(14, '$2y$10$ou0ye1X9nXR89xYlTuduS.Y739gJWx7sC13JQ/q5W/05XDmxd3jfi', 'hamlik daratu ', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:37:15'),
(15, '$2y$10$j6q.vMGHhtO5MQlrDn6qceQiBOEe4WsYdOo5crOcrsQWIiqCOP3f6', 'Aprilia Gita Risqi Tahir', '', '0891', '0000-00-00 00:00:00', 3, '2022-12-18 18:38:45'),
(16, '$2y$10$HnT3c0cZbJg2zQ2y7tNaL.poYe9kK3Qzy/quCIOxwbQgF4iGT.JS2', 'ninda', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:39:18'),
(17, '$2y$10$BMzL8o58yudcnSK9fkDRpehwAxwJkpxoxUjXMANE4yAAeuQruer4a', 'rahma', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:39:57'),
(18, '$2y$10$VFp0vgI49QGHSqom1nqEt.oQ357ETEf9WE7e74zSQIdtD1e0goFHa', 'riski', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:40:27'),
(19, '$2y$10$bWHLtQwEHARtPYQYimgHQe7EHCQ5qpaY.F9sIQbk0rxwsAE87ldcu', 'mirad', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:40:55'),
(20, '$2y$10$1VnMFgTFUWprXVNO4W3dyu2BnDHcsgRKQBIgpcEqoHuveG.IOi.WC', 'hana', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:41:22'),
(21, '$2y$10$F3/MA48YcQooAo5oYn8Q4.6qe00CcJS.26RTfacE9r9QDXUmtx1b2', 'krisman', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:41:58'),
(22, '$2y$10$RAb1y1ICcy2hnxKN0eYvc.EVuCU7UhEANisqwcP9IAEFfJzcpnW6i', 'rahmat', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:42:26'),
(23, '$2y$10$yGh2fODaB87w5w/y3HRyLeemln0r.EiqgHk.llqdB6HS01AVvFz9u', 'komang', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:43:14'),
(24, '$2y$10$NxGoSSpWJbWKLDvWVg9n4.IBU4OKun.1GmKQAMevmpcVyKMRpMVJS', 'anugrah', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:43:50'),
(25, '$2y$10$1.2EgDuK4JbD9QF09mmyFelq9RBVGkWAGyqWFqoqTw7n/5UjX2Xbe', 'faldan', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:44:21'),
(26, '$2y$10$fSXvGnz.UeyEZDa/Pr3UFewM3PQ/hhvocJ7o2K6zZ1TRajFAzWvnG', 'fajar', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:44:48'),
(27, '$2y$10$CLwy9p2f3ejImbo/JD598Odk1b6XgDj/skhrq37byLtBbjdJlyyxu', 'linda', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 18:45:11'),
(28, '$2y$10$TIGeS9Xh0yvi8aa00iuODuLTeOHyKFWqP/f1ltkW1xxmlDBYcxLlq', 'wawan', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 20:15:59'),
(29, '$2y$10$aJC0mimc/gPs6MGvezXFfucndi60lDc2LKboPEWd.j5l90MObm/2e', 'dila', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 20:16:28'),
(30, '$2y$10$JIuTGTOPwK/ZVg2wynKosebG/ws2h48HgoUm1H7xuKAoRGdqcsfHi', 'mila', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 20:16:56'),
(31, '$2y$10$6dm./zsIVpqeaE.6TzE2Iul5pcGjYsmmtmwGHISvpSGG1LxZl.6DS', 'yara', '', '', '0000-00-00 00:00:00', 3, '2022-12-18 20:17:40'),
(32, '$2y$10$V5Nd5Av/qf54nU419qeItuDoi4OjzITpQnvFZ0fQLeHJ72pkr3mcq', 'iqbal', '', '', '0000-00-00 00:00:00', 3, '2023-01-14 03:36:29'),
(33, '$2y$10$i.DI1zrlo/l4ktrlYNUHzOtsv9lJkOsiG5d.l9J1FB2tNYjTnY9VC', 'iqbal', '', '', '0000-00-00 00:00:00', 3, '2023-01-14 03:37:02'),
(34, '$2y$10$XRqMAjC2h4Td2KCZOMqg4.F3fIUNFK425LYhwl5VG9ryEM0Q/1oV6', 'Iqbal Tahir', '', '', '0000-00-00 00:00:00', 3, '2023-01-14 11:51:07'),
(35, '$2y$10$S.VIvqvdSMKsQz49mjF5RuWMEQ98R7.TpUQkNkHC7a7FrAVF33Tqa', 'ibal', '', '085241818939', '0000-00-00 00:00:00', 3, '2023-01-19 02:13:39');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_antrian`
--
ALTER TABLE `tbl_antrian`
  ADD PRIMARY KEY (`antrian_kode`);

--
-- Indeks untuk tabel `tbl_antrian_berjalan`
--
ALTER TABLE `tbl_antrian_berjalan`
  ADD PRIMARY KEY (`antrian_berjalan_id`);

--
-- Indeks untuk tabel `tbl_group`
--
ALTER TABLE `tbl_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indeks untuk tabel `tbl_riwayat_antrian`
--
ALTER TABLE `tbl_riwayat_antrian`
  ADD PRIMARY KEY (`riwayat_antrian_id`);

--
-- Indeks untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indeks untuk tabel `tbl_spesialis`
--
ALTER TABLE `tbl_spesialis`
  ADD PRIMARY KEY (`spesialis_id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_antrian_berjalan`
--
ALTER TABLE `tbl_antrian_berjalan`
  MODIFY `antrian_berjalan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_group`
--
ALTER TABLE `tbl_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT untuk tabel `tbl_riwayat_antrian`
--
ALTER TABLE `tbl_riwayat_antrian`
  MODIFY `riwayat_antrian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_spesialis`
--
ALTER TABLE `tbl_spesialis`
  MODIFY `spesialis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
