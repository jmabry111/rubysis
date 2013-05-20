class GradesController < ApplicationController
  
  def new
    get_student_section_grade
    @current_semester = GradingPeriod.where("semester_id = ?", current_semester.id)
    @enrollment = StudentSectionEnrollment.where(student_id: params[:student_id], section_id: params[:section_id]).first
    @grade = Grade.new
    if @grades.count >= 4
      redirect_to student_section_grades_path(@student, @section), notice: "All grades entered."
    else
      render 'new'
    end 
  end
  
  def create
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @grade = Grade.create(grade_params)
    if @grade.save
        redirect_to student_section_grades_path(@student, @section), notice: "Grade entered."
      else
        render 'new'
      end
  end
  
  def show
    get_student_section_grade
  end
  
  def index
    get_student_section_grade
    calculate_semseter_grade
  end
  
  def edit
    get_student_section_grade
  end
  
  def update
    get_student_section_grade
    if @grade.update_attributes!(grade_params)
      flash[:success] = "grade updated"
      redirect_to student_section_grades_path(@student, @section)
    else
      render 'edit'
    end
  end
  
  private
  def grade_params
    params.require(:grade).permit(:numerical_grade, :student_section_enrollment_id, :grading_period_id)
  end
  
  def get_student_section_grade
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @grade = Grade.find_by_id(params[:id])
    @grades = Grade.find_grades_for_section(@section.id)
  end
  
  def calculate_semseter_grade
    @semester_grade = @grades.average(:numerical_grade)
  end
    
end