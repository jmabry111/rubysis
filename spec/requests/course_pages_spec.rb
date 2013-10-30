require 'spec_helper'

describe 'Course Pages' do
  
  subject {page}
  
  describe "index" do
    before (:each) do
      admin = FactoryGirl.create(:admin)
      log_in_as_admin(admin)
    end

    describe "new course page" do
      before {visit new_course_path}
    
      it {should have_content("Add a new course")}
      
      describe "Add a course" do
        
        before do
          fill_in "course_course_name", with: "English 101"
          fill_in "course_course_description", with: "English Class"
          click_button "Add course"
        end
        it {should have_content("Course Created")}
      end
      
      
      describe "show course page" do
        let(:course) {FactoryGirl.create(:course)}

        before {visit course_path(course)}

        it {should have_content(course.course_name)}
      end
      
      describe "course index" do
        
        before {10.times {FactoryGirl.create(:course)}}
        
        before {visit courses_path}
        
        it {should have_selector 'table'}
        it {should have_selector 'th', text: "Course Name"}
        it {should have_selector 'th', text: "Description"}
      end
    end  
  end
end