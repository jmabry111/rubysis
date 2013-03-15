class ParentsController < ApplicationController
  
  def new
    @parent = Parent.new
  end
  
  def create
    @parent = Parent.new(parent_params)
    @parent.save
  end
  
  def show
    @parent = Parent.find(params[:id])
  end
  
  
  private 
  
  def parent_params
    params.require(:parent).permit(:first_name, :home_phone, :last_name, :address_id, :student_id)
  end
end
