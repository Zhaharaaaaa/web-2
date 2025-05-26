-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 26, 2025 at 03:06 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkegiatan_dosen`
--

-- --------------------------------------------------------

--
-- Table structure for table `bidang_ilmu`
--

CREATE TABLE `bidang_ilmu` (
  `id` int NOT NULL,
  `nama` varchar(45) NOT NULL,
  `deskripsi` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bidang_ilmu`
--

INSERT INTO `bidang_ilmu` (`id`, `nama`, `deskripsi`) VALUES
(2, 'Sistem Informasi', 'Penelitian SI'),
(5, 'Psikologi', 'Analisis Kesehatan Mental Mahasiswa Semester Akhir'),
(8, 'Kedokteran Hewan', 'Penelitian kesehatan hewan unggas'),
(9, 'Teknik Mesin', 'Pembuatan robot dengan kecerdasaan AI');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `gelar_belakang` varchar(30) DEFAULT NULL,
  `gelar_depan` varchar(30) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `tempat_lahir` varchar(45) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tahun_masuk` int DEFAULT NULL,
  `prodi_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nidn`, `nama`, `gelar_belakang`, `gelar_depan`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `email`, `tahun_masuk`, `prodi_id`) VALUES
(2, '01102', 'Hyunsuk', 'M.T', 'Dr.', 'L', 'Jakarta', '1982-05-22', 'Jl. Kenanga 2', 'hyun@univ.ac.id', 2021, 2),
(8, '01101', 'jihoon', 'S.T', 'Dr', 'L', 'Seoul', '2002-05-13', 'Korea selatan', 'jihoon@gmail.com', 2018, 8),
(9, '01103', 'Asahi', 'S.T', 'Dr.', 'L', 'Osaka', '2002-02-13', 'Jepang', 'asahi@gmail.com', 2025, 7),
(10, '01104', 'Junghwan', 'M.M', '', 'L', 'Seoul', '2005-07-13', 'Korea selatan', 'junghwan@gmail.com', 2011, 2),
(11, '01105', 'yoshi', 'S.K', '', 'L', 'Tokyo', '2002-05-07', 'Jepang', 'yoshi@gmail.com', 2011, 9),
(12, '01106', 'Taeyong', 'S.K.d', '', 'L', 'Seoul', '1995-07-28', 'Korea selatan', 'taeyong@gmail.com', 2011, 10),
(13, '01107', 'Jungwoo', 'S.T', '', 'L', 'Seoul', '1999-03-04', 'Korea selatan', 'jung@gmail.co.id', 2018, 7),
(14, '01108', 'chaeunwoo', 'S.K', 'Dr.', 'L', 'Seoul', '1997-07-10', 'Korea selatan', 'eunwoo@gmail.co.ks', 2015, 10),
(15, '01109', 'Dylan', 'M.M', 'Dr.', 'L', 'Beijing', '1997-11-16', 'China', 'dylan@gmail.com', 2025, 8),
(16, '011010', 'Rukawa', 'S.Kom', '', 'L', 'Tokyo', '2004-03-04', 'Jepang', 'ruk@gmail.com', 2025, 2),
(17, '011011', 'Zhahara', 'S.Kom', 'Dr.', 'P', 'tasikmalaya', '2006-01-19', 'cipayung', 'secvallet@gmail.com', 2028, 2),
(19, '011012', 'Mark', 'S.T', '', 'L', 'California', '1999-10-15', 'Amerika Serikat', 'mark@gmail.com', 2025, 7);

-- --------------------------------------------------------

--
-- Table structure for table `dosen_kegiatan`
--

CREATE TABLE `dosen_kegiatan` (
  `dosen_id` int NOT NULL,
  `kegiatan_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dosen_kegiatan`
--

INSERT INTO `dosen_kegiatan` (`dosen_id`, `kegiatan_id`) VALUES
(9, 4),
(15, 4),
(17, 4),
(10, 5),
(17, 6),
(19, 6);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kegiatan`
--

CREATE TABLE `jenis_kegiatan` (
  `id` int NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `nama`) VALUES
(1, 'Seminar Nasional'),
(2, 'Workshop'),
(3, 'Pelatihan'),
(4, 'Kuliah Tamu'),
(5, 'Pembicara'),
(6, 'Broadcast'),
(7, 'Pelatih');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  `jenis_kegiatan_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `tanggal_mulai`, `tanggal_selesai`, `tempat`, `deskripsi`, `jenis_kegiatan_id`) VALUES
(4, '2025-05-01', '2025-05-02', 'Gedung Sate', 'Seminar', 1),
(5, '2025-05-09', '2025-05-10', 'Gedung Pancasila', 'Workshop anggota pemerintah', 2),
(6, '2028-08-17', '2025-08-25', 'Gedung Kemerdekaan', 'Pembicara di acara korea selatan - indonesia', 5),
(8, '2025-05-24', '2025-06-02', 'Lapangan', 'Bermain Sepak bola dengan mahasiswa', 3);

-- --------------------------------------------------------

--
-- Table structure for table `penelitian`
--

CREATE TABLE `penelitian` (
  `id` int NOT NULL,
  `judul` text NOT NULL,
  `mulai` date DEFAULT NULL,
  `akhir` date DEFAULT NULL,
  `tahun_ajaran` varchar(45) DEFAULT NULL,
  `bidang_ilmu_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penelitian`
--

INSERT INTO `penelitian` (`id`, `judul`, `mulai`, `akhir`, `tahun_ajaran`, `bidang_ilmu_id`) VALUES
(4, 'Analisis kepala ayam stabil', '2025-05-01', '2025-05-31', '2019', 8),
(5, 'Penelitian mengenai informasi dengan ke akurat data', '2027-06-14', '2027-06-29', '2024', 2),
(6, 'Penerapan kecerdasan buaatan', '2025-01-09', '2025-04-09', '2025', 9);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id` int NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `ketua` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id`, `kode`, `nama`, `alamat`, `telpon`, `ketua`) VALUES
(2, 'SI', 'Sistem Informasi', 'Jl. Proklamasi 21', '08123456780', 'Dr. Siti'),
(7, 'TI', 'Teknik Informatika', 'Korea selatan', '089777865336', 'Asahi'),
(8, 'HK', 'Hukum', 'Korea selatan', '074832732', 'Babeh'),
(9, 'ILKOM', 'Ilmu Komunikasi', 'Jepang', '08364622', 'Babeh'),
(10, 'DH', 'Kedokteran Hewan', 'cipayung', '08632521841', 'Dr. Supa');

-- --------------------------------------------------------

--
-- Table structure for table `tim_penelitian`
--

CREATE TABLE `tim_penelitian` (
  `dosen_id` int NOT NULL,
  `penelitian_id` int NOT NULL,
  `peran` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tim_penelitian`
--

INSERT INTO `tim_penelitian` (`dosen_id`, `penelitian_id`, `peran`) VALUES
(2, 5, 'Anggota'),
(8, 5, 'Staff'),
(9, 4, 'Ketua'),
(10, 4, 'Anggota'),
(10, 6, 'Ketua'),
(11, 4, 'Anggota'),
(12, 5, 'Staff'),
(15, 5, 'Staff'),
(16, 6, 'anggota'),
(17, 5, 'Ketua');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang_ilmu`
--
ALTER TABLE `bidang_ilmu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nidn` (`nidn`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indexes for table `dosen_kegiatan`
--
ALTER TABLE `dosen_kegiatan`
  ADD PRIMARY KEY (`dosen_id`,`kegiatan_id`),
  ADD KEY `kegiatan_id` (`kegiatan_id`);

--
-- Indexes for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_kegiatan_id` (`jenis_kegiatan_id`);

--
-- Indexes for table `penelitian`
--
ALTER TABLE `penelitian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bidang_ilmu_id` (`bidang_ilmu_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tim_penelitian`
--
ALTER TABLE `tim_penelitian`
  ADD PRIMARY KEY (`dosen_id`,`penelitian_id`),
  ADD KEY `penelitian_id` (`penelitian_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bidang_ilmu`
--
ALTER TABLE `bidang_ilmu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `penelitian`
--
ALTER TABLE `penelitian`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dosen_kegiatan`
--
ALTER TABLE `dosen_kegiatan`
  ADD CONSTRAINT `dosen_kegiatan_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dosen_kegiatan_ibfk_2` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`jenis_kegiatan_id`) REFERENCES `jenis_kegiatan` (`id`);

--
-- Constraints for table `penelitian`
--
ALTER TABLE `penelitian`
  ADD CONSTRAINT `penelitian_ibfk_1` FOREIGN KEY (`bidang_ilmu_id`) REFERENCES `bidang_ilmu` (`id`);

--
-- Constraints for table `tim_penelitian`
--
ALTER TABLE `tim_penelitian`
  ADD CONSTRAINT `tim_penelitian_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tim_penelitian_ibfk_2` FOREIGN KEY (`penelitian_id`) REFERENCES `penelitian` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
