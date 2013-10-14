class ScheduleConflictChecker
  
  def initialize(section)
    @section = section
  end
  
  def check_teacher_schedule
    p "#{@section.description} is this section"
    number_of_conflicts = Section.where(:teacher_id => @section.teacher_id).where(time_block: @section.time_block).where(semester_id: @section.semester_id).all.select {|day| day.days_of_week.include? @section.days_of_week[0]}.size
  end
  
  def check_student_schedule
   # Method for checking student schedule conflicts 
  end
  
end