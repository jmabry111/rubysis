class AddressesController < ApplicationController
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
  end
  
  def show
    @address = Address.find(params[:id])
  end
  
  
  private
  
  def address_params
    params.require(:address).permit!
  end
end
