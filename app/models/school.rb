class School < ActiveRecord::Base
  attr_accessible :name, :address, :city, :state, :zip
  has_many :students
end
