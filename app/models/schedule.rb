class Schedule < ActiveRecord::Base
  
  def initialize
    @student = student
  end
  
  def current_semester_schedule
    @sections = @student.sections.where(semester_id: current_semester.id)
  end
  
  def next_semester_schedule
    @sections = @student.sections.where(semester_id: next_semester.id)
  end
  
  def should_not_show_next_semester?
    !next_semester_schedule
  end
  
end