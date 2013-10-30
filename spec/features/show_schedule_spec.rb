require 'spec_helper'

feature 'show a student schedule' do
  scenario 'without errors' do
    
    admin = FactoryGirl.create(:admin)
    section = FactoryGirl.create(:section)
    student = FactoryGirl.create(:student)
    current_semester = section.semester
     
    log_in_as_admin(admin)
    
    visit course_section_path(section.course, section)
    page.should have_content section.course.course_name
    
    click_link 'Add or Remove Students'
    page.should have_content 'Register a student'
    
    check 'Clark Kent'
    
    click_button "Register students"
    
    visit student_path(student)

    page.should have_content student.name
    
    visit student_schedule_path(student)

    page.should have_content student.name
    
    page.should have_content student.sections.first.course.course_name
    
  end
end