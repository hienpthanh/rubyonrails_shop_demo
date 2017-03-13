class OrderitemsController < ApplicationController
  def index
    @order = Order.find(params[:order_id])
    @orderitems = Orderitem.get_all_by_order_id(params[:order_id])
  end
end
