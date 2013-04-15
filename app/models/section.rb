class Section < ActiveRecord::Base
  attr_accessible :course_id, :section_number, :teacher_id
  
  belongs_to :course
  belongs_to :teacher
  has_many :section_registrations
  has_many :students, :through => :section_registrations
end
