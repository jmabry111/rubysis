class GradesController < ApplicationController
  
  def new
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @current_semester = GradingPeriod.where("semester_id = ?", current_semester.id)
    @grade = Grade.new
  end
  
  def create
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @grade = Grade.create(grade_params)
    if @grade.save
        redirect_to student_schedule_path(@student), notice: "Grade entered."
      else
        render 'new'
      end
  end
  
  def show
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @grade = Grade.find_by_id(params[:id])
  end
  
  def index
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @grades = Grade.where("student_section_enrollment_id = ?", @section.id)
    @semester_grade = @grades.average(:numerical_grade)
  end
 
  
  private
  def grade_params
    params.require(:grade).permit(:numerical_grade, :student_section_enrollment_id, :grading_period_id)
  end
end