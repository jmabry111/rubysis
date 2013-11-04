require 'spec_helper'

feature 'show admin dashboard' do
  scenario 'without errors' do
    admin = FactoryGirl.create(:admin)
    enrollment = FactoryGirl.create(:student_section_enrollment)
  
    log_in_as_admin(admin)
  
    visit reports_path
    page.should have_content enrollment.student.name
    page.should have_content enrollment.section.course_name
  end
end