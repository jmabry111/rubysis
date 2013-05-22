require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'show teacher courses' do
    
   student_section_enrollment = FactoryGirl.create(:student_section_enrollment)
   grading_period = FactoryGirl.create(:grading_period)
   
   visit new_teacher_session_path
   
   page.should have_content 'Sign in'
   
   fill_in "Email", with: student_section_enrollment.section.teacher.email
   fill_in "Password", with: student_section_enrollment.section.teacher.password
   click_button 'Sign in'
   page.should have_content 'Signed in successfully'
     
   visit instructor_sections_path(student_section_enrollment.section.teacher)
   page.should have_content(student_section_enrollment.section.course.course_name)
   
   visit instructor_section_path(student_section_enrollment.section)
   page.should have_content(student_section_enrollment.student.to_s)
   
   visit new_instructor_section_student_grade_path(student_section_enrollment.section, student_section_enrollment.student)
   page.should have_content(student_section_enrollment.section.course.course_name)
   
   select 'six weeks', from: 'Grading period'
   fill_in 'Numerical grade', with: 99
   click_button 'Submit Grade'
   
   page.should have_content("Grade entered")
   # save_and_open_page
  end
end