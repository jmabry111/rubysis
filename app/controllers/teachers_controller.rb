class TeachersController < ApplicationController

  def index
    @teachers = Teacher.order(:name).page(params[:page])
  end
  
  def new
    @teacher = Teacher.new
    @teacher.addresses.build
  end
  
  def create
    p teacher_params
    @teacher = Teacher.new(teacher_params)
    password = password_generator
    @teacher.password = password
    @teacher.password_confirmation = password
      if @teacher.save
        sign_in @teacher, :bypass => true
        redirect_to teachers_path, notice: 'Teacher added.'
      else
        render action: "new"
      end
  end
  
  def edit
    @teacher = find_teacher_or_redirect
  end
  
  def update
    @teacher = find_teacher_or_redirect
    if @teacher.update_attributes!(teacher_params)
      flash[:success] = "Teacher information updated"
      redirect_to teacher_path(@teacher)
    else
      render 'edit'
    end
  end

  
  def show
    @teacher = find_teacher_or_redirect
    @addresses = @teacher.addresses.page(params[:page])
  end
  
  private
  
  def find_teacher_or_redirect
    teacher = Teacher.find_by_id(params[:id])
    unless teacher
     flash[:notice] = "This teacher does not exist"
     redirect_to teachers_path
    end
    teacher
  end
  
  def password_generator
    SecureRandom.hex(8)
  end
  
  def teacher_params
    params.require(:teacher).permit(:name,
     :home_phone,
     :cell_phone,
     :work_phone,
     :email,
     :address_id,
     :password,
     :password_confirmation,
     addresses_attributes: [:city, :street, :state, :zip, :address_type, :unit])
  end
end