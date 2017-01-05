class CategoryController < ApplicationController
  def index
    @categories = Category.get_all
    @page_title = 'Category'
  end
  def show
    @category = Category.find(params[:id])
  end
  def new
    @category = Category.new
  end
  def create
    if Category.add(params)
      flash[:notice] = 'Created'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Failed!'
      render('new')
    end
  end
  def edit
    @id = params[:id]
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if Category.update(params, @category)
      flash[:notice] = 'Updated'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Failed!'
      render('edit')
    end
  end
  def delete
    @category = Category.find(params[:id])
    if Unit.delete(@category)
      flash[:notice] = 'Deleted!'
    else
      flash[:error] = 'Failed!'
    end
    redirect_to :action => 'index'
  end

  private
  # def category_params
  #   params.require(:category_name)
  # end
end
