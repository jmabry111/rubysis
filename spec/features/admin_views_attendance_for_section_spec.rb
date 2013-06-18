require 'spec_helper'

feature 'admin views attendance counts' do
  scenario 'for a section' do
    enrollment = create(:student_section_enrollment)
    student = enrollment.student

    create(:attendance,
           student_section_enrollment: enrollment,
           status: 'Absent',
           day: 1.day.ago)
    create(:attendance,
           student_section_enrollment: enrollment,
           status: 'Tardy',
           day: 2.days.ago)
    create(:attendance,
           student_section_enrollment: enrollment,
           status: 'Tardy',
           day: 3.days.ago)

    section = enrollment.section
    course = section.course

    log_in_as_admin
    visit course_section_path(course, section)
    click_on 'Show Attendance'
    save_and_open_page
    page.should have_content student.name
    page.should have_content  "Tardy: 2"
    page.should have_content  "Absent: 1"
  end
end
