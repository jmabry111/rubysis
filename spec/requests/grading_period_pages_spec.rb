require 'spec_helper'

describe 'Grading Period Pages' do
  
  subject {page}
  
  describe "index" do
  
    before (:each) do
      admin = FactoryGirl.create(:admin)
      log_in_as_admin(admin)
    end
    
    describe "new grading period page" do
      let!(:semester) {FactoryGirl.create(:semester)}
      before {visit new_semester_grading_period_path(semester)}
      it{should have_content("Enter Period Details")}
      
      describe "add a grading period" do
        
        before do
          fill_in "grading_period_description", :with => "Fall 2012"
          fill_in "grading_period_starts_on", :with => "Mon, Apr 01 2013"
          fill_in "grading_period_ends_on", :with => "Mon, Apr 01 2013"
          click_button "Submit Grading Period"
        end
        it{should have_content("Period created")}
      end
      describe "add an invalid grading period" do
        
        before do
          fill_in "grading_period_description", :with => "Fall 2012"
          fill_in "grading_period_starts_on", :with => "Mon, Apr 01 2013"
          click_button "Submit Grading Period"
        end
        it{should have_content("can't be blank")}
      end
    end
    
    describe "grading_period show page" do
      let!(:semester) {FactoryGirl.create(:semester)}
      let!(:grading_period) {FactoryGirl.create(:grading_period)}
      
      before {visit semester_grading_period_path(semester, grading_period)}
      it{should have_content("Grading Period:")}
      it{should have_content(grading_period.description)}
    end
    
  end
end