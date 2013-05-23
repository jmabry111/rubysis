class Instructor::GradesController < InstructorBaseController
  
  
  def new
    get_student_section_grade
    @grade = Grade.new
    if @enrollment.has_all_grades?
      redirect_to new_instructor_section_student_grade_path(@section, @student), notice: "All grades entered."
    else
      render 'new'
    end 
  end
  
  def create
    get_student_section_grade
    @grade = Grade.create(grade_params)
    if @grade.save
        redirect_to new_instructor_section_student_grade_path, notice: "Grade entered."
      else
        render 'new'
      end
  end
  
  def show
    get_student_section_grade
  end
  
  def index
    get_student_section_grade
    # calculate_semseter_grade
  end
  
  def edit
    get_student_section_grade
  end
  
  def update
    get_student_section_grade
    if @grade.update_attributes!(grade_params)
      flash[:success] = "grade updated"
      redirect_to new_instructor_section_student_grade_path(@section, @student)
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
    @enrollment = StudentSectionEnrollment.where(student_id: params[:student_id], section_id: params[:section_id]).first
  end
  
  def calculate_semseter_grade
    @semester_grade = @grades.average(:numerical_grade)
  end
    
end