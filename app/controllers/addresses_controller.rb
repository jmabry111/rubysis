class AddressesController < ApplicationController
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    
      if @address.save
        session[:current_address] = @address.id
        redirect_to address_path, notice: 'Address saved.'
      else
        render action: "new"
      end
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  
  private
  
  def address_params
    params.require(:address).permit!
  end
end
