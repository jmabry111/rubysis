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
  
  
  private
  
  def password_generator
    SecureRandom.hex(8)
  end
  
  def teacher_params
    puts 'params'
    p params

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