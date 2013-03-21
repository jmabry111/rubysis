class StudentsController < ApplicationController
  
  def new
    @student = Student.new
    @parent = Parent.new
  end
  
  def create
    puts "student params"
    p student_params
    @student = Student.new(student_params)

      if @student.save
        session[:current_student] = @student.id
        redirect_to student_path(@student.id), notice: 'Information was successfully submitted.'
      else
        render action: "new"
      end
  end
  
  def index
    @students = Student.order(:first_name).page(params[:page])
  end
  
  def show
    @student = Student.find(params[:id])
    @addresses = @student.addresses.page(params[:page])
  end
  
  def edit
  end
  
  def update
  end
  
  
  private

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
     addresses_attributes: [:city, :street])
  end
end
