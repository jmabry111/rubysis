require 'spec_helper'

feature 'register student for secion' do
  scenario 'without errors' do
    
    admin = FactoryGirl.create(:admin)
    semester = FactoryGirl.create(:semester)
    section = FactoryGirl.create(:section)
    student = FactoryGirl.create(:student)
    
    visit new_admin_session_path
    page.should have_content "Sign in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign in"
    
    page.should have_content 'Welcome'
    
    visit course_section_path(section.course, section)
    page.should have_content section.course.course_name
    
    click_link 'Add or Remove Students'
    page.should have_content 'Register a student'
    
    check 'Clark Kent'
    
    click_button "Register students"
    
    page.should have_content student.to_s
  end
end