class Course < ActiveRecord::Base
  
#  has_many :sections
  
  validates :course_name, presence: true
end
