class AttendanceManager
  def initialize(section)
    @section = section
  end

  def attendances
    @attendances ||= get_attendances
  end

  def get_attendances
    ids = @section.student_section_enrollments.map(&:id)
    Attendance.where(day: Date.today-11...Date.today+1, student_section_enrollment_id: ids).group_by(&:student_section_enrollment)
  end
  
end