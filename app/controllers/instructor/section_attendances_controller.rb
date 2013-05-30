class Instructor::SectionAttendancesController < InstructorBaseController
  
  def show
    @section = Section.find(params[:section_id])
    @enrollments = @section.student_section_enrollments
    @attendances = AttendanceManager.new(@section).attendances
  end
 
end