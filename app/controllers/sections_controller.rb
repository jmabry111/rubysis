class SectionsController < ApplicationController
  
  def new
    find_course
    @section = Section.new
    @time_blocks = TimeBlock.all
    @weekdays = Section::WEEKDAYS
  end
  
  def create
    @weekdays = Section::WEEKDAYS
    find_course
    @section = @course.sections.build(section_params)
    find_semester_or_redirect
    if @semester == nil
      flash[:notice] = "That semester is invalid"
    else
      @section.set_next_section_number(@semester)
    end  
    @conflicts = ScheduleConflictChecker.new(@section).check_teacher_schedule
    if @conflicts > 0 
      flash[:alert] = "This teacher is already teaching a class during that time. Please choose another teacher or time."
      render 'new'
    else
      if @section.save
        flash[:success] = "Section Created."
        redirect_to course_path(@course)
      else
        render 'new'
      end
    end
  end
  
  def show
    @section = Section.find(params[:id])
    @students = @section.students.page(params[:page])
  end
  
  def edit
    find_course
    @students = Student.joins(:school).school_search(params[:school_search]).order(:last_name)
    @ialr_students = Student.joins(:school).where("site LIKE ?", "IALR").order(:last_name)
    @nci_students = Student.joins(:school).where("site LIKE ?", "NCI").order(:last_name)
    @section = Section.find(params[:id])
  end
  
  def update
    find_course
    @students = Student.joins(:school).school_search(params[:school_search]).order(:last_name).page(params[:page])
    @section = Section.find(params[:id])
    if @section.update_attributes!(section_params)
      flash[:success] = "Successfully registered students"
      redirect_to course_section_path(@course, @section)
    end
  end
  
 
  
  private
  
  def create_section_registrations
    @section = Section.find(params[:id])
    @students = Student.joins(:school).school_search(params[:school_search]).order(:last_name).page(params[:page])
    @students.each do |s|
      @section.section_registrations.create(:student => s)
    end
  end
  
  def find_course
    @course = Course.find(params[:course_id])
  end
  
  def find_semester_or_redirect
    find_course
    section = @course.sections.build(section_params)
    if section.semester_id != nil
      @semester = Semester.find (params[:section][:semester_id])
    else
      @semester = nil
    end
    return @semester
  end
  
  def section_params
    params.require(:section).permit(:course_id, :teacher_id, :section_number, :semester_id, :time_block, days_of_week:[], student_ids:[])
  end
end
