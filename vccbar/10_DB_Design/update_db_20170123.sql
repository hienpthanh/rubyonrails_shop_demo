ALTER TABLE `d_order`
DROP COLUMN `customer_name`,
DROP COLUMN `customer_email`,
DROP COLUMN `customer_phone`;

ALTER TABLE `d_order_address`
DROP COLUMN `del_flg`;


ALTER TABLE `d_order_address`
CHANGE COLUMN `customer_name` `customer_last_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `order_id`,
ADD COLUMN `customer_first_name`  varchar(255) NOT NULL AFTER `order_id`;
