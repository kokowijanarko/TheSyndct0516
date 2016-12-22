/*
SQLyog Ultimate v10.41 
MySQL - 5.5.5-10.1.9-MariaDB : Database - db_irna
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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
  `user_desc` text,
  `user_pass` varchar(100) DEFAULT 'NULL',
  `user_level` char(1) DEFAULT '0' COMMENT '1 = admin, 0 = user',
  `user_insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_insert_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `dev_user` */

insert  into `dev_user`(`user_id`,`user_name`,`user_username`,`user_address`,`user_email`,`user_phone`,`user_desc`,`user_pass`,`user_level`,`user_insert_timestamp`,`user_insert_user_id`) values (1,'admin','admin',NULL,NULL,NULL,NULL,'21232f297a57a5a743894a0e4a801fc3','1','2016-08-18 12:54:11',0),(11,'Irna Fauziyah','Irna',NULL,NULL,NULL,'admin 2','827ccb0eea8a706c4c34a16891f84e7b','0','2016-08-16 18:16:05',1),(12,'ceking','cek',NULL,NULL,NULL,'ceking aja','6ab97dc5c706cfdc425ca52a65d97b0d','0','2016-08-18 13:37:29',0);

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
  CONSTRAINT `inv_history_ibfk_2` FOREIGN KEY (`history_insert_user_id`) REFERENCES `dev_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

/*Data for the table `inv_history` */

insert  into `inv_history`(`history_id`,`history_inv_id`,`history_condition_id`,`history_desc`,`history_insert_user_id`,`history_insert_timestamp`) values (50,125,1,'',1,'2016-08-28 16:49:11'),(51,126,1,'',1,'2016-08-28 16:49:11'),(52,127,1,'',1,'2016-08-28 16:51:58'),(53,128,1,'',1,'2016-08-28 16:51:58'),(54,129,1,'',1,'2016-08-28 16:51:58');

/*Table structure for table `inv_inventory` */

DROP TABLE IF EXISTS `inv_inventory`;

CREATE TABLE `inv_inventory` (
  `inv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inv_number` varchar(20) DEFAULT NULL,
  `inv_name` varchar(200) DEFAULT NULL,
  `inv_date_procurement` date DEFAULT NULL,
  `inv_date_expired` date DEFAULT NULL,
  `inv_class_id` int(11) DEFAULT NULL,
  `inv_category_id` int(11) DEFAULT NULL,
  `inv_group_id` int(11) DEFAULT NULL,
  `inv_type_id` int(11) DEFAULT NULL,
  `inv_store_place_in_use` int(11) DEFAULT NULL,
  `inv_store_place_after_use` int(11) DEFAULT NULL,
  `inv_desc` text,
  PRIMARY KEY (`inv_id`),
  KEY `inv_class_id` (`inv_class_id`),
  KEY `inv_category_id` (`inv_category_id`),
  KEY `inv_type_id` (`inv_type_id`),
  KEY `inv_inventory_ibfk_3` (`inv_group_id`),
  CONSTRAINT `inv_inventory_ibfk_1` FOREIGN KEY (`inv_class_id`) REFERENCES `inv_ref_class` (`class_id`),
  CONSTRAINT `inv_inventory_ibfk_2` FOREIGN KEY (`inv_category_id`) REFERENCES `inv_ref_category` (`category_id`),
  CONSTRAINT `inv_inventory_ibfk_3` FOREIGN KEY (`inv_group_id`) REFERENCES `inv_ref_group` (`group_id`),
  CONSTRAINT `inv_inventory_ibfk_4` FOREIGN KEY (`inv_type_id`) REFERENCES `inv_ref_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

/*Data for the table `inv_inventory` */

insert  into `inv_inventory`(`inv_id`,`inv_number`,`inv_name`,`inv_date_procurement`,`inv_date_expired`,`inv_class_id`,`inv_category_id`,`inv_group_id`,`inv_type_id`,`inv_store_place_in_use`,`inv_store_place_after_use`,`inv_desc`) values (93,'16.08.1.3.3.1.0','Meja Guru','2016-08-01','2016-09-10',1,3,3,1,0,0,'ceking'),(94,'16.08.1.3.3.1.1','Meja Guru','2016-08-01','2016-09-10',1,3,3,1,0,0,'ceking'),(125,'16.08.2.1.6.25.1','Ruang Lab. IPA ','2016-08-01','2016-09-10',2,1,6,25,0,0,'ceking'),(126,'16.08.2.1.6.25.2','Ruang Lab. IPA ','2016-08-01','2016-09-10',2,1,6,25,0,0,'ceking'),(127,'16.08.1.3.3.1.2','Meja Guru','2016-08-02','2016-09-10',1,3,3,1,125,0,'ceking lagi ah'),(128,'16.08.1.3.3.1.3','Meja Guru','2016-08-02','2016-09-10',1,3,3,1,125,0,'ceking lagi ah'),(129,'16.08.1.3.3.1.4','Meja Guru','2016-08-02','2016-09-10',1,3,3,1,125,0,'ceking lagi ah');

/*Table structure for table `inv_ref_category` */

DROP TABLE IF EXISTS `inv_ref_category`;

CREATE TABLE `inv_ref_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` char(3) DEFAULT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `category_class_id` int(11) DEFAULT NULL,
  `is_container` tinyint(1) DEFAULT NULL COMMENT '0 = bukan bangunan, 1 = bangunan',
  `category_desc` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_category` */

insert  into `inv_ref_category`(`category_id`,`category_code`,`category_name`,`category_class_id`,`is_container`,`category_desc`) values (1,'BGN','BANGUNAN',2,1,NULL),(2,'ALT','TANAH',2,0,NULL),(3,'MOP','MEUBELAIR',1,0,NULL),(4,'MBL','KENDARAAN',1,1,NULL);

/*Table structure for table `inv_ref_class` */

DROP TABLE IF EXISTS `inv_ref_class`;

CREATE TABLE `inv_ref_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(200) DEFAULT NULL,
  `class_desc` text,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_class` */

insert  into `inv_ref_class`(`class_id`,`class_name`,`class_desc`) values (1,'BARANG BERGERAK',NULL),(2,'BARANG TIDAK BERGERAK','');

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

/*Table structure for table `inv_ref_group` */

DROP TABLE IF EXISTS `inv_ref_group`;

CREATE TABLE `inv_ref_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) DEFAULT NULL,
  `group_category_id` int(11) DEFAULT NULL,
  `group_desc` text,
  `is_container` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_group` */

insert  into `inv_ref_group`(`group_id`,`group_name`,`group_category_id`,`group_desc`,`is_container`) values (1,'TANAH PERSIL',2,NULL,0),(2,'TANAH NON PERSIL',2,NULL,0),(3,'MEJA',3,NULL,0),(4,'KURSI',3,NULL,0),(5,'MOBIL',4,NULL,1),(6,'RUANG PEMBELAJARAN',1,NULL,1);

/*Table structure for table `inv_ref_type` */

DROP TABLE IF EXISTS `inv_ref_type`;

CREATE TABLE `inv_ref_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` char(3) DEFAULT NULL,
  `type_name` varchar(200) DEFAULT NULL,
  `type_group_id` int(11) DEFAULT NULL,
  `type_desc` text,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_type` */

insert  into `inv_ref_type`(`type_id`,`type_code`,`type_name`,`type_group_id`,`type_desc`) values (1,'','Meja Guru',NULL,''),(2,NULL,'Meja Siswa',4,NULL),(3,'','Kursi Guru',3,'cek'),(4,NULL,'Kursi Siswa',4,NULL),(25,'BGN','Ruang Lab. IPA ',6,''),(26,'BGN','Ruang Lab. Biologi',6,''),(27,'BGN','Ruang Lab. Fisika',6,''),(28,'BGN','Ruang Lab. Kimia',6,''),(29,'BGN','Ruang Lab. Komputer',6,''),(30,'BGN','Ruang Lab. Bahasa',6,''),(39,'BGN','Tempat Olahraga',6,''),(46,'','Kursi Mobil',NULL,'kursi mobil');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
