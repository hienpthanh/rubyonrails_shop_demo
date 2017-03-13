class Unit< ActiveRecord::Base
  self.table_name = 'd_unit'
  self.primary_key = 'unit_id'
  validates :unit_name, presence: true
  def self.add(data)
    unit = self.new
    unit.unit_name  = data[:unit_name]
    unit.created_date   = Time.now
    unit.modified_date  = Time.now
    unit.created_by     = 1
    unit.modified_by    = 1
    return unit.save
  end

  def self.update_data(data,object)

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

 def self.get_units
    sql = <<-SQL 
        SELECT 
          un.unit_id, 
          un.unit_name
        FROM
          d_unit AS un
        WHERE un.del_flg = 0
        ORDER BY un.unit_name ASC
    SQL
    return self.find_by_sql(sql) 
  end
end
