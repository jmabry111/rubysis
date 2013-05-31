class Attendance < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :student_section_enrollment
  
  validates_uniqueness_of :day, :scope => :student_section_enrollment_id
  validates :status, presence: true
  
  ATTENDANCE_STATUS = ["Present", "Absent", "Tardy", "Excused"]
  
  
  def weekly_attendance
    self.where("day >= ? AND day <= ?", Date.today.beginning_of_week(start_day = :monday), Date.today.end_of_week(start_day = :monday))
  end
  
  def show_code
    case self.status
      when "Present"
        "P"
      when "Absent"
        "A"
      when "Tardy"
        "T"
      when "Excused"
        "X"
      when nil
        "N/A"
    end 
  end
  
end
