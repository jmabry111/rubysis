class ParentsController < ApplicationController
  
  def new
    @parent = Parent.new
  end
  
  def create
    @parent = Parent.new(parent_params)
    
      if @parent.save
        session[:current_parent] = @parent.id
        redirect_to parents_path, notice: 'Parent saved.'
      else
        render action: "new"
      end
  end
  
  def show
    @parent = Parent.find(params[:id])
  end
  
  
  private 
  
  def parent_params
    params.require(:parent).permit(:first_name, :home_phone, :last_name, :address_id, :student_id)
  end
end
