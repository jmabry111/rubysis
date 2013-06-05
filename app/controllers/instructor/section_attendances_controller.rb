class Instructor::SectionAttendancesController < InstructorBaseController
  
  def show
    @section = Section.find(params[:section_id])
    @enrollments = @section.student_section_enrollments
    @attendances = AttendanceManager.new(@section).attendances
    @missed_attendances = AttendanceFiller.new(@attendances).insert_missed_attendances
  end
 
end