/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : db_city

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-07-11 16:26:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `publishDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `command` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `content` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `pname` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `page` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock_remainder
-- ----------------------------
DROP TABLE IF EXISTS `stock_remainder`;
CREATE TABLE `stock_remainder` (
  `sr_id` int(10) NOT NULL AUTO_INCREMENT,
  `sr_number` int(10) NOT NULL,
  `sr_stock_id` int(10) NOT NULL,
  `sr_update` datetime DEFAULT NULL,
  `sr_remarks` varchar(50) DEFAULT NULL,
  `isdele` int(5) DEFAULT NULL,
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock_sell
-- ----------------------------
DROP TABLE IF EXISTS `stock_sell`;
CREATE TABLE `stock_sell` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT,
  `s_number` int(10) NOT NULL,
  `s_price` int(10) NOT NULL,
  `s_stock_id` int(10) NOT NULL,
  `s_update` datetime DEFAULT NULL,
  `s_remarks` varchar(50) DEFAULT NULL,
  `isdele` int(5) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
