require 'spec_helper'

feature 'register student for secion' do
  scenario 'without errors' do
    
    admin = FactoryGirl.create(:admin)
    semester = FactoryGirl.create(:semester)
    section = FactoryGirl.create(:section)
    student = FactoryGirl.create(:student)
    
    log_in_as_admin(admin)
    
    visit course_section_path(section.course, section)
    page.should have_content section.course.course_name
    
    click_link 'Add or Remove Students'
    page.should have_content 'Register a student'
    
    check 'Clark Kent'
    
    click_button "Register students"
    
    page.should have_content student.name
  end
end