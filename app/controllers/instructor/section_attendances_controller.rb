class Instructor::SectionAttendancesController < InstructorBaseController
  
  def show
    @section = Section.find(params[:section_id])
    @enrollments = @section.student_section_enrollments
  end
end