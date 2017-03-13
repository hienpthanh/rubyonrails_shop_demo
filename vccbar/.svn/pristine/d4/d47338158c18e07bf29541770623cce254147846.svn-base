class WarehouseController < ApplicationController
	CONTROLLER_TITLE = "Quản Lý Kho"
  
  #Show list 
  def index

  	@params = params
  	@page   = 1

  	if(!params[:page].nil?)
  		@page = Integer(params[:page])
  	end

    @warehouse_imports = WarehouseImport.get_all(@params, @page = 1)
    @page_title = 'Danh Sách Phiếu Nhập Kho'

    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, active:1}
  end

  def show
    @id = params[:id]
    @import = WarehouseImport.get_import(@id)
    
    # abort @import[0].inspect
    begin
      @import = WarehouseImport.get_import(@id)
      @import = @import[0]
    rescue Exception => e
      redirect_to :action => 'index'
    end     

    begin
      @warehouse_import_items = WarehouseImportItem.get_all_by_import_id(@id)
    rescue Exception => e
      @warehouse_import_items = []
    end 
  end    

  def inventory
  	
  end

  #Show form which importing
  def new
    @page_title     = 'Thêm Phiếu Nhập Kho'
    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, url: '/warehouse'}
    @breadcrumbs[1] = {title: @page_title, active:1}

    @import         = WarehouseImport.new
    @suppliers      = Supplier.get_suppliers
    @products       = Product.get_products

    unit_pair       = {}
    units           = Unit.get_units
    units.each do | unit |
      unit_pair[unit[:unit_id]] = unit[:unit_name]
    end 
    @units_json = unit_pair.to_json
    @warehouse_import_items = []
  end

  #Import
  def create
    if WarehouseImport.add(params)
      flash[:notice] = 'Thành Công!'
      redirect_to :action => 'index'
    else
      flash[:error]  = 'Thất Bại!'
      redirect_to :action => 'index'
    end
  end

  #Show form which editing
  def edit
    @id               = params[:id]
    begin
      @import         = WarehouseImport.find(@id)
    rescue Exception => e
      flash[:error] = 'ID Không Tồn Tại!'
      redirect_to :action => 'index'
    end     

    begin
      @warehouse_import_items = WarehouseImportItem.get_all_by_import_id(@id)
    rescue Exception => e
      @warehouse_import_items = []
    end 

    @suppliers = Supplier.get_suppliers
    @products  = Product.get_products

    unit_pair      = {}
    units          = Unit.get_units
    units.each do | unit |
      unit_pair[unit[:unit_id]] = unit[:unit_name]
    end 
    @units_json = unit_pair.to_json

    @page_title     = 'Cập Nhật Phiếu Nhập Kho'
    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, url: '/warehouse'}
    @breadcrumbs[1] = {title: @page_title, active:1}
  end

  #Update order
  def update
    @import = WarehouseImport.find(params[:id])
    if WarehouseImport.update(@import, params)
      flash[:notice] = 'Thành Công!'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Thất Bại!'
      redirect_to :action => 'index'
    end
  end

  def import
    @id = params[:id]
    begin
      @import = WarehouseImport.find(@id)
    rescue Exception => e
      flash[:error] = 'ID Không Tồn Tại!'
      redirect_to :action => 'index'
    end     

    if(@import[:import_stock] == true || @import[:import_stock] == 1)
        flash[:error] = 'Phiếu Đã Nhập Kho'
        redirect_to :action => 'index'
    else
      rs = WarehouseImport.import(@import)
      if(rs)
        flash[:notice] = 'Nhập Kho Thành Công'
        redirect_to :action => 'index'
      else
        flash[:error] = 'Nhập Kho Thất Bại'
        redirect_to :action => 'index'
      end
    end
  end

  #Delete a order
  def delete
    @WarehouseImport = WarehouseImport.find(params[:id])
    if WarehouseImport.delete(@WarehouseImport)
      flash[:notice] = 'Thành Công!'
    else
      flash[:error] = 'Thất Bại!'
    end
    redirect_to :action => 'index'
  end
end
