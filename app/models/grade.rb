class Grade < ActiveRecord::Base
  
  belongs_to :student_section_enrollment
  belongs_to :grading_period
  delegate :student, to: :student_section_enrollment, allow_nil: true
  delegate :section, to: :student_section_enrollment, allow_nil: true
  delegate :course, to: :section, allow_nil: true
  
  
end
