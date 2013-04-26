class SchedulesController < ApplicationController
  
  def show
    @student = Student.find_by_id(params[:student_id])
    @addresses = @student.addresses.page(params[:page])
    @parents = @student.parents.page(params[:page])
  end
  
end