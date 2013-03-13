class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:applicant])
    @school = [School.list].flatten
    
      if @student.save
        session[:current_student] = @student.id
        redirect_to students_path, notice: 'Information was successfully submitted.'
      else
        render action: "new"
      end
  end
  
  def index
    @students = Student.find(params[:id])
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
end
