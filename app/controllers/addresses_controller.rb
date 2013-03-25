class AddressesController < ApplicationController
  def new
    @address = Address.new
  end
  
  def create
    @address = session[:current_student].addresses.build(address_params)
    if @address.save
      flash[:success] = "Address Entered."
      redirect_to student_path(session[:current_student])
    else
      render 'new'
    end
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update_attributes!(address_params)
      flash[:success] = "Address updated."
      redirect_to student_path(@address.student.id)
    else
      render 'edit'
    end
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:address_type, :street, :unit, :city, :state, :zip)
  end
end
