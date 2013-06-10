class Instructor::AttendancesController < InstructorBaseController
  def new
    get_student_section_enrollment
    @attendance = Attendance.new
    @attendance_status= Attendance::ATTENDANCE_STATUS
  end
  
  def create
    get_student_section_enrollment
    @attendance_status = Attendance::ATTENDANCE_STATUS
    @attendance = Attendance.create(attendance_params)
    if @attendance.save
        redirect_to instructor_sections_path(@enrollment.section), notice: "Attendance recorded."
      else
        render 'new'
      end
  end
  
  def edit
    get_student_section_enrollment
    @attendance = Attendance.find(params[:id])
    @attendance_status= Attendance::ATTENDANCE_STATUS
  end
  
  def update
    get_student_section_enrollment
    @attendance = Attendance.find(params[:id])
    if @attendance.update_attributes!(attendance_params)
      flash[:success] = "Attendance recorded"
      redirect_to instructor_section_attendance_path(@enrollment.section)
    else
      render 'edit'
    end
  end
  
  
  
  private
  
  def attendance_params
    params.require(:attendance).permit(:student_section_enrollment_id, :status, :day)
  end
  
  def get_student_section_enrollment
    @enrollment = StudentSectionEnrollment.where(student_id: params[:student_id], section_id: params[:section_id]).first
  end
end
