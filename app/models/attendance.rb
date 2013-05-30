class Attendance < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :student_section_enrollment
  
  ATTENDANCE_STATUS = ["Present", "Absent", "Tardy", "Excused"]
  
  
  def weekly_attendance
    self.where("day >= ? AND day <= ?", Date.today.beginning_of_week(start_day = :monday), Date.today.end_of_week(start_day = :monday))
  end
  
  def show_code
    case self.status
      when "Present"
        ""
      when "Absent"
        "A"
      when "Tardy"
        "T"
      when "Excused"
        "X"
    end 
  end
  
end
