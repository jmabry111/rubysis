require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'without errors' do
   
   section =  FactoryGirl.create(:section)
   
   visit new_teacher_session_path
   
   page.should have_content 'Sign in'
   
   fill_in "Email", with: section.teacher.email
   fill_in "Password", with: section.teacher.password
   click_button 'Sign in'
   page.should have_content 'Signed in successfully'  
  end
end