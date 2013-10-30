require 'spec_helper'

feature 'create attendance' do
  scenario 'new attendance without errors' do
    enrollment = FactoryGirl.create(:student_section_enrollment)
  
    log_in_as_teacher(enrollment.section.teacher)
  
    visit new_instructor_section_student_attendance_path(enrollment.section, enrollment.student)
    page.should have_content enrollment.name
    page.should have_content Date.today.strftime("%b %d, %Y")
    
    select "Absent", :from => "attendance_status"
    click_button "Submit Attendance"
    page.should have_content 'Attendance recorded'
  end
end