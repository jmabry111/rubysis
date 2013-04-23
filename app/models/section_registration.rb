class SectionRegistration < ActiveRecord::Base
  attr_accessible :sections_id, :student_id
  
  belongs_to :student
  belongs_to :section
end
