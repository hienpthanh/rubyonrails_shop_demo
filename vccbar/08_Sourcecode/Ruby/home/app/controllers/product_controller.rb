class ProductController < ApplicationController
	def index
		product_id = Integer(params[:id])

		begin
			@product_detail 	= Product.find(product_id)			
		rescue Exception => e
			#redirect_to :controller => 'index', :action => 'index'
		end

		unless @product_detail.nil?
			@related_products 	= Product.get_related_products(@product_detail.category_id, product_id)
		end
	end
end
