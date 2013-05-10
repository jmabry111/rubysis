class Instructor::SectionsController < ApplicationController
  
  skip_before_filter :authenticate_user!
  
  def show
    @section = Section.find(params[:id])
    @students = @section.students.page(params[:page])
  end
  
  def index
    @teacher = Teacher.find_by_id(params[:teacher_id])
    @sections = @teacher.sections
  end
end