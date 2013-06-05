require 'spec_helper'

describe 'Student Pages' do
  
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
  
    describe "new student page" do
    

      let(:school) {FactoryGirl.create(:school)}

      before {visit new_student_path}
    
      it {should have_content("Enter student details")}
    end
    
    
    describe "show page" do
      let(:school) {FactoryGirl.create(:school)}
      let(:student) {FactoryGirl.create(:student)}
      let!(:address1) {FactoryGirl.create(:address, student: student)}
#      let!(:parent1) {FactoryGirl.create(:parent_with_student)}
    
      before {visit student_path(student)}
    
      it {should have_content(student.name)}
    
      describe "addresses" do
        it {should have_content(address1.street)}
        it {should have_content(address1.city)}
        it {should have_content(address1.state)}
        it {should have_content(address1.zip)}
      end
      
      describe "visit new address page" do
        
        before {visit new_student_address_path(student)}
        
        it {should have_content(student.name)}
        it {should have_content("Street address")}
        it {should have_content("Zip")}
        
        describe "create address" do
          before {visit new_student_address_path(student)}

          before do
            fill_in("address_street", with: "My street")
            fill_in("address_city", with: "City")
            fill_in("address_state", with: "ST")
            fill_in("address_zip", with: "99999")
            click_button("Save address")
          end
          
          it {should have_content("Address Entered.")}
        end
      end
      
      describe "visit edit address page" do
        
        before {visit edit_student_address_path(student, address1)}
        
        it {should have_content(student.name)}
        it {should have_content("Street address")}
        it {should have_content("Zip")}
        
        describe "edit address" do
          before {visit edit_student_address_path(student, address1)}

          before do
            fill_in("address_street", with: "My street")
            fill_in("City", with: "City")
            fill_in("State", with: "ST")
            fill_in("Zip", with: "99999")
            click_button("Save changes")
          end
          it {should have_content("Address updated.")}
        end
      end
    
  #    describe "parents" do
  #      it {should have_content(parent1.to_s)}
  #    end
  
    end
  end
end