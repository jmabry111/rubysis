require 'spec_helper'

describe 'Teacher Pages' do
  
  subject {page}
  
  describe "index" do
    before {visit admin_session_path}
  
    before (:each) do
      @admin = FactoryGirl.create(:admin)
      fill_in "Email", with: @admin.email
      fill_in "Password", with: @admin.password
      click_button "Sign in"
    
      page.should have_content("Name")
    end

    describe "new teacher page" do
    
      before {visit new_teacher_path}
    
      it {should have_content("Add a teacher")}
      
      describe "create teacher" do
        
        before do
          fill_in("Teacher name", with: "Mr. Awesome")
          fill_in("Work phone", with: "2342342345")
          fill_in("Email address", with: "teacher@example.com")
          click_button "Add teacher"
          page.should have_content "Teacher added."
        end      
      end
    end
  end
end