class CategoryController < ApplicationController
	def index
		#@category = Category.find(params[:id])
		category_id = Integer(params[:id])
		@page 		= 1
		if(params[:page])
			@page = Integer(params[:page])
		end	
		
		@limit = Limit_Per_Page
		offset = (@page - 1)*@limit

		@category 		= Category.find(category_id)
		@products 		= Product.get_products_by_category(category_id, @limit, offset)
		@total_product 	= Product.get_total_products_by_category(category_id)
	end
end
