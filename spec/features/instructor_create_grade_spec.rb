require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'show teacher courses' do
    
   student_section_enrollment = FactoryGirl.create(:student_section_enrollment)
   grading_period = FactoryGirl.create(:grading_period)
   
    log_in_as_teacher(student_section_enrollment.section.teacher)
     
   visit instructor_sections_path(student_section_enrollment.section.teacher)
   page.should have_content(student_section_enrollment.section.course.course_name)
   
   visit instructor_section_path(student_section_enrollment.section)
   page.should have_content(student_section_enrollment.student.name)
   
   visit new_instructor_section_student_grade_path(student_section_enrollment.section, student_section_enrollment.student)
   page.should have_content(student_section_enrollment.section.course.course_name)
   
   select 'six weeks', from: 'Grading period'
   fill_in 'Numerical grade', with: 99
   click_button 'Submit Grade'
   
   page.should have_content("Grade entered")
  end
end