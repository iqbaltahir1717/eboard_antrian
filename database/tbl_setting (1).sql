-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jan 2023 pada 05.59
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
(1, 'Klinik Mono Valensi', 'Antrian', 'Kota Kendari', 'Klinik Mono Valensi', '+6281234567890', 'monovalensi@gmail.com', 'Baruga BTN Bumi Arum BLOK X No. 14', 'base-logo120221230050934.jpg', 'base-background120221207200420.jpg', 'skin-blue', 'default', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 'help', 20, '01:00:00', '21:00:00', '2021-02-02 13:29:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
