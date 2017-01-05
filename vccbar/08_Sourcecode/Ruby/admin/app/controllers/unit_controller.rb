class UnitController < ApplicationController
  def index
    @units = Unit.get_all
    @page_title = 'Unit'
  end
  def show
    @unit = Unit.find(params[:id])
  end
  def new
    @unit = Unit.new
  end
  def create
    if Unit.add(unit_params)
      flash[:notice] = 'Created'
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
    if Unit.update(unit_params, @unit)
      flash[:notice] = 'Updated'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Failed!'
      render('edit')
    end
  end
  def delete
    @unit = Unit.find(params[:id])
    if Unit.delete(@unit)
      flash[:notice] = 'Deleted!'
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

