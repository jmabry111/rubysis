require 'spec_helper'

describe 'Semester Pages' do
  
  subject {page}
  
  describe "index" do
  
    before (:each) do
      admin = FactoryGirl.create(:admin)
      log_in_as_admin(admin)
    end
    
    describe "new semester page" do
      let!(:school_year) {FactoryGirl.create(:school_year)}
      before {visit new_school_year_semester_path(school_year)}
      it{should have_content("Enter Semester Details")}
      
      describe "add a semester" do
        
        before do
          select "Fall #{school_year.description}", :from => "semester_description"
          fill_in "semester_starts_on", :with => "Mon, Apr 01 2013"
          fill_in "semester_ends_on", :with => "Mon, Apr 01 2013"
          click_button "Submit semester"
        end
        it{should have_content("Semester created")}
      end
      
      describe "add an invalid semester" do
        
        before do
          select "Fall #{school_year.description}", :from => "semester_description"
          fill_in "semester_starts_on", :with => "Mon, Apr 01 2013"
          click_button "Submit semester"
        end
        it{should have_content("can't be blank")}
      end
    end
    
    describe "semester show page" do
      let!(:semester) {FactoryGirl.create(:semester)}
      let!(:grading_period) {FactoryGirl.create(:grading_period)}
      
      before {visit semester_path(semester)}
      it{should have_content(semester.description)}
    end
    
  end
end