class Category < ActiveRecord::Base
  self.table_name = 'd_category'
  self.primary_key = 'category_id'


  def self.get_all
    list = self.where(:del_flg => 0)
    return list
  end

  def self.add(data)
    category = self.new
    category.category_name  = data[:category_name]
    category.created_date   = Time.now
    category.modified_date  = Time.now
    category.created_by     = 1
    category.modified_by    = 1
    return category.save
  end

  def self.update(data, object)
    data_update = {}
    data_update[:category_name]  = data[:category_name]
    data_update[:modified_date]  = Time.now
    data_update[:modified_by]    = 1
    return object.update_attributes(data_update)
  end

  def self.delete(object)

    data                  = {}
    data[:del_flg]        = 1
    data[:modified_date]  = Time.now
    data[:modified_by]    = 1
    return object.update_attributes(data)
  end

  validates :category_name, presence: true
end
