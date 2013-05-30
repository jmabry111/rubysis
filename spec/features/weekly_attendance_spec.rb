require 'spec_helper'

feature 'show weekly attendance' do
  scenario 'show teacher courses' do
   
   Timecop.freeze("2013-05-30")
   enrollment = FactoryGirl.create(:student_section_enrollment)
   present = Attendance.create(:status => "Present", :day => Date.today, :student_section_enrollment_id => enrollment.id)
   absent = Attendance.create(:status => "Absent", :day => Date.today - 1, :student_section_enrollment_id => enrollment.id)
   excused = Attendance.create(:status => "Excused", :day => Date.today - 2, :student_section_enrollment_id => enrollment.id)
   tardy = Attendance.create(:status => "Tardy", :day => Date.today - 3, :student_section_enrollment_id => enrollment.id)
   
   visit new_teacher_session_path
   
   page.should have_content 'Sign in'
   
   fill_in "Email", with: enrollment.section.teacher.email
   fill_in "Password", with: enrollment.section.teacher.password
   click_button 'Sign in'
   page.should have_content 'Signed in successfully'
     
     p enrollment
     p enrollment.section.course_name
     p enrollment.section.id
     p absent
     
   visit instructor_section_attendance_path(enrollment.section.id)
   page.should have_content(enrollment.section.course_name)
   page.should have_selector("td.th", text: "")
   page.should have_selector("td.wed", text: "A")
   page.should have_selector("td.tues", text: "X")
   page.should have_selector("td.mon", text: "T") 
   page.should have_selector("td.fri", text: nil)
   save_and_open_page
  end
end