class SectionsController < ApplicationController
  
  def new
    @course = Course.find(params[:course_id])
    @section = Section.new
  end
  
  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.build(section_params)
    if @section.save
      flash[:success] = "Section Created."
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def section_params
    params.require(:section).permit(:course_id, :teacher_id, :section_number)
  end
end
