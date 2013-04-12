class CoursesController < ApplicationController
  
  def new
    @course = Course.new
    @course.sections.build
  end
  
  def show
    @course = Course.find_by_id(params[:id])
  end
  
  def create
    p course_params
    @course = Course.new(course_params)
    
    if @course.save
      flash[:success] = "Course Created."
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end
  
  def index
    @courses = Course.order(:course_name).page(params[:page])
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes!(course_params)
      flash[:success] = "Course updated."
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end
  
  
  def course_params
    puts 'params'
    p params
    
    params.require(:course).permit(:course_name, :course_description)
  end
end
