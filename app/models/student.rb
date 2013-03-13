class Student < ActiveRecord::Base
  attr_accessible :first_name, :middle_name, :last_name, :street_address, :city, :state, :zip, :street_address_911, :city_911, 
                  :state_911, :zip_911, :home_phone, :cell_phone, :email, :empl, :dob, :medical_issues, :grade_level, :gender, :school_id
  belongs_to :school
  
  
  def to_s
    "#{first_name} #{last_name}"
  end
end
