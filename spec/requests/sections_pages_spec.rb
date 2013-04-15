require 'spec_helper'

describe 'Sections Pages' do
  
  subject {page}
  
  describe "index" do
    before {visit admin_session_path}
  
    before (:each) do
      @admin = FactoryGirl.create(:admin)
      fill_in "Email", with: @admin.email
      fill_in "Password", with: @admin.password
      click_button "Sign in"
    
      page.should have_content("Signed in successfully.")
    end
    
    describe "new course section page" do
      
      let(:course) {FactoryGirl.create(:course)}
      let!(:teacher) {FactoryGirl.create(:teacher)}
      
      before {visit new_course_section_path(course)}
      
      it {should have_content("Section Created")}
      
      before do
        select teacher.name, :from => "Teacher"
        select "1", :from => "Section number"
        click_button "Create Section"
      end
      it {should have_content(course.course_name)}
      
    end
  end
end