require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'show teacher courses' do
   
   section =  FactoryGirl.create(:section)
   
    log_in_as_teacher(section.teacher)
     
   visit instructor_sections_path(section.teacher)
   page.should have_content(section.course.course_name)
  end
end