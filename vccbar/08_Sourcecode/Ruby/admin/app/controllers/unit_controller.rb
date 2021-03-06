class UnitController < ApplicationController
  def index
    @unit = Unit.where('del_flg = 0').paginate(:page => params[:page], :per_page => 50)
    @page_title = 'Đơn Vị'
  end

  def new
    @unit = Unit.new
  end
  def create
    if Unit.add(unit_params)
      flash[:error] = 'created'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Failed!'
      render('new')
    end
  end
  def edit
    @id = params[:id]
    @unit = Unit.find(params[:id])
  end
  def update
    @unit = Unit.find(params[:id])
    if Unit.update_data(unit_params, @unit)
      flash[:error] = 'updated'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Failed!'
      render('edit')
    end
  end
  def delete
     @unit = Unit.find(params[:id])
    if Unit.remove_data(@unit)
      flash[:notice] = 'deleted!'
    else
      flash[:error] = 'Failed!'
    end
    redirect_to :action => 'index'
  end

  private
  def unit_params
    params.require(:unit).permit(:unit_name)
  end
end
