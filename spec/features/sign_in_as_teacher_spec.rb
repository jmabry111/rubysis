require 'spec_helper'

feature 'sign in as teacher' do
  scenario 'without errors' do
   
   section =  FactoryGirl.create(:section)
   
    log_in_as_teacher(section.teacher)
  end
end