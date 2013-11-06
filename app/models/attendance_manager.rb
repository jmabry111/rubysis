class AttendanceManager
  def initialize(section)
    @section = section
  end

  def attendances
    if @attendances.any?
      @attendances ||= get_attendances
    else
      
    end
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
  
  def empty_attendances
    empty_days = []
    @section.student_section_enrollments.each do
      if Date.today.strftime('%a') == "Mon"
        empty_days + (Date.today-7..Date.today+1).to_a
      elsif Date.today.strftime('%a') == "Tue"
        empty_days + (Date.today-8..Date.today+1).to_a
      elsif Date.today.strftime('%a') == "Wed"
        empty_days + (Date.today-9..Date.today+1).to_a
      elsif Date.today.strftime('%a') == "Thu"
        empty_days + (Date.today-10..Date.today+1).to_a
      else
        empty_days + (Date.today-11..Date.today+1).to_a 
      end
    end
  end
end