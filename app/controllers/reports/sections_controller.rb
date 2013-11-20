class Reports::SectionsController < AdminBaseController
  def index
    @sections = Section.where(semester_id: current_semester.id).group_by {|section| section.teacher.name}
  end
  
  def show
    @section = Section.find(params[:id])
    @enrollments = @section.student_section_enrollments
  end
  
  
  def get_enrollments
    @enrollments = []
    @sections = Section.where(semester_id: current_semester.id).sort! {|a,b| a.course.course_name <=> b.course.course_name}
    @sections.each do |section|
      @enrollments << StudentSectionEnrollment.where(section_id: section)
    end
  end
end