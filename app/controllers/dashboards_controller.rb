class DashboardsController < ApplicationController
  
  def index
    @sections = Section.where(semester_id: current_semester.id).sort! {|a,b| a.course.course_name <=> b.course.course_name}
  end
  
end
