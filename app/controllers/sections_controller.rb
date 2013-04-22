class SectionsController < ApplicationController
  
  def new
    find_course
    @section = Section.new
  end
  
  def create
      find_course
      @section = @course.sections.build(section_params)
      @semester = Semester.find(params[:section][:semester_id])
      @section.set_next_section_number(@semester)
    if @section.save
      flash[:success] = "Section Created."
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end
  
  def show
    @students = Student.all
    @section = Section.find(params[:id])
  end
  
  def edit
    find_course
    @students = Student.all
    @section = Section.find(params[:id])
  end
  
  def update
    find_course
    @section = Section.find(params[:id])
    if @section.update_attributes!(section_params)
      flash[:success] = "Success"
      redirect_to course_section_path(@course, @section)
    else
      render 'edit'
    end
  end
  
  private
  
  def find_course
    @course = Course.find(params[:course_id])
  end
  
  def section_params
    params.require(:section).permit(:course_id, :teacher_id, :section_number, :semester_id, days_of_week:[])
  end
end
