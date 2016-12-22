/*
SQLyog Ultimate v10.41 
MySQL - 5.5.5-10.1.9-MariaDB : Database - bs_prot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `dev_admin` */
use db_irna;


DROP TABLE IF EXISTS `dev_admin`;

CREATE TABLE `dev_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id for user',
  `name` varchar(100) DEFAULT NULL COMMENT 'name',
  `username` varchar(100) DEFAULT NULL COMMENT 'username',
  `password` varchar(100) NOT NULL DEFAULT 'md5(''admin'')' COMMENT 'encripted password, default admin',
  `level` int(11) DEFAULT NULL COMMENT 'level of admin',
  `description` text COMMENT 'deskription of admin',
  `datetime_isert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date and time insert',
  PRIMARY KEY (`id`),
  UNIQUE KEY `level` (`level`),
  CONSTRAINT `dev_admin_ibfk_1` FOREIGN KEY (`level`) REFERENCES `dev_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `dev_admin` */

insert  into `dev_admin`(`id`,`name`,`username`,`password`,`level`,`description`,`datetime_isert`) values (1,'admin','admin','21232f297a57a5a743894a0e4a801fc3',1,'root\r\n','2016-01-28 21:58:50');

/*Table structure for table `dev_file` */

DROP TABLE IF EXISTS `dev_file`;

CREATE TABLE `dev_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL,
  `file_path` text,
  `file_description` text,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dev_file` */

/*Table structure for table `dev_image` */

DROP TABLE IF EXISTS `dev_image`;

CREATE TABLE `dev_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) DEFAULT NULL,
  `image_path` text,
  `image_description` text,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dev_image` */

/*Table structure for table `dev_inventory` */

DROP TABLE IF EXISTS `dev_inventory`;

CREATE TABLE `dev_inventory` (
  `kode_inventory` varchar(10) NOT NULL,
  `nama_inventory` varchar(30) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `tanggal_diterima` date NOT NULL,
  `inv_tipe` int(11) NOT NULL,
  `inv_parent_id` tinyint(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`kode_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dev_inventory` */

insert  into `dev_inventory`(`kode_inventory`,`nama_inventory`,`kondisi`,`tanggal_diterima`,`inv_tipe`,`inv_parent_id`) values ('213','Papan','Baik ','2012-01-01',0,NULL);

/*Table structure for table `dev_level` */

DROP TABLE IF EXISTS `dev_level`;

CREATE TABLE `dev_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id of level',
  `name` varchar(100) DEFAULT NULL COMMENT 'name level',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `dev_level` */

insert  into `dev_level`(`id`,`name`) values (1,'admin'),(2,'root');

/*Table structure for table `dev_user` */

DROP TABLE IF EXISTS `dev_user`;

CREATE TABLE `dev_user` (
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

/*Data for the table `dev_user` */

insert  into `dev_user`(`user_id`,`user_name`,`user_username`,`user_address`,`user_email`,`user_phone`,`user_description`,`user_pass`) values (1,'admin','admin',NULL,NULL,NULL,NULL,'21232f297a57a5a743894a0e4a801fc3');

/*Table structure for table `inv_history` */

DROP TABLE IF EXISTS `inv_history`;

CREATE TABLE `inv_history` (
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
  KEY `history_inv_id_2` (`history_inv_id`),
  CONSTRAINT `inv_history_ibfk_1` FOREIGN KEY (`history_condition_id`) REFERENCES `inv_ref_condition` (`cond_id`),
  CONSTRAINT `inv_history_ibfk_2` FOREIGN KEY (`history_insert_user_id`) REFERENCES `dev_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `inv_history` */

insert  into `inv_history`(`history_id`,`history_inv_id`,`history_condition_id`,`history_desc`,`history_insert_user_id`,`history_insert_timestamp`) values (1,1,2,'cat mengelupas',1,'2016-05-29 10:02:33'),(2,1,3,'ceking',1,'2016-06-23 20:00:28');

/*Table structure for table `inv_inventory` */

DROP TABLE IF EXISTS `inv_inventory`;

CREATE TABLE `inv_inventory` (
  `inv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inv_number` varchar(20) DEFAULT NULL,
  `inv_name` varchar(200) DEFAULT NULL,
  `inv_date_procurement` date DEFAULT NULL,
  `inv_type_id` int(11) DEFAULT NULL,
  `inv_category_id` int(11) DEFAULT NULL,
  `inv_desc` text,
  PRIMARY KEY (`inv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `inv_inventory` */

insert  into `inv_inventory`(`inv_id`,`inv_number`,`inv_name`,`inv_date_procurement`,`inv_type_id`,`inv_category_id`,`inv_desc`) values (35,'3/2016/08/10','kursi1','2016-08-10',4,2,'ceking'),(36,'4/2016/08/10','kursi2','2016-08-10',4,2,'ceking'),(37,'5/2016/08/10','kursi3','2016-08-10',4,2,'ceking');

/*Table structure for table `inv_ref_category` */

DROP TABLE IF EXISTS `inv_ref_category`;

CREATE TABLE `inv_ref_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` char(3) DEFAULT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `category_desc` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_category` */

insert  into `inv_ref_category`(`category_id`,`category_code`,`category_name`,`category_desc`) values (1,'BGN','Bangunan',NULL),(2,'ALT','Alat dan Perlengkapan ruang',NULL),(3,'MOP','Kendaraan Operasional',NULL);

/*Table structure for table `inv_ref_condition` */

DROP TABLE IF EXISTS `inv_ref_condition`;

CREATE TABLE `inv_ref_condition` (
  `cond_id` int(11) NOT NULL AUTO_INCREMENT,
  `cond_code` char(3) DEFAULT NULL,
  `cond_name` varchar(200) DEFAULT NULL,
  `cond_desc` text,
  PRIMARY KEY (`cond_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_condition` */

insert  into `inv_ref_condition`(`cond_id`,`cond_code`,`cond_name`,`cond_desc`) values (1,'B','Baik',NULL),(2,'RR','Rusak Ringan',NULL),(3,'RS','Rusak Sedang',NULL),(4,'RB','Rusak Berat',NULL);

/*Table structure for table `inv_ref_type` */

DROP TABLE IF EXISTS `inv_ref_type`;

CREATE TABLE `inv_ref_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` char(3) DEFAULT NULL,
  `type_name` varchar(200) DEFAULT NULL,
  `type_category_id` int(11) DEFAULT NULL,
  `type_desc` text,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_type` */

insert  into `inv_ref_type`(`type_id`,`type_code`,`type_name`,`type_category_id`,`type_desc`) values (1,NULL,'Meja Guru',2,NULL),(2,NULL,'Meja Siswa',2,NULL),(3,NULL,'Kursi Guru',2,NULL),(4,NULL,'Kursi Siswa',2,NULL),(5,NULL,'Papan Tulis',2,NULL),(6,NULL,'Lemari Guru',2,NULL),(7,NULL,'Meublelair',2,NULL),(8,NULL,'Mesin Tik',2,NULL),(9,NULL,'Printer',2,NULL),(10,NULL,'Komputer',2,NULL),(11,NULL,'Audio Visual',2,NULL),(12,NULL,'Foto Coppy',2,NULL),(13,NULL,'Faximile',2,NULL),(14,NULL,'Filling Cabinet',2,NULL),(15,NULL,'LCD/OHP',2,NULL),(16,NULL,'Kendaraan Operasional',3,NULL),(18,NULL,'Ruang Kelas',1,NULL),(19,NULL,'Ruang Guru',1,NULL),(20,NULL,'Laboratotium',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
