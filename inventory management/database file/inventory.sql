/*
SQLyog Ultimate v8.82 
MySQL - 5.1.45-community : Database - inventory
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`inventory` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `inventory`;

/*Table structure for table `addtocart` */

DROP TABLE IF EXISTS `addtocart`;

CREATE TABLE `addtocart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customername` varchar(100) DEFAULT NULL,
  `productname` varchar(100) DEFAULT NULL,
  `measurement` varchar(100) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `quantityrequired` int(10) DEFAULT NULL,
  `finalprice` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addtocart` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`email`,`password`) values ('Admin','admin@gmail.com','123');

/*Table structure for table `manageinventory` */

DROP TABLE IF EXISTS `manageinventory`;

CREATE TABLE `manageinventory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productname` varchar(100) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `measurement` varchar(100) DEFAULT NULL,
  `originalprice` varchar(100) DEFAULT NULL,
  `profit` varchar(100) DEFAULT NULL,
  `sellingprice` varchar(100) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `inventory` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `manageinventory` */

/*Table structure for table `managesupplier` */

DROP TABLE IF EXISTS `managesupplier`;

CREATE TABLE `managesupplier` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `suppliername` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `managesupplier` */

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customername` varchar(100) DEFAULT NULL,
  `productname` varchar(100) DEFAULT NULL,
  `measurement` varchar(100) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `quantityrequired` int(10) DEFAULT NULL,
  `finalprice` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
