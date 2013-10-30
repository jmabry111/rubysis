require 'spec_helper'

describe 'Sections Pages' do
  
  subject {page}
  
  describe "index" do
  
    before (:each) do
      admin = FactoryGirl.create(:admin)
      log_in_as_admin(admin)
    end
    
    describe "new course section page" do
      
      let!(:course) {FactoryGirl.create(:course)}
      let!(:semester) {FactoryGirl.create(:semester)}
      let!(:teacher) {FactoryGirl.create(:teacher)}
      let!(:time_block) {FactoryGirl.create(:time_block)}
      
      before {visit new_course_section_path(course)}

      it {should have_content("Add a new section")}
      
      before do
        select semester.description, :from => "Semester"
        select teacher.name, :from => "Teacher"
        select "7:45-9:15", :from => "section_time_block"
        check "M"
        check "W"
        check "F"
        click_button "Create Section"
      end
      it {should have_content(course.course_name)}
      
    end
    
    describe "invalid new course section" do
        let!(:course) {FactoryGirl.create(:course)}
        let!(:semester) {FactoryGirl.create(:semester)}
        let!(:teacher) {FactoryGirl.create(:teacher)}
        let!(:time_block) {FactoryGirl.create(:time_block)}

        before {visit new_course_section_path(course)}


        before do
          select semester.description, :from => "Semester"
          select teacher.name, :from => "Teacher"
          check "M"
          check "W"
          check "F"
          click_button "Create Section"
        end
        it {should have_content("can't be blank")}
      end
  end
end