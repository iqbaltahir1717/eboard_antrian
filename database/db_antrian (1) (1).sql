-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2023 at 03:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.14

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
-- Table structure for table `tbl_antrian`
--

CREATE TABLE `tbl_antrian` (
  `antrian_kode` varchar(30) NOT NULL,
  `antrian_nomor` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `spesialis_id` int(11) NOT NULL,
  `arrival_time` time NOT NULL,
  `service_start_time` time NOT NULL,
  `service_end_time` time NOT NULL,
  `antrian_status` varchar(300) NOT NULL DEFAULT 'arrival'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_antrian`
--

INSERT INTO `tbl_antrian` (`antrian_kode`, `antrian_nomor`, `user_id`, `spesialis_id`, `arrival_time`, `service_start_time`, `service_end_time`, `antrian_status`) VALUES
('FN-2023010217223221', 'A-1', 21, 1, '19:30:32', '17:18:24', '17:19:12', 'end_service'),
('FN-2023010217223222', 'A-2', 9, 1, '19:31:20', '17:20:10', '00:00:00', 'start_service'),
('FN-2023011117361211', 'A-3', 11, 1, '17:36:12', '00:00:00', '00:00:00', 'arrival');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_antrian_berjalan`
--

CREATE TABLE `tbl_antrian_berjalan` (
  `antrian_berjalan_id` int(11) NOT NULL,
  `spesialis_id` int(11) NOT NULL,
  `antrian_saat_ini` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_antrian_berjalan`
--

INSERT INTO `tbl_antrian_berjalan` (`antrian_berjalan_id`, `spesialis_id`, `antrian_saat_ini`) VALUES
(1, 1, '2'),
(2, 2, '1'),
(3, 3, '0'),
(4, 4, '0'),
(5, 5, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

CREATE TABLE `tbl_group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`group_id`, `group_name`, `createtime`) VALUES
(1, 'Super Admin', '2021-02-02 19:26:11'),
(2, 'Admin', '2021-02-05 14:03:49'),
(3, 'Pasien', '2022-10-05 10:40:09'),
(4, 'Dokter', '2022-11-08 13:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
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
-- Dumping data for table `tbl_log`
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
(141, '2023-01-11 22:27:46', 'Super Admin melakukan login ke sistem', '::1', 1, '2023-01-11 22:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_riwayat_antrian`
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
-- Dumping data for table `tbl_riwayat_antrian`
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
(40, 31, 1, 'A20', '18:59:00', '20:53:00', '21:00:00', '2022-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
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
  `setting_max_antrian` int(11) NOT NULL,
  `setting_jam_buka` time NOT NULL,
  `setting_jam_tutup` time NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`setting_id`, `setting_appname`, `setting_short_appname`, `setting_origin_app`, `setting_owner_name`, `setting_phone`, `setting_email`, `setting_address`, `setting_logo`, `setting_background`, `setting_color`, `setting_layout`, `setting_about`, `setting_max_antrian`, `setting_jam_buka`, `setting_jam_tutup`, `createtime`) VALUES
(1, 'Klinik Mono Valensi', 'Antrian', 'Kota Kendari', 'Klinik Mono Valensi', '+6281234567890', 'monovalensi@gmail.com', 'Baruga BTN Bumi Arum BLOK X No. 14', 'base-logo120221230050934.jpg', 'base-background120221207200420.jpg', 'skin-blue', 'default', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 20, '01:00:00', '21:00:00', '2021-02-02 13:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_spesialis`
--

CREATE TABLE `tbl_spesialis` (
  `spesialis_id` int(11) NOT NULL,
  `spesialis_nama` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `spesialis_active` int(11) NOT NULL,
  `spesialis_kode_antrian` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_spesialis`
--

INSERT INTO `tbl_spesialis` (`spesialis_id`, `spesialis_nama`, `user_id`, `spesialis_active`, `spesialis_kode_antrian`) VALUES
(1, 'Ahli penyakit  Saraf', 7, 1, 'A'),
(2, 'Spesialis Patologi Anatomi', 8, 1, 'B'),
(3, 'Spesialis Ortopedi dan Traumatologim', 10, 1, 'C'),
(4, 'Jantung dan Pembuluh Darah', 12, 1, 'D'),
(5, 'Umum', 13, 1, 'E');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_token` varchar(100) DEFAULT NULL,
  `user_lastlogin` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_password`, `user_fullname`, `user_photo`, `user_email`, `user_token`, `user_lastlogin`, `group_id`, `createtime`) VALUES
(1, 'fani', '$2y$10$UYxuPgDeRR4/O4jrn2byyuCKuDg9/hyjHtwhpaYUp4e/hQo23J6zK', 'Super Admin', 'profile-1-20221218125146.png', 'fani@gmail.com', '', '2021-02-02 19:40:31', 1, '2021-02-02 19:40:31'),
(6, 'mega', '$2y$10$KqVyjh667iEcAO62Y/u5quQPgNebdeM71eo5IHvsQJOuMJlbpojGG', 'admin mega', 'profile-1-20221109222049.jpg', 'mega@gmail.coms', '', '0000-00-00 00:00:00', 2, '2022-05-23 16:08:55'),
(7, 'abi', '$2y$10$ZTA5zp6VYpBhsLY5/rOjaeceVTOXg8vvMLPisFnUurOF3jr7H94y.', 'Nur Sabri Abdillah', 'profile-1-20221109222049.jpg', 'yanti@gmail.com', NULL, '0000-00-00 00:00:00', 4, '2022-10-05 11:47:09'),
(8, 'azizah', '$2y$10$Q0Yz7mzi/pZ/Imyy3d2fMe5I2m3.jCfW5y2ALmA2E8RDy2LtB1QTW', 'Nur Azizah Tadjuddin', 'profile-1-20221109222049.jpg', 'azizah@gmail.com', NULL, '0000-00-00 00:00:00', 4, '2022-10-06 00:20:43'),
(9, 'megas', '$2y$10$TW.aFDCoM9/46pDn97FYUec/dgGNIeMD5IHlvgdrglIun8z1bZ5eW', 'Mega', 'profile-1-20221109222049.jpg', 'mega@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-10-16 10:19:04'),
(10, 'dilla', '$2y$10$kQl2gF8QMrywIQZjv2cOzOtjjA3VD4lLh6gx6SOieBEQbcieqACia', 'Nur Fadillah Badwi', 'profile-1-20221109222049.jpg', 'dilla@gmail.com', NULL, '2022-11-08 13:50:16', 4, '2022-11-08 13:50:16'),
(11, 'yanti', '$2y$10$nlY0Q51Fel8NC13uHZOr4O2UGOHiloVWQ3ylf0.fp3udF1TeAguo2', 'yanti', 'profile-1-20221109222049.jpg', 'yanti@gmail.com', NULL, '2022-11-12 08:38:06', 3, '2022-11-12 08:38:06'),
(12, 'danil', '$2y$10$pruHbnC6dU8YfXVzPQQ2eumFRyWoWdMmA0JcNTHQdgpOobEvKOC8W', 'Muhamad Danil', 'profile-1-20221109222049.jpg', 'danil@gmail.com', NULL, '0000-00-00 00:00:00', 4, '2022-12-18 15:47:22'),
(13, 'yara', '$2y$10$o4hQhbBboCLLuUGmaxDO8e/fCVr0055hQq0Ch6NslDLEtfaHTY6km', 'Hayara Octaviani', 'profile-1-20221109222049.jpg', 'yara@gmail.com', NULL, '0000-00-00 00:00:00', 4, '2022-12-18 15:47:56'),
(14, 'hamlik', '$2y$10$ou0ye1X9nXR89xYlTuduS.Y739gJWx7sC13JQ/q5W/05XDmxd3jfi', 'hamlik daratu ', '', 'hamlik@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:37:15'),
(15, 'gita', '$2y$10$j6q.vMGHhtO5MQlrDn6qceQiBOEe4WsYdOo5crOcrsQWIiqCOP3f6', 'gita', '', 'gita@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:38:45'),
(16, 'ninda', '$2y$10$HnT3c0cZbJg2zQ2y7tNaL.poYe9kK3Qzy/quCIOxwbQgF4iGT.JS2', 'ninda', '', 'ninda@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:39:18'),
(17, 'rahma', '$2y$10$BMzL8o58yudcnSK9fkDRpehwAxwJkpxoxUjXMANE4yAAeuQruer4a', 'rahma', '', 'rahma@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:39:57'),
(18, 'riski', '$2y$10$VFp0vgI49QGHSqom1nqEt.oQ357ETEf9WE7e74zSQIdtD1e0goFHa', 'riski', '', 'riski@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:40:27'),
(19, 'mirad', '$2y$10$bWHLtQwEHARtPYQYimgHQe7EHCQ5qpaY.F9sIQbk0rxwsAE87ldcu', 'mirad', '', 'mirad@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:40:55'),
(20, 'hana', '$2y$10$1VnMFgTFUWprXVNO4W3dyu2BnDHcsgRKQBIgpcEqoHuveG.IOi.WC', 'hana', '', 'hana@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:41:22'),
(21, 'krisman', '$2y$10$F3/MA48YcQooAo5oYn8Q4.6qe00CcJS.26RTfacE9r9QDXUmtx1b2', 'krisman', '', 'krisman@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:41:58'),
(22, 'rahmat', '$2y$10$RAb1y1ICcy2hnxKN0eYvc.EVuCU7UhEANisqwcP9IAEFfJzcpnW6i', 'rahmat', '', 'rahmat@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:42:26'),
(23, 'komang', '$2y$10$yGh2fODaB87w5w/y3HRyLeemln0r.EiqgHk.llqdB6HS01AVvFz9u', 'komang', '', 'komang@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:43:14'),
(24, 'anugrah', '$2y$10$NxGoSSpWJbWKLDvWVg9n4.IBU4OKun.1GmKQAMevmpcVyKMRpMVJS', 'anugrah', '', 'anugrah@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:43:50'),
(25, 'faldan', '$2y$10$1.2EgDuK4JbD9QF09mmyFelq9RBVGkWAGyqWFqoqTw7n/5UjX2Xbe', 'faldan', '', 'faldan@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:44:21'),
(26, 'fajar', '$2y$10$fSXvGnz.UeyEZDa/Pr3UFewM3PQ/hhvocJ7o2K6zZ1TRajFAzWvnG', 'fajar', '', 'fajar@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:44:48'),
(27, 'linda', '$2y$10$CLwy9p2f3ejImbo/JD598Odk1b6XgDj/skhrq37byLtBbjdJlyyxu', 'linda', '', 'linda@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 18:45:11'),
(28, 'wawan', '$2y$10$TIGeS9Xh0yvi8aa00iuODuLTeOHyKFWqP/f1ltkW1xxmlDBYcxLlq', 'wawan', '', 'wawan@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 20:15:59'),
(29, 'dila', '$2y$10$aJC0mimc/gPs6MGvezXFfucndi60lDc2LKboPEWd.j5l90MObm/2e', 'dila', '', 'dila@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 20:16:28'),
(30, 'mila', '$2y$10$JIuTGTOPwK/ZVg2wynKosebG/ws2h48HgoUm1H7xuKAoRGdqcsfHi', 'mila', '', 'mila@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 20:16:56'),
(31, 'yara', '$2y$10$6dm./zsIVpqeaE.6TzE2Iul5pcGjYsmmtmwGHISvpSGG1LxZl.6DS', 'yara', '', 'yara@gmail.com', NULL, '0000-00-00 00:00:00', 3, '2022-12-18 20:17:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_antrian`
--
ALTER TABLE `tbl_antrian`
  ADD PRIMARY KEY (`antrian_kode`);

--
-- Indexes for table `tbl_antrian_berjalan`
--
ALTER TABLE `tbl_antrian_berjalan`
  ADD PRIMARY KEY (`antrian_berjalan_id`);

--
-- Indexes for table `tbl_group`
--
ALTER TABLE `tbl_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tbl_riwayat_antrian`
--
ALTER TABLE `tbl_riwayat_antrian`
  ADD PRIMARY KEY (`riwayat_antrian_id`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tbl_spesialis`
--
ALTER TABLE `tbl_spesialis`
  ADD PRIMARY KEY (`spesialis_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_antrian_berjalan`
--
ALTER TABLE `tbl_antrian_berjalan`
  MODIFY `antrian_berjalan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_group`
--
ALTER TABLE `tbl_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `tbl_riwayat_antrian`
--
ALTER TABLE `tbl_riwayat_antrian`
  MODIFY `riwayat_antrian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_spesialis`
--
ALTER TABLE `tbl_spesialis`
  MODIFY `spesialis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
