class SectionsController < ApplicationController
  
  def new
    find_course
    @section = Section.new
  end
  
  def create
      find_course
      @section = @course.sections.build(section_params)
      @semester = Semester.find(params[:section][:semester_id])
      @section.section_number = @semester.sections.count + 1
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
  
  private
  
  def find_course
    @course = Course.find(params[:course_id])
  end
  
  def section_params
    params.require(:section).permit(:course_id, :teacher_id, :section_number, :semester_id, days_of_week:[])
  end
end
