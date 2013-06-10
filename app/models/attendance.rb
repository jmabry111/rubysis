class Attendance < ActiveRecord::Base
  
  belongs_to :student_section_enrollment
  
  validates_uniqueness_of :day, :scope => :student_section_enrollment_id
  
  ATTENDANCE_STATUS = ["Present", "Absent", "Tardy", "Excused"]
  
  
  def weekly_attendance
    self.where("day >= ? AND day <= ?", Date.today.beginning_of_week(start_day = :monday), Date.today.end_of_week(start_day = :monday))
  end
  
  def show_code
    codes ={
      "Present" => "P",
      "Absent" => "A",
      "Tardy" => "T",
      "Excused" => "X"
    }
    codes.fetch(status, "")
  end
  
end
