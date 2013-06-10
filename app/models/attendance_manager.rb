class AttendanceManager
  def initialize(section)
    @section = section
  end

  def attendances
    @attendances ||= get_attendances
  end

  def get_attendances
    ids = @section.student_section_enrollments.map(&:id)
    if Date.today.strftime('%a') == "Mon"
      Attendance.where(day: Date.today-7...Date.today+1, student_section_enrollment_id: ids).group_by(&:student_section_enrollment)
    elsif Date.today.strftime('%a') == "Tue"
      Attendance.where(day: Date.today-8...Date.today+1, student_section_enrollment_id: ids).group_by(&:student_section_enrollment)
    elsif Date.today.strftime('%a') == "Wed"
      Attendance.where(day: Date.today-9...Date.today+1, student_section_enrollment_id: ids).group_by(&:student_section_enrollment)
    elsif Date.today.strftime('%a') == "Thu"
      Attendance.where(day: Date.today-10...Date.today+1, student_section_enrollment_id: ids).group_by(&:student_section_enrollment)
    else
      Attendance.where(day: Date.today-11...Date.today+1, student_section_enrollment_id: ids).group_by(&:student_section_enrollment)
    end
  end
  
end