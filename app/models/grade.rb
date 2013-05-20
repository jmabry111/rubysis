class Grade < ActiveRecord::Base
  
  belongs_to :student_section_enrollment
  belongs_to :grading_period
  delegate :student, to: :student_section_enrollment, allow_nil: true
  delegate :section, to: :student_section_enrollment, allow_nil: true
  delegate :course, to: :section, allow_nil: true
  
  
 def self.find_grades_for_section(section)
   self.where("student_section_enrollment_id = ?", section)
 end
 
 def self.find_grades_for_student(section)
 self.where("student_section_enrollment_id = ?", section)
 end
end
