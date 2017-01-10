class Product < ActiveRecord::Base
  self.table_name   = 'd_product'
  self.primary_key  = 'product_id'

 def self.get_products(type, limit = Limit_Product_Homepage, offset = 0)
    select_sql = "p.product_id, p.product_name, p.product_description, p.product_image, p.price, p.price_special, un.unit_name"
    list 	   = self.select(select_sql).from("d_product AS p").joins("INNER JOIN d_unit un ON p.unit_id = un.unit_id").where("p.del_flg = 0 AND p.is_active = 1")
    
    if(type == 'new')
    	list = list.order('p.product_id DESC')    	
    elsif (type == 'hot')
    	list = list.where("p.is_hot = 1")
    elsif (type == 'special')
    	list = list.where("p.price_special > 0 AND  p.price_special <> p.price")
    elsif (type == 'slider')
    	list = list.where("p.is_slider = 1")
    end	

    list = list.limit(limit).offset(offset)
    return list
  end

def self.get_products_by_category(category_id, limit = Limit_Per_Page, offset = 0)
    select_sql = "p.product_id, p.product_name, p.product_description, p.product_image, p.price, p.price_special, un.unit_name"
    list 	   = self.select(select_sql).from("d_product AS p").joins("INNER JOIN d_unit un ON p.unit_id = un.unit_id").where("p.del_flg = 0 AND p.is_active = 1")
    
    if(category_id > 0)
    	list = list.where("p.category_id = ?", category_id)
   	end

    list = list.order('p.product_id DESC')
    list = list.limit(limit).offset(offset)
    return list
  end


  def self.get_new_product(limit = Limit_Product_Homepage)
  	categories = Category.get_all
  	products = []
  	products[0] = self.get_products_by_category(0, limit)
  	categories.each do |category|  		
  		cat_id = category.category_id
  		products[cat_id] = self.get_products_by_category(cat_id, limit)
  		# abort products.inspect
  	end
  	# abort products.inspect
  	return products;
  end
end
