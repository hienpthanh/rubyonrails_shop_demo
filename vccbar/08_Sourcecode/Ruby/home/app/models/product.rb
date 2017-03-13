class Product < ActiveRecord::Base
  self.table_name   = 'd_product'
  self.primary_key  = 'product_id'

 def self.get_products(type, limit = Limit_Product_Homepage, offset = 0)
    select_sql = "p.product_id, p.product_name, p.product_description, p.product_image, p.price, p.price_special, p.is_hot, un.unit_name"
    list       = self.select(select_sql).from("d_product AS p")
    list       = list.joins("INNER JOIN d_unit un ON p.unit_id = un.unit_id")
    list       = list.where("p.del_flg = 0 AND p.is_active = 1")

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
    select_sql = "p.product_id, p.product_name, p.product_description, p.product_image, p.price, p.price_special, p.is_hot, un.unit_name"
    list 	     = self.select(select_sql).from("d_product AS p")
    list       = list.joins("INNER JOIN d_unit un ON p.unit_id = un.unit_id")
    list       = list.where("p.del_flg = 0 AND p.is_active = 1")

    if(category_id > 0)
    	list = list.where("p.category_id = ?", category_id)
   	end

    list = list.order('p.product_id DESC')
    list = list.limit(limit).offset(offset)
    return list
  end

  def self.get_total_products_by_category(category_id)
    select_sql = "COUNT(*) AS total"
    list       = self.from("d_product AS p")
    list       = list.joins("INNER JOIN d_unit un ON p.unit_id = un.unit_id")
    list       = list.where("p.del_flg = 0 AND p.is_active = 1 AND p.category_id = ?", category_id).count
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

  def self.get_related_products(category_id, product_id)

    if (category_id.nil? || product_id.nil? || category_id == 0)
      return []      
    end

    sql = <<-SQL 
      SELECT 
        p.product_id, 
        p.product_name, 
        p.product_description, 
        p.product_image, 
        p.price, 
        p.price_special, 
        p.is_hot, 
        un.unit_name
      FROM d_product AS p
      INNER JOIN d_unit un ON p.unit_id = un.unit_id
      WHERE 
        p.del_flg = 0 
        AND p.is_active = 1 
        AND p.category_id = '#{category_id}' 
        AND p.product_id <> '#{product_id}'
    SQL
    return self.find_by_sql(sql)  
  end
end
