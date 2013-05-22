class Instructor::SectionsController < InstructorBaseController
  
  
  def show
    @section = Section.find(params[:id])
    @enrollments = @section.student_section_enrollments
  end
  
  def index
    @sections = current_teacher.sections
  end
  
  
  
  
  private
  
  def get_section_students
    @section = Section.find(params[:id])
    @grade = Grade.find_by_id(params[:grade_id])
  end
  
  def find_grades_for_student
    get_section_students
    @section.students.each do |student|
       @grades = Grade.where("student_section_enrollment_id = ?", student)
    end
  end
end