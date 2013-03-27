class StudentsController < ApplicationController
  
  
  def new
    @student = Student.new
    @student.addresses.build
    @student.parents.build
  end 
  
  def create
    puts "student params"
    p student_params
    @student = Student.new(student_params)

      if @student.save
        redirect_to student_path(@student.id), notice: 'Information was successfully submitted.'
      else
        render action: "new"
      end
  end
  
  def index
    @students = Student.joins(:school).order(:first_name).page(params[:page])
  end
  
  def show
    @student = find_student_or_redirect
    @addresses = @student.addresses.page(params[:page])
    @parents = @student.parents.page(params[:page])
  end
  
  def edit
    @student = find_student_or_redirect
  end
  
  def update
    @student = find_student_or_redirect
    if @student.update_attributes!(student_params)
      flash[:success] = "Information successfully changed"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end
  

  
  def current_student
   @current_student ||= Student.find(params[:student_id])
  end
  private

  
  def find_student_or_redirect
    student = Student.find_by_id(params[:id])
    unless student
     flash[:notice] = "This student does not exist"
     redirect_to students_path
    end
    student
  end

  def student_params
    puts 'params'
    p params

    params.require(:student).permit(:first_name,
     :middle_name,
     :last_name,
     :home_phone,
     :cell_phone,
     :email,
     :empl,
     :dob,
     :medical_issues,
     :grade_level,
     :gender,
     :school_id,
     :parent_id,
     :address_id,
     addresses_attributes: [:city, :street, :state, :zip, :address_type, :unit], 
     parents_attributes: [:first_name, :last_name, :home_phone, :work_phone])
  end
end
