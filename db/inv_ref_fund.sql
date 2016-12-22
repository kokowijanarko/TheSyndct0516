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
/*Table structure for table `inv_ref_fund` */

USE `db_irna`;

DROP TABLE IF EXISTS `inv_ref_fund`;

CREATE TABLE `inv_ref_fund` (
  `fund_id` int(11) NOT NULL AUTO_INCREMENT,
  `fund_name` varchar(200) DEFAULT NULL,
  `fund_desc` text,
  `insert_user_id` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) DEFAULT NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`fund_id`),
  KEY `insert_user` (`insert_user_id`),
  KEY `update_user` (`update_user_id`),
  CONSTRAINT `inv_ref_fund_ibfk_1` FOREIGN KEY (`insert_user_id`) REFERENCES `dev_user` (`user_id`),
  CONSTRAINT `inv_ref_fund_ibfk_2` FOREIGN KEY (`update_user_id`) REFERENCES `dev_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `inv_ref_fund` */

insert  into `inv_ref_fund`(`fund_id`,`fund_name`,`fund_desc`,`insert_user_id`,`insert_timestamp`,`update_user_id`,`update_timestamp`) values (1,'Dinas Pendidikan','ceking',1,'2016-09-14 01:00:47',NULL,'0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
