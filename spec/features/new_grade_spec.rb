require 'spec_helper'

feature 'add a grade' do
  scenario 'without errors' do
    admin = FactoryGirl.create(:admin)
    grading_period = FactoryGirl.create(:grading_period)
    section = FactoryGirl.create(:section)
    student = FactoryGirl.create(:student)
    
    visit new_admin_session_path
    page.should have_content "Sign in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign in"
    
    page.should have_content 'Welcome'
    

    visit new_student_section_grade_path(student, section)
    
    select "six weeks", :from => "grade_grading_period_id"
    fill_in "grade_numerical_grade", :with => 97
    click_button "Submit Grade"
    page.should have_content "Grade entered."
  end
end