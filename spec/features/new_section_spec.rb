require 'spec_helper'

feature 'create a section' do
  scenario 'without errors' do
    
    admin = FactoryGirl.create(:admin)
    course = FactoryGirl.create(:course)
    semester = FactoryGirl.create(:semester)
    teacher = FactoryGirl.create(:teacher)
    time_block = FactoryGirl.create(:time_block)
    
    visit new_admin_session_path
    page.should have_content "Sign in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign in"
    
    page.should have_content 'Welcome'
    
    visit new_course_section_path(course)
    
    page.should have_content course.course_name
     
    select semester.description, :from => 'Semester'
    select teacher.name, :from => 'Teacher'
    select "7:45-9:15", :from => 'Time block'
    check "M"
    check "W"
    check "F"
    click_button 'Create Section'
    page.should have_content 'Section Created'
    page.should have_content 'M, W, F'
  end
end