class SchoolsController < ApplicationController
  
  def index
#      if params[:term]
#        @schools = School.where('site LIKE ?', "#{params[:term]}%")
#      else
        @schools = School.all
#      end

      respond_to do |format|  
        format.html # index.html.erb  
    # Here is where you can specify how to handle the request for "/schools.json"
        format.json { render :json => @schools.to_json }
        end
  end
  
  
  private
  

  def school_params
    params.require(:school).permit(:name, :address, :city, :state, :zip, :site)
  end
end