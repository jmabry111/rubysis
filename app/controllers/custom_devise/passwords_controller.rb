class CustomDevise::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(resource_name).permit(
      :email, 
      :password, 
      :password_confirmation, 
      :name, 
      :work_phone, 
      :home_phone,
      :cell_phone,
      addresses_attributes: [:city, :street, :state, :zip, :address_type, :unit])
  end
  private :resource_params
end