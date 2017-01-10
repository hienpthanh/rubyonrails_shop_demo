class IndexController < ApplicationController
  def index
  	@slider_product  = Product.get_products('slider',Limit_Product_Homepage)
  	@new_product 	 = Product.get_new_product(Limit_Product_Homepage)
  	@hot_product 	 = Product.get_products('hot',Limit_Product_Homepage)
  	@special_product = Product.get_products('special', Limit_Product_Homepage)
  end
end
