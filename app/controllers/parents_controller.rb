class ParentsController < ApplicationController
  
  def new
#    @student = Student.find(params[:student_id])
    @parent = Parent.new
    @parent.addresses.build
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
  
  def edit
    @parent = Parent.find(params[:id])
  end
  
  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes!(parent_params)
      flash[:success] = "Parent information updated."
      redirect_to student_path(session[:current_student])
    else
      render 'edit'
    end
  end
  
  
  private 
  
  def parent_params
    params.require(:parent).permit(:first_name, :home_phone, :work_phone, :last_name, :parent_id, :student_id, :email)
  end
end
