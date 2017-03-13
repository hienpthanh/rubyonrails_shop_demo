class Order < ActiveRecord::Base

  self.table_name   = 'd_order'
  self.primary_key  = 'order_id'
  # validates :category_name, presence: true
  has_many :orderitem

  def self.get_all
    select_sql      = "o.order_id, o.customer_name, o.customer_email, o.customer_phone, o.coupon_code, o.total_price, o.discount, o.total_grand, o.status, o.created_date, o.modified_date, u2.first_name as modified_first_name, u2.last_name as modified_last_name"
    join_user2_sql  = "INNER JOIN d_user u2 ON u2.user_id = o.modified_by"
    list = self.select(select_sql).from("d_order AS o").joins(join_user2_sql).order("o.order_id DESC")
    return list
  end

  def self.get_order(id)

    sql = <<-SQL 
        SELECT 
          o.order_id,
          o.note,
          oa.customer_last_name, 
          oa.customer_first_name, 
          oa.customer_email, 
          oa.customer_phone, 
          oa.customer_address, 
          oa.province_id,
          oa.district_id,
          oa.ward_id 
        FROM
          d_order AS o
        INNER JOIN d_customer cus ON cus.customer_id = o.customer_id
        INNER JOIN d_order_address oa ON oa.order_id = o.order_id
        WHERE o.order_id = #{id}
    SQL
    return self.find_by_sql(sql) 
  end

  def self.change_status(object)
    if object.status
      object.status = 0
    else
      object.status = 1
    end
    object.modified_date  = Time.now
    object.modified_by    = 1
    return object.save
  end

  def self.add(data)

    ActiveRecord::Base.transaction do
      begin
        customer = Customer.find_by(phone: data[:customer_phone])
      rescue ActiveRecord::StatementInvalid
        #insert to d_customer
      end
      
      if customer.nil?
        customer = Customer.new
        customer.first_name     = data[:customer_first_name]
        customer.last_name      = data[:customer_last_name]
        customer.username       = data[:customer_phone]
        customer.password       = Digest::MD5.hexdigest('123456')
        customer.email          = data[:customer_email]
        customer.phone          = data[:customer_phone]
        customer.address        = data[:customer_address]
        customer.province_id    = data[:customer_address_province]
        customer.district_id    = data[:customer_address_district]
        customer.ward_id        = data[:customer_address_ward]
        customer.created_date   = Time.now
        customer.modified_date  = Time.now
        customer.save!
        # return false
      end

      customer_id = customer.customer_id

      #insert to d_order
      total = 0
      if(!data[:item].empty?)
        items = data[:item].values
        items.each do | item |
          total += Integer(item[:price].nil? ? 0: item[:price]) * Integer(item[:quantity].nil? ? 0: item[:quantity])
        end
      else
        return raise ActiveRecord::Rollback
      end

      orders                = self.new
      orders.customer_id    = customer_id
      orders.total_price    = total
      orders.total_grand    = total
      orders.note           = data[:note]
      orders.created_date   = Time.now
      orders.modified_date  = Time.now

      begin        
        orders.save
      rescue ActiveRecord::StatementInvalid
        return raise ActiveRecord::Rollback
      end

      order_id = orders.order_id

      #insert to d_order_address
      orderaddress                      = OrderAddress.new
      orderaddress.order_id             = order_id
      orderaddress.customer_first_name  = data[:customer_first_name]
      orderaddress.customer_last_name   = data[:customer_last_name]
      orderaddress.customer_email       = data[:customer_email]
      orderaddress.customer_phone       = data[:customer_phone]
      orderaddress.customer_address     = data[:customer_address]
      orderaddress.province_id          = data[:customer_address_province]
      orderaddress.district_id          = data[:customer_address_district]
      orderaddress.ward_id              = data[:customer_address_ward]
      
              
      begin        
        orderaddress.save
      rescue ActiveRecord::StatementInvalid
        return raise ActiveRecord::Rollback
      end
      

      #insert to d_order_item
      total = 0
      if(!data[:item].empty?)
        items = data[:item].values 
        items.each do | item|

          orderitem                = OrderItem.new
          orderitem.order_id       = order_id
          orderitem.product_id     = item[:product_id]
          orderitem.price          = item[:price]
          orderitem.quantity       = item[:quantity]
          orderitem.total_grand    = Integer(item[:price]) * Integer(item[:quantity])
          orderitem.customer_id    = customer_id
          orderitem.created_date   = Time.now

          begin
            orderitem.save
          rescue ActiveRecord::StatementInvalid
            raise ActiveRecord::Rollback
            return false
          end
          
        end
      else
        return raise ActiveRecord::Rollback
      end
      return order_id
    end    
  end

def self.update(object, data)

    ActiveRecord::Base.transaction do
      begin
        customer = Customer.find_by(phone: data[:customer_phone])
      rescue ActiveRecord::StatementInvalid
        #insert to d_customer
      end

      if customer.nil?
        customer = Customer.new
        customer.first_name     = data[:customer_first_name]
        customer.last_name      = data[:customer_last_name]
        customer.username       = data[:customer_phone]
        customer.password       = Digest::MD5.hexdigest('123456')
        customer.email          = data[:customer_email]
        customer.phone          = data[:customer_phone]
        customer.address        = data[:customer_address]
        customer.province_id    = data[:customer_address_province]
        customer.district_id    = data[:customer_address_district]
        customer.ward_id        = data[:customer_address_ward]
        customer.created_date   = Time.now
        customer.modified_date  = Time.now
        customer.save!
        # return false
      end

      customer_id = customer.customer_id

      #insert to d_order
      total = 0
      if(!data[:item].empty?)
        items = data[:item].values
        items.each do | item |
          total += Integer(item[:price].nil? ? 0: item[:price]) * Integer(item[:quantity].nil? ? 0: item[:quantity])
        end
      else
        return raise ActiveRecord::Rollback
      end

      object.customer_id    = customer_id
      object.total_price    = total
      object.total_grand    = total
      object.note           = data[:note]
      object.created_date   = Time.now
      object.modified_date  = Time.now

      begin        
        object.save
      rescue ActiveRecord::StatementInvalid
        return raise ActiveRecord::Rollback
      end

      order_id = object.order_id

      #insert to d_order_address
      orderaddress                      = OrderAddress.find_by(order_id: order_id)
      orderaddress.customer_first_name  = data[:customer_first_name]
      orderaddress.customer_last_name   = data[:customer_last_name]
      orderaddress.customer_email       = data[:customer_email]
      orderaddress.customer_phone       = data[:customer_phone]
      orderaddress.customer_address     = data[:customer_address]
      orderaddress.province_id          = data[:customer_address_province]
      orderaddress.district_id          = data[:customer_address_district]
      orderaddress.ward_id              = data[:customer_address_ward]
      
              
      begin        
        orderaddress.save
      rescue ActiveRecord::StatementInvalid
        return raise ActiveRecord::Rollback
      end
      

      #insert to d_order_item
      total = 0
      if(!data[:item].empty?)

        OrderItem.delete_all(order_id: object.order_id)

        items = data[:item].values 
        items.each do | item|

          orderitem                = OrderItem.new
          orderitem.order_id       = order_id
          orderitem.product_id     = item[:product_id]
          orderitem.price          = item[:price]
          orderitem.quantity       = item[:quantity]
          orderitem.total_grand    = Integer(item[:price]) * Integer(item[:quantity])
          orderitem.customer_id    = customer_id
          orderitem.created_date   = Time.now

          begin
            orderitem.save
          rescue ActiveRecord::StatementInvalid
            raise ActiveRecord::Rollback
            return false
          end
          
        end
      else
        return raise ActiveRecord::Rollback
      end
      return order_id
    end    
  end

end
