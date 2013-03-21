class SchoolsController < ApplicationController
  
  
  private
  

  def school_params
    params.require(:school).permit(:name, :address, :city, :state, :zip)
  end
end