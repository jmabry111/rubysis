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
    
      page.should have_content("Signed in successfully.")
    end

    describe "new teacher page" do
    
      before {visit new_teacher_path}
    
      it {should have_content("Add a teacher")}
      
      describe "create teacher" do
        
        before do
          fill_in("teacher_name", with: "Mr. Awesome")
          fill_in("teacher_work_phone", with: "2342342345")
          fill_in("teacher_email", with: "teacher@example.com")
          fill_in("teacher_addresses_attributes_0_street", with: "My Street")
          fill_in("teacher_addresses_attributes_0_city", with: "My City")
          fill_in("teacher_addresses_attributes_0_state", with: "VA")
          fill_in("teacher_addresses_attributes_0_zip", with: "98765")
          click_button "Add teacher"
        end      
        
        it {should have_content("Teacher added.")}
      end
    end
  end
end