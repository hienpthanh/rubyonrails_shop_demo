class Category < ActiveRecord::Base
	self.table_name   = 'd_category'
	self.primary_key  = 'category_id'

 def self.get_all
		select_sql      = "c.category_id, c.category_name"
		list = self.select(select_sql).from("d_category AS c").where("c.del_flg = 0")
		return list
	end 
end
