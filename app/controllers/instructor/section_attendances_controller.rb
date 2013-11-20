class Instructor::SectionAttendancesController < InstructorBaseController
  
  def show
    @section = Section.find(params[:section_id])
    @enrollments = @section.student_section_enrollments
    @attendances = AttendanceManager.new(@section).attendances
  end
  
  def edit
    @section = Section.find(params[:section_id])
    @enrollments = @section.student_section_enrollments
    @attendances = AttendanceManager.new(@section).attendances
    if @attendances.any?
      @missed_attendances = AttendanceFiller.new(@attendances).insert_missed_attendances
    else
      @missed_attendances = fill_today()
      @attendances = AttendanceManager.new(@section).attendances
      @other_days = AttendanceFiller.new(@attendances).insert_missed_attendances
    end
  end 


  private
  
  def fill_today()
    @section = Section.find(params[:section_id])
    @enrollments = @section.student_section_enrollments
    @enrollments.each do |e|
      Attendance.create(day: Date.today, student_section_enrollment_id: e.id, status: "")
    end
  end
end