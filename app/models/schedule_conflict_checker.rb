class ScheduleConflictChecker
  
  def initialize(section)
    @section = section
  end

  def check_teacher_schedule
    number_of_conflicts = Section.where(:teacher_id => @section.teacher_id).where(time_block: @section.time_block).where(semester_id: @section.semester_id).all.select {|day| day.days_of_week.include? @section.days_of_week[0]}.size
  end
  
end