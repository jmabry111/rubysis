class DashboardsController < ApplicationController
  
  def index
    @sections = Section.where(semester_id: current_semester.id)
  end
  
end
