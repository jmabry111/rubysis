require 'spec_helper'

describe 'School Year Pages' do
  
  subject {page}
  
  describe "index" do
  
    before (:each) do
      admin = FactoryGirl.create(:admin)
      log_in_as_admin(admin)
    end
    
    describe "new year page" do
      before {visit new_school_year_path}
      
      it {should have_content("Enter Year Details")}
      
      describe "Add a year" do
        
        before do
          fill_in "Description", :with => "Spring 2013"
          fill_in "school_year_starts_on", :with => "Mon, Aug 01 2013"
          fill_in "school_year_ends_on", :with => "Mon, Jun 01 2013" 
          click_button "Submit year"
        end
        it {should have_content("Year created")}
      end
      describe "Add an invalid year" do
        
        before do
          fill_in "Description", :with => "Spring 2013"
          fill_in "school_year_starts_on", :with => "Mon, Aug 01 2013"
          click_button "Submit year"
        end
        it {should have_content("can't be blank")}
      end
    end
    
    describe "year show page" do
      let!(:school_year) {FactoryGirl.create(:school_year)}
      let!(:semester) {FactoryGirl.create(:semester)}
      before {visit school_year_path(school_year)}
      it {should have_content(school_year.description)}
    end
    
    describe "year index page" do
      before {10.times {FactoryGirl.create(:school_year)}}
      
      before {visit school_years_path}
      
      it {should have_content("All years")}
      it {should have_content("Year")}
      it {should have_content("Start Date")}
      it {should have_content("End Date")}
    end
  end
end