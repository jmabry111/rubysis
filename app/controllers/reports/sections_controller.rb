class Reports::SectionsController < AdminBaseController
  def index
    get_enrollments
  end
  
  
  def get_enrollments
    @enrollments = []
    @sections = Section.where(semester_id: current_semester.id).sort! {|a,b| a.course.course_name <=> b.course.course_name}
    @sections.each do |section|
      @enrollments << StudentSectionEnrollment.where(section_id: section)
    end
  end
end