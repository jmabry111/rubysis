require 'spec_helper'

feature 'create attendance' do
  scenario 'new attendance without errors' do
    enrollment = FactoryGirl.create(:student_section_enrollment)
    attendance = FactoryGirl.create(:attendance)
  
    visit new_teacher_session_path
  
    page.should have_content 'Sign in'
  
    fill_in "Email", with: enrollment.section.teacher.email
    fill_in "Password", with: enrollment.section.teacher.password
    click_button 'Sign in'
    page.should have_content 'Signed in successfully'
  
    visit edit_instructor_section_student_attendance_path(enrollment.section, enrollment.student, attendance)
    page.should have_content enrollment.name
    page.should have_content attendance.day.strftime("%b %d, %Y")
    
    select "Absent", :from => "attendance_status"
    click_button "Submit Attendance"
    page.should have_content 'Attendance recorded'
  end
end