class SectionsController < ApplicationController
  
  def new
    @course = Course.find(params[:course_id])
    @section = Section.new
  end
  
  def section_params
    p params
    
    params.require(:section).permit(:course_id, :teacher_id, :section_number)
  end
end
