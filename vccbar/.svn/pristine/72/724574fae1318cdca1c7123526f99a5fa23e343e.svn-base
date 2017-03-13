class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :changestatus

  CONTROLLER_TITLE = "Quản Lý Đơn Hàng"

  def index
    @orders = Order.get_all
    @page_title = 'Orders'
  end

  def changestatus
    @order = Order.find(params[:order_id])
    if Order.change_status(@order)
      flash[:notice] = 'Changed status!'
    else
      flash[:error] = 'Failed!'
    end
    redirect_to :action => 'index'
  end

  def new
    @page_title     = 'Đặt Hàng'
    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, url: '/orders'}
    @breadcrumbs[1] = {title: @page_title, active:1}

    @order          = Order.new
    @products       = Product.get_products
    @provinces      = Province.order('name ASC')
    @districts      = [] 
    @wards          = []  

    unit_pair       = {}
    units           = Unit.get_units
    units.each do | unit |
      unit_pair[unit[:unit_id]] = unit[:unit_name]
    end 
    @units_json = unit_pair.to_json
    @items = []

  end

  def create
    if Order.add(params)
      flash[:notice] = 'Thành Công!'
      redirect_to :action => 'index'
    else
      flash[:error]  = 'Thất Bại!'
      redirect_to :action => 'index'
    end
  end

  def edit

    @id = params[:id]   
    begin
      @order = Order.get_order(@id)   
      @order = @order[0]   
    rescue Exception => e
      flash[:error] = 'ID Không Tồn Tại!'
      redirect_to :action => 'index'
    end     

    begin
      @items = OrderItem.get_all_by_order_id(@id)
    rescue Exception => e
      @items = []
    end 
    
    @products       = Product.get_products
    @provinces      = Province.order('name ASC')   
    @districts      = District.where(province_id: @order[:province_id]).order('name ASC')   
    @wards          = Ward.where(district_id: @order[:district_id]).order('name ASC')   

    unit_pair       = {}
    units           = Unit.get_units
    units.each do | unit |
      unit_pair[unit[:unit_id]] = unit[:unit_name]
    end 
    @units_json = unit_pair.to_json

    @page_title     = 'Cập Nhật Đơn Hàng'
    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, url: '/orders'}
    @breadcrumbs[1] = {title: @page_title, active:1}
  end

  #Update order
  def update
    @order = Order.find(params[:id])
    if Order.update(@order, params)
      flash[:notice] = 'Thành Công!'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Thất Bại!'
      redirect_to :action => 'index'
    end
  end

end
