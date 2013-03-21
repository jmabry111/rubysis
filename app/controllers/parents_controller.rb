class ParentsController < ApplicationController
  
  def new
    @parent = Parent.new
  end
  
  def create
    @parent = current_student.parents.build(parent_params)
    if @parent.save
      flash[:success] = "Parent entered."
      redirect_to student_path(current_student)
    else
      render 'new'
    end
  end
  
  def show
    @parent = Parent.find(params[:id])
  end
  
  
  private 
  
  def parent_params
    params.require(:parent).permit(:first_name, :home_phone, :last_name, :parent_id, :student_id)
  end
end
