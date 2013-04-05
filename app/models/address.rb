class Address < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
    
  belongs_to :student
  belongs_to :parent
  belongs_to :teacher
  
  
  validates :address_type, presence:true
  validates :street, presence:true
  validates :city, presence:true
  validates :state, presence:true
  VALID_ZIP_REGEX = /\d{5}/
  validates :zip, presence:true,  format: {with:VALID_ZIP_REGEX}
end
