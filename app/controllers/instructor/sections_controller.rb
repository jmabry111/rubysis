class Instructor::SectionsController < ApplicationController
  
  skip_before_filter :authenticate_admin!
  before_filter :authenticate_teacher!
  
  def show
    get_section_students
    @students = @section.students.page(params[:page])
    find_grades_for_student
  end
  
  def index
    @sections = current_teacher.sections
  end
  
  
  
  
  private
  
  def get_section_students
    @section = Section.find(params[:id])
    @grade = Grade.find_by_id(params[:grade_id])
  end
  
  def find_grades_for_student
    get_section_students
    @section.students.each do |student|
       @grades = Grade.where("student_section_enrollment_id = ?", student)
    end
  end
end