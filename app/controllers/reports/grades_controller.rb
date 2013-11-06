class Reports::GradesController < AdminBaseController
  def index
    get_student_section_grade
    calculate_semseter_grade
  end
  
  private
  def get_student_section_grade
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @enrollment = StudentSectionEnrollment.where(student_id: params[:student_id], section_id: params[:section_id]).first
  end
  
  def calculate_semseter_grade
    @semester_grade = @enrollment.grades.average(:numerical_grade)
  end
end