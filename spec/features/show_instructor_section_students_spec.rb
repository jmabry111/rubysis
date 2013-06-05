require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'show teacher courses' do
    
   
   student_section_enrollment = FactoryGirl.create(:student_section_enrollment)
   
   visit new_teacher_session_path
   
   page.should have_content 'Sign in'
   
   fill_in "Email", with: student_section_enrollment.section.teacher.email
   fill_in "Password", with: student_section_enrollment.section.teacher.password
   click_button 'Sign in'
   page.should have_content 'Signed in successfully'
     
   visit instructor_sections_path(student_section_enrollment.section.teacher)
   page.should have_content(student_section_enrollment.section.course.course_name)
   
   visit instructor_section_path(student_section_enrollment.section)
   page.should have_content(student_section_enrollment.student.name)
  end
end