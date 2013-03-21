class AddressesController < ApplicationController
  def new
    @address = Address.new
  end
  
  def create
    @address = current_student.addresses.build(address_params)
    @paddress = current_parent.addresses.build(address_params)
    if @address.save
      flash[:success] = "Student Address Entered."
      redirect_to student_path(current_student)
    else
      render 'new'
    end
    
    if @paddress.save
        flash[:success] = "Parent Address Entered."
        redirect_to student_path(current_student)
      else
        render 'new'
      end
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:address_type, :street, :unit, :city, :state, :zip)
  end
end
