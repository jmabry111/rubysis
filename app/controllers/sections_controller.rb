class SectionsController < ApplicationController
  
  def section_params
    p params
    
    params.require(:section).permit(:course_id, :teacher_id, :section_number)
  end
end
