require 'spec_helper'

feature 'admin views attendance counts' do
  scenario 'for a section' do
    enrollment = create(:student_section_enrollment)
    student = enrollment.student
    section = enrollment.section
    course = section.course
    visit 

  end
end
