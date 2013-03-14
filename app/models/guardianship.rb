class Guardianship < ActiveRecord::Base
  attr_accessible :parent_id, :student_id
  
  belongs_to :student
  belongs_to :parent
end
