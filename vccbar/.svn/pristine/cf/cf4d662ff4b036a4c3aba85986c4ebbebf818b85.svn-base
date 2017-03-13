ALTER TABLE `d_import` RENAME `d_warehouse_import`;
ALTER TABLE `d_import_item` RENAME `d_warehouse_import_item`;

ALTER TABLE `d_warehouse_import`
ADD COLUMN `del_flg`  tinyint(1) NOT NULL DEFAULT 0 AFTER `supplier_id`,
MODIFY COLUMN `total_grand`  decimal(10,0) NOT NULL DEFAULT 0 AFTER `code`,
MODIFY COLUMN `supplier_id`  int(11) NOT NULL AFTER `total_grand`,
CHANGE COLUMN `date` `note`  text NULL AFTER `supplier_id`,
ADD COLUMN `date`  date NOT NULL AFTER `supplier_id`;

ALTER TABLE `d_warehouse_import_item`
ADD COLUMN `note`  text NULL AFTER `total_grand`;

ALTER TABLE `d_warehouse_import_item`
ADD COLUMN `del_flg`  tinyint(1) NOT NULL DEFAULT 0 AFTER `note`;

ALTER TABLE `d_product`
MODIFY COLUMN `unit_id`  int(11) NOT NULL AFTER `is_slider`;

ALTER TABLE `d_product`
MODIFY COLUMN `in_stock`  int(11) NOT NULL DEFAULT 0 AFTER `price_special`;