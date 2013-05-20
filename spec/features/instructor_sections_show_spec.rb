require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'show teacher courses' do
   
   section =  FactoryGirl.create(:section)
   
   visit new_teacher_session_path
   
   page.should have_content 'Sign in'
   
   fill_in "Email", with: section.teacher.email
   fill_in "Password", with: section.teacher.password
   click_button 'Sign in'
   page.should have_content 'Signed in successfully'
     
   visit instructor_sections_path(section.teacher)
   page.should have_content(section.course.course_name)
  end
end