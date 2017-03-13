class CategoryController < ApplicationController

  CONTROLLER_TITLE = "Danh Mục"
  
  #Show list Categories
  def index
    categories  = Category.get_all
    @categories = category_show(0,categories).html_safe;
    @page_title = 'Danh Mục'

    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, active:1}
  end

  #Show form which creating a new Category
  def new
    @page_title     = 'Thêm Danh Mục'
    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, url: '/category'}
    @breadcrumbs[1] = {title: @page_title, active:1}
    @category       = Category.new
  end

  #Create a new Category
  def create
    if Category.add(params)
      flash[:notice] = 'Thành Công!'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Thất Bại!'
      redirect_to :action => 'index'
    end
  end

  #Show form which editing a Category
  def edit
    @id = params[:id]
    @category = Category.find(params[:id])

    @page_title     = 'Cập Nhật Danh Mục'
    @breadcrumbs    = []
    @breadcrumbs[0] = {title: CONTROLLER_TITLE, url: '/category'}
    @breadcrumbs[1] = {title: @page_title, active:1}
  end

  #Update Category data
  def update
    @category = Category.find(params[:id])
    if Category.update(params, @category)
      flash[:notice] = 'Thành Công!'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Thất Bại!'
      redirect_to :action => 'index'
    end
  end

  #Delete a Category
  def delete
    @category = Category.find(params[:id])
    if Category.delete(@category)
      flash[:notice] = 'Thành Công!'
    else
      flash[:error] = 'Thất Bại!'
    end
    redirect_to :action => 'index'
  end

  private
  #Group category by parent and show
  def category_show(parentid, categories, res = '', sep = '')
    categories.each do | category |
         if(category.parent_id == parentid)
            html = <<-EOT 
              <tr>
                <td>#{sep} #{category.category_name}</td>
                <td>#{category.created_last_name} #{category.created_first_name}</td>                         
                <td>#{category.created_date.strftime("%d-%m-%Y %H:%M:%S")}</td>
                <td>#{category.modified_last_name} #{category.modified_first_name}</td>        
                <td>#{category.modified_date.strftime("%d-%m-%Y %H:%M:%S")}</td>
                <td>
                  <a class="btn btn-primary btn-xs" href="/category/#{category.category_id}">
                    <i class="icon-edit"></i>
                  </a>
                  <a data-confirm="Are you sure?" data-method="delete" class="btn btn-bricky btn-xs" href="/category/#{category.category_id}">
                    <i class="glyphicon glyphicon-remove-circle"></i>
                  </a>
                </td>
              </tr>
              <tr>
            EOT
            res += category_show(category.category_id, categories, html, sep + '- - ')
         end
    end
    return res
  end
end
