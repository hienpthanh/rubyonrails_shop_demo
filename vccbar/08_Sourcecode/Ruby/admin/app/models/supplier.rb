class Supplier< ActiveRecord::Base
  self.table_name = 'd_supplier'
  self.primary_key = 'supplier_id'
  validates :supplier_name, presence: true
  def self.add(data)
    supplier = self.new
    supplier.supplier_name  = data[:supplier_name]
    supplier.created_date   = Time.now
    supplier.modified_date  = Time.now
    supplier.created_by     = 1
    supplier.modified_by    = 1
    return supplier.save
  end

  def self.update_data(data, object)

    data[:modified_date]  = Time.now
    data[:modified_by]    = 1
    return object.update_attributes(data)
  end
  def self.remove_data(object)
    object.del_flg = 1
    object.modified_date = Time.now
    object.modified_by = 1
    return object.save
  end
end
