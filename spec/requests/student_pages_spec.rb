require 'spec_helper'

describe 'Student Pages' do
  
  subject {page}
  
  describe "new student page" do
    let(:school) {FactoryGirl.create(:school)}
    before {visit new_student_path}
    
    it {should have_content("Enter student details")}
  end
  describe "show page" do
    let(:school) {FactoryGirl.create(:school)}
    let(:student) {FactoryGirl.create(:student)}
    let!(:address1) {FactoryGirl.create(:address, student: student)}
#    let!(:parent1) {FactoryGirl.create(:parent, student: student)}
    
    before {visit student_path(student)}
    
#    it {should have_content(student.to_s)}
    
#    describe "addresses" do
#      it {should have_content(address1.street)}
##      it {should have_content(address1.city)}
#      it {should have_content(address1.state)}
#      it {should have_content(address1.zip)}
#    end
    
#    describe "parents" do
#      it {should have_content(parent1.to_s)}
#    end
  end
end