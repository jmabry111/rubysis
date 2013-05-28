class Instructor::SectionAttendancesController < InstructorBaseController
  
  def show
    @section = Section.find(params[:id])
    @enrollments = @section.student_section_enrollments
  end
end