ALTER TABLE `d_order_address`
MODIFY COLUMN `order_address_id`  int(11) NOT NULL AUTO_INCREMENT FIRST ;

ALTER TABLE `d_order_item`
MODIFY COLUMN `quantity`  int(11) NOT NULL DEFAULT 0 AFTER `product_id`