-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 24, 2016 at 10:49 AM
-- Server version: 5.1.73
-- PHP Version: 5.3.3
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_irna`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `inv_parent_id` tinyint(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`kode_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  `user_desc` text,
  `user_pass` varchar(100) DEFAULT 'NULL',
  `user_level` char(1) DEFAULT '0' COMMENT '1 = admin, 0 = user',
  `user_insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_insert_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `dev_user`
--

INSERT INTO `dev_user` (`user_id`, `user_name`, `user_username`, `user_address`, `user_email`, `user_phone`, `user_desc`, `user_pass`, `user_level`, `user_insert_timestamp`, `user_insert_user_id`) VALUES
(1, 'admin', 'admin', NULL, NULL, NULL, NULL, '21232f297a57a5a743894a0e4a801fc3', '1', '2016-08-18 12:54:11', 0),
(11, 'Irna Fauziyah', 'Irna', NULL, NULL, NULL, 'admin 2', '827ccb0eea8a706c4c34a16891f84e7b', '0', '2016-08-16 18:16:05', 1),
(12, 'ceking', 'cek', NULL, NULL, NULL, 'ceking aja', '6ab97dc5c706cfdc425ca52a65d97b0d', '0', '2016-08-18 13:37:29', 0);

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
  KEY `history_inv_id` (`history_inv_id`),
  KEY `history_inv_id_2` (`history_inv_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `inv_history`
--

INSERT INTO `inv_history` (`history_id`, `history_inv_id`, `history_condition_id`, `history_desc`, `history_insert_user_id`, `history_insert_timestamp`) VALUES
(14, 60, 1, '', 1, '2016-08-17 06:02:21'),
(15, 61, 1, '', 1, '2016-08-17 06:02:44'),
(17, 61, 1, '', 1, '2016-08-17 06:03:08'),
(18, 62, 1, '', 1, '2016-08-17 06:03:27'),
(19, 63, 1, '', 1, '2016-08-17 06:03:42'),
(20, 64, 1, '', 1, '2016-08-17 06:03:56'),
(22, 59, 4, 'patah', 1, '2016-08-17 06:06:10'),
(23, 58, 2, 'ganti', 1, '2016-08-17 06:08:53'),
(24, 64, 2, '', 1, '2016-08-18 12:43:43'),
(27, 69, 3, '', 1, '2016-08-18 13:16:20'),
(28, 72, 1, '', 1, '2016-08-18 13:16:37'),
(29, 73, 2, '', 1, '2016-08-18 13:17:04'),
(32, 74, 1, '', 1, '2016-08-18 13:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `inv_inventory`
--

DROP TABLE IF EXISTS `inv_inventory`;
CREATE TABLE IF NOT EXISTS `inv_inventory` (
  `inv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inv_number` varchar(20) DEFAULT NULL,
  `inv_name` varchar(200) DEFAULT NULL,
  `inv_date_procurement` date DEFAULT NULL,
  `inv_date_expired` date DEFAULT NULL,
  `inv_type_id` int(11) DEFAULT NULL,
  `inv_category_id` int(11) DEFAULT NULL,
  `inv_store_place_in_use` int(11) DEFAULT NULL,
  `inv_store_place_after_use` int(11) DEFAULT NULL,
  `inv_desc` text,
  PRIMARY KEY (`inv_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `inv_inventory`
--

INSERT INTO `inv_inventory` (`inv_id`, `inv_number`, `inv_name`, `inv_date_procurement`, `inv_date_expired`, `inv_type_id`, `inv_category_id`, `inv_store_place_in_use`, `inv_store_place_after_use`, `inv_desc`) VALUES
(58, '2/1970/01/01', 'Meja 1', '2015-01-01', NULL, 1, 2, NULL, NULL, ''),
(59, '3/1970/01/01', 'Meja 2', '2015-01-01', NULL, 1, 2, NULL, NULL, ''),
(60, '4/2016/08/17', 'komputer 1', '2016-08-17', NULL, 10, 2, NULL, NULL, ''),
(61, '5/2016/08/17', 'komputer 2', '2016-08-17', NULL, 10, 2, NULL, NULL, ''),
(62, '6/2016/08/17', 'komputer 3', '2016-08-17', NULL, 10, 2, NULL, NULL, ''),
(63, '7/2016/08/17', 'komputer 4', '2016-08-17', NULL, 10, 2, NULL, NULL, ''),
(64, '8/2016/08/17', 'komputer 5', '2016-08-18', NULL, 10, 2, NULL, NULL, ''),
(65, '8/2016/08/18', 'Foto Copy 1', '2016-08-18', NULL, 12, 2, NULL, NULL, 'baru diterima'),
(66, '9/2016/08/02', 'ruang lab. ipa 1', '2016-08-02', NULL, 0, 1, NULL, NULL, ''),
(67, '10/2016/08/19', 'meja guru 1', '2016-08-19', NULL, 1, 2, NULL, NULL, ''),
(68, '11/2016/08/19', 'meja guru 2', '2016-08-19', NULL, 1, 2, NULL, NULL, ''),
(69, '12/2016/08/20', 'kursi 1', '2016-08-20', NULL, 4, 2, NULL, NULL, ''),
(72, '13/2016/08/23', 'motor 1', '2016-08-23', NULL, 43, 3, NULL, NULL, ''),
(73, '14/2016/08/23', 'motor 2', '2016-08-23', NULL, 43, 3, NULL, NULL, ''),
(74, '15/2016/08/25', 'ruang tata usaha 1', '2016-08-25', NULL, 32, 1, NULL, NULL, ''),
(75, '16/2016/08/25', 'ruang lab. ipa ruang lab. ipa 1', '2016-08-25', NULL, 25, 1, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `inv_ref_category`
--

DROP TABLE IF EXISTS `inv_ref_category`;
CREATE TABLE IF NOT EXISTS `inv_ref_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` char(3) DEFAULT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `is_container` tinyint(1) DEFAULT NULL COMMENT '0 = bukan bangunan, 1 = bangunan',
  `category_desc` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `inv_ref_category`
--

INSERT INTO `inv_ref_category` (`category_id`, `category_code`, `category_name`, `is_container`, `category_desc`) VALUES
(1, 'BGN', 'Bangunan', 1, NULL),
(2, 'ALT', 'Alat dan Perlengkapan ruang', 0, NULL),
(3, 'MOP', 'Kendaraan Operasional', 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
  `type_category_id` int(11) DEFAULT NULL,
  `type_desc` text,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `inv_ref_type`
--

INSERT INTO `inv_ref_type` (`type_id`, `type_code`, `type_name`, `type_category_id`, `type_desc`) VALUES
(1, '', 'Meja Guru', 2, ''),
(2, NULL, 'Meja Siswa', 2, NULL),
(3, NULL, 'Kursi Guru', 2, NULL),
(4, NULL, 'Kursi Siswa', 2, NULL),
(5, NULL, 'Papan Tulis', 2, NULL),
(6, NULL, 'Lemari Guru', 2, NULL),
(7, '', 'Meublelair Perpustakaan', 2, ''),
(8, NULL, 'Mesin Tik', 2, NULL),
(9, NULL, 'Printer', 2, NULL),
(10, NULL, 'Komputer', 2, NULL),
(11, NULL, 'Audio Visual', 2, NULL),
(12, NULL, 'Foto Coppy', 2, NULL),
(13, '', 'Mesin Faximile', 2, ''),
(14, NULL, 'Filling Cabinet', 2, NULL),
(15, NULL, 'LCD/OHP', 2, NULL),
(16, NULL, 'Kendaraan Operasional', 3, NULL),
(18, NULL, 'Ruang Kelas', 1, NULL),
(19, NULL, 'Ruang Guru', 1, NULL),
(20, NULL, 'Laboratotium', 1, NULL),
(21, '', 'Ruang Perpustakaan', 1, ''),
(22, 'BGN', 'Bangku Siswa', 2, ''),
(23, 'BGN', 'Meublair Kep. Madrasah', 2, ''),
(25, 'BGN', 'Ruang Lab. IPA ', 1, ''),
(26, 'BGN', 'Ruang Lab. Biologi', 1, ''),
(27, 'BGN', 'Ruang Lab. Fisika', 1, ''),
(28, 'BGN', 'Ruang Lab. Kimia', 1, ''),
(29, 'BGN', 'Ruang Lab. Komputer', 1, ''),
(30, 'BGN', 'Ruang Lab. Bahasa', 1, ''),
(31, 'BGN', 'Ruang Lab. Pimpinan', 1, ''),
(32, 'BGN', 'Ruang Tata Usaha', 1, ''),
(33, 'BGN', 'Ruang Konseling', 1, ''),
(34, 'BGN', 'Tempat Ibadah', 1, ''),
(35, 'BGN', 'Ruang UKS', 1, ''),
(36, 'BGN', 'Jamban', 1, ''),
(37, 'BGN', 'Gudang', 1, ''),
(38, 'BGN', 'Ruang Sirkulasi', 1, ''),
(39, 'BGN', 'Tempat Olahraga', 1, ''),
(40, 'BGN', 'Ruang Organisasi', 1, ''),
(41, 'BGN', 'Asrama', 1, ''),
(42, 'MOP', 'Mobil', 3, ''),
(43, 'MOP', 'Motor', 3, ''),
(44, 'MOP', 'Mobil Klinik', 3, '');

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
