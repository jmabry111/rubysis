class Attendance < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :student_section_enrollment
  
  ATTENDANCE_CODES = ["Present", "Absent", "Tardy", "Excused"]
end
