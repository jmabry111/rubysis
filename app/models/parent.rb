class Parent < ActiveRecord::Base
  attr_accessible :address, :city, :first_name, :home_phone, :last_name, :state, :work_phone, :zip
  
  has_many :guardianships
  has_many :students, :through => :guardianships
end
