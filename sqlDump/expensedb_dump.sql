/*
SQLyog Trial
MySQL - 5.7.16-log : Database - expensedb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expensedb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `expensedb`;

/*Table structure for table `category_info` */

CREATE TABLE `category_info` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `cname` varchar(15) NOT NULL,
  `ctype` varchar(10) NOT NULL,
  `cremark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `category_info` */

insert  into `category_info`(`cid`,`cname`,`ctype`,`cremark`) values 
(5,'SALARY','income','Office Monthly Salary'),
(6,'HOME','income','Money given by home'),
(7,'PETROL','expense','Petrol Expense'),
(8,'TEA','expense','Tea Expense'),
(9,'LUNCH','expense','Lunch Expense'),
(10,'DINNER','expense','Dinner Expense'),
(11,'GENERAL','expense','General Expense'),
(12,'RENT','expense','Room Rent'),
(13,'MOVIE','expense','Movie Expense');

/*Table structure for table `expense_info` */

CREATE TABLE `expense_info` (
  `eid` int(5) NOT NULL AUTO_INCREMENT,
  `cid` int(3) DEFAULT NULL,
  `edate` date NOT NULL,
  `eamount` int(10) NOT NULL,
  `epayby` varchar(5) NOT NULL,
  `eremark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category_info` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `expense_info` */

insert  into `expense_info`(`eid`,`cid`,`edate`,`eamount`,`epayby`,`eremark`) values 
(2,9,'2018-02-23',80,'cash','Lunch Exp'),
(3,7,'2018-02-23',100,'cash','Petrol Exp'),
(4,10,'2018-02-23',120,'cash','Dinner'),
(5,13,'2018-02-23',300,'bank','Movie'),
(6,9,'2018-02-24',100,'bank','Lunch'),
(7,10,'2018-02-24',150,'bank','Dinner'),
(8,9,'2018-02-25',90,'cash','Lunch'),
(9,8,'2018-02-25',20,'cash',''),
(10,12,'2018-03-01',2000,'cash','');

/*Table structure for table `income_info` */

CREATE TABLE `income_info` (
  `iid` int(5) NOT NULL AUTO_INCREMENT,
  `cid` int(5) NOT NULL,
  `idate` date NOT NULL,
  `iamount` int(10) NOT NULL,
  `iremark` varchar(100) DEFAULT NULL,
  `ipayby` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `cid` (`cid`),
  CONSTRAINT `income_info_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category_info` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `income_info` */

insert  into `income_info`(`iid`,`cid`,`idate`,`iamount`,`iremark`,`ipayby`) values 
(5,6,'2018-02-15',15000,'Cash From Home','cash'),
(6,5,'2018-02-01',30000,'Salary In Bank Account','bank');

/*Table structure for table `user_master` */

CREATE TABLE `user_master` (
  `uid` int(5) NOT NULL,
  `uname` varchar(10) NOT NULL,
  `ubank` int(10) NOT NULL,
  `ucash` int(10) NOT NULL,
  `upwd` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_master` */

insert  into `user_master`(`uid`,`uname`,`ubank`,`ucash`,`upwd`) values 
(1,'root',29700,12680,'root');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
