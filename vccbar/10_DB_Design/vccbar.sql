CREATE TABLE `d_category` (
`category_id` int(11) NOT NULL AUTO_INCREMENT,
`category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`del_flg` tinyint(1) NOT NULL DEFAULT 0,
`created_date` datetime NOT NULL,
`modified_date` datetime NOT NULL,
`created_by` int(11) NOT NULL,
`modified_by` int(11) NOT NULL,
PRIMARY KEY (`category_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11;

CREATE TABLE `d_customer` (
`customer_id` int(11) NOT NULL AUTO_INCREMENT,
`username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`birthday` date NULL DEFAULT NULL,
`email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`del_flg` tinyint(1) NOT NULL DEFAULT 0,
`created_date` datetime NOT NULL,
`modified_date` datetime NOT NULL,
`del_date` datetime NULL DEFAULT NULL,
`del_by` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`customer_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `d_import` (
`import_id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`date` date NOT NULL,
`total_grand` decimal(10,0) NOT NULL DEFAULT 0,
`import_stock` tinyint(1) NOT NULL DEFAULT 0,
`supplier_id` int(11) NOT NULL,
`created_date` datetime NOT NULL,
`modified_date` datetime NOT NULL,
`created_by` int(11) NOT NULL,
`modified_by` int(11) NOT NULL,
PRIMARY KEY (`import_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `d_import_item` (
`import_item_id` int(11) NOT NULL AUTO_INCREMENT,
`import_id` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`price` decimal(10,0) NOT NULL DEFAULT 0,
`quantity` int(11) NOT NULL DEFAULT 0,
`total_grand` decimal(10,0) NOT NULL,
`created_date` datetime NOT NULL,
PRIMARY KEY (`import_item_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `d_order` (
`order_id` int(11) NOT NULL AUTO_INCREMENT,
`customer_id` int(11) NOT NULL,
`customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`customer_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`customer_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`coupon_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`total_price` decimal(10,0) NOT NULL DEFAULT 0,
`discount` decimal(10,0) NOT NULL DEFAULT 0,
`total_grand` decimal(10,0) NOT NULL DEFAULT 0,
`status` tinyint(1) NOT NULL DEFAULT 1,
`created_date` datetime NOT NULL,
`modified_date` datetime NULL DEFAULT NULL,
`modified_by` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`order_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `d_order_item` (
`order_item_id` int(11) NOT NULL AUTO_INCREMENT,
`order_id` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`quantity` tinyint(1) NOT NULL DEFAULT 0,
`price` decimal(10,0) NOT NULL DEFAULT 0,
`total_grand` decimal(10,0) NOT NULL DEFAULT 0,
`customer_id` int(11) NOT NULL,
`created_date` datetime NOT NULL,
PRIMARY KEY (`order_item_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `d_product` (
`product_id` int(11) NOT NULL AUTO_INCREMENT,
`category_id` int(11) NOT NULL,
`product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`product_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`product_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`price` decimal(10,0) NOT NULL DEFAULT 0,
`price_special` decimal(10,0) NOT NULL DEFAULT 0,
`in_stock` tinyint(4) NOT NULL DEFAULT 0,
`is_active` tinyint(1) NOT NULL DEFAULT 1,
`unit_id` tinyint(1) NOT NULL,
`del_flg` tinyint(1) NOT NULL DEFAULT 0,
`created_date` datetime NOT NULL,
`modified_date` datetime NOT NULL,
`created_by` int(11) NOT NULL,
`modified_by` int(11) NOT NULL,
PRIMARY KEY (`product_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `d_supplier` (
`supplier_id` int(11) NOT NULL AUTO_INCREMENT,
`supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`del_flg` tinyint(1) NOT NULL DEFAULT 0,
`created_date` datetime NOT NULL,
`modified_date` datetime NOT NULL,
`created_by` int(11) NOT NULL,
`modified_by` int(11) NOT NULL,
PRIMARY KEY (`supplier_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `d_unit` (
`unit_id` int(11) NOT NULL AUTO_INCREMENT,
`unit_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`del_flg` tinyint(1) NOT NULL DEFAULT 0,
`created_date` datetime NOT NULL,
`modified_date` datetime NOT NULL,
`created_by` int(11) NOT NULL,
`modified_by` int(11) NOT NULL,
PRIMARY KEY (`unit_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6;

CREATE TABLE `schema_migrations` (
`version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
UNIQUE INDEX `unique_schema_migrations` (`version`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

