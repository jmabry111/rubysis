require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'show teacher courses' do
    
   
   student_section_enrollment = FactoryGirl.create(:student_section_enrollment)
   
   visit new_teacher_session_path
   
    log_in_as_teacher(student_section_enrollment.section.teacher)
     
   visit instructor_sections_path(student_section_enrollment.section.teacher)
   page.should have_content(student_section_enrollment.section.course.course_name)
   
   visit instructor_section_path(student_section_enrollment.section)
   page.should have_content(student_section_enrollment.student.name)
  end
end