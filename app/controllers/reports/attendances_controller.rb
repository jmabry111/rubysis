 class Reports::AttendancesController < AdminBaseController 
   
  def index
    get_student_section_enrollment
    @attendances = Attendance.where(student_section_enrollment_id: @enrollment).all
  end
   
  def show
    @section = Section.find(params[:section_id])
    @enrollments = @section.student_section_enrollments
    @attendances = AttendanceManager.new(@section).attendances
#    @missed_attendances = AttendanceFiller.new(@attendances).insert_missed_attendances
  end
   
  private
   
  def get_student_section_enrollment
    @enrollment = StudentSectionEnrollment.where(student_id: params[:student_id], section_id: params[:section_id]).first
  end
end