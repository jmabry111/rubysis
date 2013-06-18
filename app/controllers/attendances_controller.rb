class AttendancesController < ApplicationController
  def index
    @enrollments = StudentSectionEnrollment.where(section_id: params[:section_id])
    @attendances = Attendance.where(student_section_enrollment_id: @enrollments.map(&:id))
  end

  def new
    get_student_section_enrollment
    @attendance = Attendance.new
    @attendance_status = Attendance::ATTENDANCE_STATUS
  end
  
  def create
    get_student_section_enrollment
    @attendance_status = Attendance::ATTENDANCE_STATUS
    @attendance = Attendance.create(attendance_params)
    if @attendance.save
        redirect_to student_section_path(@student, @section), notice: "Attendance recorded."
      else
        render 'new'
      end
  end
  
  
  
  private
  
  def attendance_params
    params.require(:attendance).permit(:student_section_enrollment_id, :status, :day)
  end
  
  def get_student_section_enrollment
    @student = Student.find_by_id(params[:student_id])
    @section = Section.find_by_id(params[:section_id])
    @enrollment = StudentSectionEnrollment.where(student_id: params[:student_id], section_id: params[:section_id]).first
  end
end
