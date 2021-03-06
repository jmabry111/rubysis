class Instructor::SectionsController < InstructorBaseController
  
  
  def show
    @section = Section.find(params[:id])
    @enrollments = @section.student_section_enrollments
  end
  
  def index
    @sections = current_teacher.sections
  end
  
  def attendance
    @section = Section.find(params[:id])
    @enrollments = @section.student_section_enrollments
  end  
  
  
  private
  
  def get_section_students
    @section = Section.find(params[:id])
    @grade = Grade.find_by_id(params[:grade_id])
  end
  
end