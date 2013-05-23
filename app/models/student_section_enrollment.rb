class StudentSectionEnrollment < ActiveRecord::Base

  belongs_to :student
  belongs_to :section
  has_many :grades


  def has_all_grades?
    # This will determine if there has been a grade for each of the 3 6-week periods and an exam grade
    self.grades.count >= 4
  end
end
