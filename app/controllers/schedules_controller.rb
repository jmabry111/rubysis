class SchedulesController < ApplicationController
  
  def show
    @student = Student.find_by_id(params[:student_id])
    if current_semester
      @sections = @student.sections.where(semester_id: current_semester.id)
    else
      @sections = @student.sections
    end
    if next_semester
      @next_sections = @student.sections.where(semester_id: next_semester.id)
    else
      @next_sections = @student.sections
    end
  end

end