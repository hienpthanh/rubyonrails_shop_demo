ALTER TABLE `d_warehouse_import`
MODIFY COLUMN `title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `import_id`;

