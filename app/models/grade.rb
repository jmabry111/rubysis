class Grade < ActiveRecord::Base
  
  belongs_to :student_section_enrollment
  belongs_to :grading_period
  delegate :student, to: :student_section_enrollment, allow_nil: true
  delegate :section, to: :student_section_enrollment, allow_nil: true
  delegate :course, to: :section, allow_nil: true
  
  
  def grade_modification
    grade
  end
  
  def grade_modification=(new_grade)
    self.grade = new_grade
  end
end
