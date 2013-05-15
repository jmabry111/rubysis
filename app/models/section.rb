class Section < ActiveRecord::Base
  serialize :days_of_week, Array
  before_save :remove_empty_days_of_week
  
  validates :days_of_week, presence: true
  validates :semester, presence: true
  validates :teacher, presence: true
  validates :time_block, presence: true
  
  
  belongs_to :course
  belongs_to :teacher
  belongs_to :semester
  has_many :student_section_enrollments
  has_many :students, :through => :student_section_enrollments
  
 
  WEEKDAYS = ["M", "TU", "W", "TH", "F"]
  
  TIME_BLOCKS = ["7:45-9:15", "9:30-11:00"]
  
  def set_next_section_number(semester)
    if semester != nil
      self.section_number = semester.sections.count + 1
    else
      self.section_number = 1
    end
  end
  
  def current_semester_sections
     @current_sections = Section.where("description LIKE ?", current_semester)
  end

  def days_of_week_string
    days_of_week.join(', ')
  end

  private

  def remove_empty_days_of_week
    if self.days_of_week.present?
      self.days_of_week.reject!(&:empty?)
    end
  end
end
