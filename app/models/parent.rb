class Parent < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  has_many :guardianships
  has_many :students, :through => :guardianships
  has_many :addresses
  
  validates :first_name, presence:true
  validates :last_name, presence:true
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :home_phone, presence:true, format: {with:VALID_PHONE_REGEX}
  validates :work_phone, allow_blank:true, format: {with:VALID_PHONE_REGEX}
end
