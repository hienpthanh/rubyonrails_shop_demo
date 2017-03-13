class AjaxController < ApplicationController
  
  def get_district
     province_id = params[:province_id]
     @districts = District.where('province_id = ?', province_id).order('name ASC')
     render :layout => false
  end

  def get_ward
    district_id = params[:district_id]
    @wards = Ward.where('district_id = ?', district_id).order('name ASC')
    render :layout => false
  end
end
