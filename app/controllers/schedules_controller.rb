class SchedulesController < ApplicationController
  
  def show
    @student = Student.find_by_id(params[:student_id])
    @addresses = @student.addresses.page(params[:page])
    @parents = @student.parents.page(params[:page])
    @sections = @student.sections.where(semester_id: current_semester.id)
    @next_sections = @student.sections.where(semester_id: next_semester.id)
  end
  
  def next
    @student = Student.find_by_id(params[:student_id])
  end
  
end