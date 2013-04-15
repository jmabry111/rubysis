class Section < ActiveRecord::Base
  attr_accessible :course_id, :section_number, :teacher_id, :semester_id
  
  belongs_to :course
  belongs_to :teacher
  belongs_to :semester
  has_many :section_registrations
  has_many :students, :through => :section_registrations
end
