class GradesController < ApplicationController
  
  def new
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @current_semester = GradingPeriod.where("semester_id = ?", current_semester.id)
    @grade = Grade.new
    @grades = Grade.where("student_section_enrollment_id = ?", @section.id)
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
  
  def edit
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @grade = Grade.find_by_id(params[:id])
  end
  
  def update
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @grade = Grade.find_by_id(params[:id])
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
end