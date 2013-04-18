class Section < ActiveRecord::Base
  serialize :days_of_week
  
  before_save :array_to_s
  validates :days_of_week, presence: true
  
  
  belongs_to :course
  belongs_to :teacher
  belongs_to :semester
  has_many :section_registrations
  has_many :students, :through => :section_registrations
  
 
  WEEKDAYS = ["M", "TU", "W", "TH", "F"]
  
  def set_next_section_number(semester)
    self.section_number = semester.sections.count + 1
  end
  
  private
  
  def array_to_s
    self.days_of_week = self.days_of_week.reject!(&:empty?)
    self.days_of_week = self.days_of_week.join(', ')
  end
end
