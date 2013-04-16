class SchoolYear < ActiveRecord::Base
#  attr_accessible :description, :ends_on, :starts_on
  
  has_many :semesters
  
  
  

end
