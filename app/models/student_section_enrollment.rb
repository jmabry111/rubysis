class StudentSectionEnrollment < ActiveRecord::Base

  belongs_to :student
  belongs_to :section
  has_many :grades


  def has_all_grades?
    self.grades.count >= 4
  end
end
