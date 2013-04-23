class SchoolsController < ApplicationController
  
  def index  
      @schools = School.all
      respond_to do |format|  
        format.html 
        format.json { render :json => @schools.to_json }
        end
  end
  
  
  private
  

  def school_params
    params.require(:school).permit(:name, :address, :city, :state, :zip, :site)
  end
end