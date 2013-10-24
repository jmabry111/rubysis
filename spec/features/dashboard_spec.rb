require 'spec_helper'

feature 'show admin dashboard' do
  scenario 'without errors' do
    admin = FactoryGirl.create(:admin)
    section = FactoryGirl.create(:section)
  
    log_in_as_admin(admin)
  
    visit dashboards_path
    page.should have_content "Current Semester's Classes"
  end
end