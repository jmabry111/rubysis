class Student < ActiveRecord::Base
  attr_accessible :first_name, :middle_name, :last_name, :street_address, :city, :state, :zip, :street_address_911, :city_911, 
                  :state_911, :zip_911, :home_phone, :cell_phone, :email, :empl, :dob, :medical_issues, :grade_level, :gender, :school_id
  belongs_to :school
  
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_ZIP_REGEX = /\d{5}/
  
  
  validates :school, presence:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :grade_level, presence:true
  validates :gender, presence:true
  validates :dob, presence:true
  validates :street_address, presence:true
  validates :city, presence:true
  validates :state, presence:true
  validates :zip, presence:true,  format: {with:VALID_ZIP_REGEX}
  validates :zip_911, allow_blank:true, format: {with:VALID_ZIP_REGEX}
  validates :home_phone, presence:true, format: {with:VALID_PHONE_REGEX}
  validates :cell_phone, allow_blank:true, format: {with:VALID_PHONE_REGEX}
  validates :email, allow_blank:true, format: {with:VALID_EMAIL_REGEX}
  
  
  
  def to_s
    "#{first_name} #{last_name}"
  end
end
