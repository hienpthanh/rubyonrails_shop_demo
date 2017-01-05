class Unit < ActiveRecord::Base
  self.table_name = 'd_unit'
  self.primary_key = 'unit_id'

  def self.get_all
    list = self.where(:del_flg => 0)
    return list
  end

  def self.add(data)
    unit = self.new
    unit.unit_name  = data[:unit_name]
    unit.created_date   = Time.now
    unit.modified_date  = Time.now
    unit.created_by     = 1
    unit.modified_by    = 1
    return unit.save
  end

  def self.update(data, object)

    data[:modified_date]  = Time.now
    data[:modified_by]    = 1
    return object.update_attributes(data)
  end

  def self.delete(object)

    data                  = {}
    data[:del_flg]        = 1
    data[:modified_date]  = Time.now
    data[:modified_by]    = 1
    return object.update_attributes(data)
  end

  #validates :unit_name, presence: true
end
