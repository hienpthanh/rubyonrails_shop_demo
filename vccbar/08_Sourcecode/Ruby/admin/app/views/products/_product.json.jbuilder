json.extract! product, :id, :category_id, :product_name, :product_code, :product_description,:product_image, :price, :price_special, :is_active, :unit_id,:is_hot,:is_slider
json.url product_url(product, format: :json)
