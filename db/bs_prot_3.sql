-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2016 at 07:36 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bs_prot`
--
CREATE DATABASE IF NOT EXISTS `bs_prot` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bs_prot`;

-- --------------------------------------------------------

--
-- Table structure for table `dev_admin`
--

DROP TABLE IF EXISTS `dev_admin`;
CREATE TABLE IF NOT EXISTS `dev_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id for user',
  `name` varchar(100) DEFAULT NULL COMMENT 'name',
  `username` varchar(100) DEFAULT NULL COMMENT 'username',
  `password` varchar(100) NOT NULL DEFAULT 'md5(''admin'')' COMMENT 'encripted password, default admin',
  `level` int(11) DEFAULT NULL COMMENT 'level of admin',
  `description` text COMMENT 'deskription of admin',
  `datetime_isert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date and time insert',
  PRIMARY KEY (`id`),
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `dev_admin`
--

TRUNCATE TABLE `dev_admin`;
--
-- Dumping data for table `dev_admin`
--

INSERT INTO `dev_admin` (`id`, `name`, `username`, `password`, `level`, `description`, `datetime_isert`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 'root\r\n', '2016-01-28 14:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `dev_file`
--

DROP TABLE IF EXISTS `dev_file`;
CREATE TABLE IF NOT EXISTS `dev_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL,
  `file_path` text,
  `file_description` text,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `dev_file`
--

TRUNCATE TABLE `dev_file`;
-- --------------------------------------------------------

--
-- Table structure for table `dev_image`
--

DROP TABLE IF EXISTS `dev_image`;
CREATE TABLE IF NOT EXISTS `dev_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) DEFAULT NULL,
  `image_path` text,
  `image_description` text,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `dev_image`
--

TRUNCATE TABLE `dev_image`;
-- --------------------------------------------------------

--
-- Table structure for table `dev_inventory`
--

DROP TABLE IF EXISTS `dev_inventory`;
CREATE TABLE IF NOT EXISTS `dev_inventory` (
  `kode_inventory` varchar(10) NOT NULL,
  `nama_inventory` varchar(30) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `tanggal_diterima` date NOT NULL,
  `inv_tipe` int(11) NOT NULL,
  `inv_parent_id` tinyint(1) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`kode_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `dev_inventory`
--

TRUNCATE TABLE `dev_inventory`;
--
-- Dumping data for table `dev_inventory`
--

INSERT INTO `dev_inventory` (`kode_inventory`, `nama_inventory`, `kondisi`, `tanggal_diterima`, `inv_tipe`, `inv_parent_id`) VALUES
('213', 'Papan', 'Baik ', '2012-01-01', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dev_level`
--

DROP TABLE IF EXISTS `dev_level`;
CREATE TABLE IF NOT EXISTS `dev_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id of level',
  `name` varchar(100) DEFAULT NULL COMMENT 'name level',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `dev_level`
--

TRUNCATE TABLE `dev_level`;
--
-- Dumping data for table `dev_level`
--

INSERT INTO `dev_level` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'root');

-- --------------------------------------------------------

--
-- Table structure for table `dev_user`
--

DROP TABLE IF EXISTS `dev_user`;
CREATE TABLE IF NOT EXISTS `dev_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `user_name` varchar(100) DEFAULT NULL COMMENT 'full name of user',
  `user_username` varchar(100) DEFAULT NULL COMMENT 'name of user',
  `user_address` text,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `user_description` text,
  `user_pass` varchar(100) DEFAULT 'NULL',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `dev_user`
--

TRUNCATE TABLE `dev_user`;
--
-- Dumping data for table `dev_user`
--

INSERT INTO `dev_user` (`user_id`, `user_name`, `user_username`, `user_address`, `user_email`, `user_phone`, `user_description`, `user_pass`) VALUES
(1, 'admin', 'admin', NULL, NULL, NULL, NULL, '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `inv_history`
--

DROP TABLE IF EXISTS `inv_history`;
CREATE TABLE IF NOT EXISTS `inv_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_inv_id` int(11) NOT NULL,
  `history_condition_id` int(11) DEFAULT NULL,
  `history_desc` text,
  `history_insert_user_id` int(11) DEFAULT NULL,
  `history_insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `history_condition` (`history_condition_id`),
  KEY `history_insert_user_id` (`history_insert_user_id`),
  KEY `history_inv_id` (`history_inv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `inv_history`
--

TRUNCATE TABLE `inv_history`;
--
-- Dumping data for table `inv_history`
--

INSERT INTO `inv_history` (`history_id`, `history_inv_id`, `history_condition_id`, `history_desc`, `history_insert_user_id`, `history_insert_timestamp`) VALUES
(1, 1, 2, 'cat mengelupas', 1, '2016-05-29 03:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `inv_inventory`
--

DROP TABLE IF EXISTS `inv_inventory`;
CREATE TABLE IF NOT EXISTS `inv_inventory` (
  `inv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inv_name` varchar(200) DEFAULT NULL,
  `inv_date_procurement` date DEFAULT NULL,
  `inv_type_id` int(11) DEFAULT NULL,
  `inv_category_id` int(11) DEFAULT NULL,
  `inv_desc` text,
  PRIMARY KEY (`inv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `inv_inventory`
--

TRUNCATE TABLE `inv_inventory`;
--
-- Dumping data for table `inv_inventory`
--

INSERT INTO `inv_inventory` (`inv_id`, `inv_name`, `inv_date_procurement`, `inv_type_id`, `inv_category_id`, `inv_desc`) VALUES
(1, 'kursi 1', '2016-05-25', 4, 2, 'percobaan');

-- --------------------------------------------------------

--
-- Table structure for table `inv_ref_category`
--

DROP TABLE IF EXISTS `inv_ref_category`;
CREATE TABLE IF NOT EXISTS `inv_ref_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` char(3) DEFAULT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `category_desc` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `inv_ref_category`
--

TRUNCATE TABLE `inv_ref_category`;
--
-- Dumping data for table `inv_ref_category`
--

INSERT INTO `inv_ref_category` (`category_id`, `category_code`, `category_name`, `category_desc`) VALUES
(1, 'BGN', 'Bangunan', NULL),
(2, 'ALT', 'Alat dan Perlengkapan ruang', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_ref_condition`
--

DROP TABLE IF EXISTS `inv_ref_condition`;
CREATE TABLE IF NOT EXISTS `inv_ref_condition` (
  `cond_id` int(11) NOT NULL AUTO_INCREMENT,
  `cond_code` char(3) DEFAULT NULL,
  `cond_name` varchar(200) DEFAULT NULL,
  `cond_desc` text,
  PRIMARY KEY (`cond_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `inv_ref_condition`
--

TRUNCATE TABLE `inv_ref_condition`;
--
-- Dumping data for table `inv_ref_condition`
--

INSERT INTO `inv_ref_condition` (`cond_id`, `cond_code`, `cond_name`, `cond_desc`) VALUES
(1, 'B', 'Baik', NULL),
(2, 'RR', 'Rusak Ringan', NULL),
(3, 'RS', 'Rusak Sedang', NULL),
(4, 'RB', 'Rusak Berat', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_ref_type`
--

DROP TABLE IF EXISTS `inv_ref_type`;
CREATE TABLE IF NOT EXISTS `inv_ref_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` char(3) DEFAULT NULL,
  `type_name` varchar(200) DEFAULT NULL,
  `type_desc` text,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `inv_ref_type`
--

TRUNCATE TABLE `inv_ref_type`;
--
-- Dumping data for table `inv_ref_type`
--

INSERT INTO `inv_ref_type` (`type_id`, `type_code`, `type_name`, `type_desc`) VALUES
(1, NULL, 'Meja Guru', NULL),
(2, NULL, 'Meja Siswa', NULL),
(3, NULL, 'Kursi Guru', NULL),
(4, NULL, 'Kursi Siswa', NULL),
(5, NULL, 'Papan Tulis', NULL),
(6, NULL, 'Lemari Guru', NULL),
(7, NULL, 'Meublelair', NULL),
(8, NULL, 'Mesin Tik', NULL),
(9, NULL, 'Printer', NULL),
(10, NULL, 'Komputer', NULL),
(11, NULL, 'Audio Visual', NULL),
(12, NULL, 'Foto Coppy', NULL),
(13, NULL, 'Faximile', NULL),
(14, NULL, 'Filling Cabinet', NULL),
(15, NULL, 'LCD/OHP', NULL),
(16, NULL, 'Kendaraan Operasional', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dev_admin`
--
ALTER TABLE `dev_admin`
  ADD CONSTRAINT `dev_admin_ibfk_1` FOREIGN KEY (`level`) REFERENCES `dev_level` (`id`);

--
-- Constraints for table `inv_history`
--
ALTER TABLE `inv_history`
  ADD CONSTRAINT `inv_history_ibfk_1` FOREIGN KEY (`history_condition_id`) REFERENCES `inv_ref_condition` (`cond_id`),
  ADD CONSTRAINT `inv_history_ibfk_2` FOREIGN KEY (`history_insert_user_id`) REFERENCES `dev_admin` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
