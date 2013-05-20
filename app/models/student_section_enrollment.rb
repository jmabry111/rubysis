class StudentSectionEnrollment < ActiveRecord::Base

  belongs_to :student
  belongs_to :section
  has_many :grades

end
