/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : vccbar

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-01-12 13:48:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `d_category`
-- ----------------------------
DROP TABLE IF EXISTS `d_category`;
CREATE TABLE `d_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_customer`
-- ----------------------------
DROP TABLE IF EXISTS `d_customer`;
CREATE TABLE `d_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `del_date` datetime DEFAULT NULL,
  `del_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_import`
-- ----------------------------
DROP TABLE IF EXISTS `d_import`;
CREATE TABLE `d_import` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `total_grand` decimal(10,0) NOT NULL DEFAULT '0',
  `import_stock` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_import
-- ----------------------------

-- ----------------------------
-- Table structure for `d_import_item`
-- ----------------------------
DROP TABLE IF EXISTS `d_import_item`;
CREATE TABLE `d_import_item` (
  `import_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `total_grand` decimal(10,0) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`import_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_order`
-- ----------------------------
DROP TABLE IF EXISTS `d_order`;
CREATE TABLE `d_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `total_price` decimal(10,0) NOT NULL DEFAULT '0',
  `discount` decimal(10,0) NOT NULL DEFAULT '0',
  `total_grand` decimal(10,0) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `d_order_item`;
CREATE TABLE `d_order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `total_grand` decimal(10,0) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_product`
-- ----------------------------
DROP TABLE IF EXISTS `d_product`;
CREATE TABLE `d_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_description` text,
  `product_image` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `price_special` decimal(10,0) NOT NULL DEFAULT '0',
  `in_stock` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0',
  `is_slider` tinyint(1) NOT NULL DEFAULT '0',
  `unit_id` tinyint(1) NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `d_supplier`;
CREATE TABLE `d_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_unit`
-- ----------------------------
DROP TABLE IF EXISTS `d_unit`;
CREATE TABLE `d_unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `d_user`
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` tinyint(1) DEFAULT NULL,
  `modified_by` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', 'Admin', '2017-01-06 08:50:18', '2017-01-06 08:50:20', null, null);

-- ----------------------------
-- Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO `schema_migrations` VALUES ('1');
