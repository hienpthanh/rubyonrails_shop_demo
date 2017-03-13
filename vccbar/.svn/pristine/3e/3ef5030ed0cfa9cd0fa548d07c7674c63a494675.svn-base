class WarehouseImportItem < ActiveRecord::Base
  self.table_name   = 'd_warehouse_import_item'
  self.primary_key  = 'import_item_id'

  def self.get_all_by_import_id(import_id)
    sql = <<-SQL 
        SELECT 
          wii.import_item_id, 
          wii.product_id,
          wii.quantity,
          wii.price,
          wii.total_grand,
          wii.note,
          p.product_name,
          un.unit_name
        FROM
          d_warehouse_import_item AS wii
        INNER JOIN d_product p ON p.product_id = wii.product_id  
        INNER JOIN d_unit un ON un.unit_id = p.unit_id
        WHERE wii.del_flg = 0 AND wii.import_id = #{import_id}      
    SQL
    return self.find_by_sql(sql) 
  end

  def self.add(data)
    wi                = self.new
    wi.title          = data[:title]
    wi.code           = data[:code]
    wi.total_grand    = data[:total_grand]
    wi.supplier_id    = data[:supplier_id]
    wi.created_date   = Time.now
    wi.modified_date  = Time.now
    wi.created_by     = 1
    wi.modified_by    = 1
    return wi.save
  end

  def self.update(object, data)
    object.title          = data[:title]
    object.code           = data[:code]
    object.total_grand    = data[:total_grand]
    object.supplier_id    = data[:supplier_id]
    object.created_date   = Time.now
    object.modified_date  = Time.now
    object.created_by     = 1
    object.modified_by    = 1
    return object.save
  end

  def self.delete(object)
    object.del_flg        = 1
    object.modified_date  = Time.now
    object.modified_by    = 1
    return object.save
  end
end
