class OrderItem < ActiveRecord::Base
  belongs_to :order
  self.table_name   = 'd_order_item'
  self.primary_key  = 'order_item_id'

  # def self.get_all_by_order_id (order_id)
  #   select_sql = 'oi.order_item_id, oi.order_id, oi.product_id, p.product_name, oi.quantity, oi.price, oi.total_grand, oi.created_date, c.first_name as customer_first_name, c.last_name as customer_last_name'
  #   join_product_sql  = "INNER JOIN d_product p ON p.product_id = oi.product_id"
  #   join_customer_sql  = "INNER JOIN d_customer c ON c.customer_id = oi.customer_id"
  #   list = self.select(select_sql).from("d_order_item AS oi").joins(join_product_sql + ' ' + join_customer_sql).where('oi.order_id ="'+order_id+'"').order("oi.order_item_id DESC")
  #   return list
  # end

  def self.get_all_by_order_id(id)

    sql = <<-SQL 
        SELECT 
          oi.order_item_id, 
          oi.order_id, 
          oi.product_id, 
          oi.quantity, 
          oi.price, 
          oi.total_grand, 
          oi.created_date,
          p.product_name, 
          un.unit_name,
          cus.first_name as customer_first_name, 
          cus.last_name as customer_last_name
        FROM
          d_order_item AS oi
        INNER JOIN d_product p ON p.product_id = oi.product_id
        INNER JOIN d_customer cus ON cus.customer_id = oi.customer_id
        LEFT JOIN d_unit un ON un.unit_id = p.unit_id
        WHERE oi.order_id = #{id}
    SQL
    return self.find_by_sql(sql) 
  end
end
