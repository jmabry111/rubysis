require 'spec_helper'

describe Student do
  
  before do
    @school = FactoryGirl.create(:school)
    @student = Student.new(school: @school, first_name:"Clark", last_name:"Kent", gender: "Male",
                            grade_level: "12", dob:"Tue, Mar 12 2013", home_phone:"5555551212")
  end
  
  subject {@student}
  
  it {should respond_to(:school)}
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:gender)}
  it {should respond_to(:grade_level)}
  it {should respond_to(:dob)}
  it {should respond_to(:home_phone)}
  
  it {should be_valid}
  
  describe "when name is not present" do
    before {@student.first_name = " " && @student.last_name = " "}
    it {should_not be_valid}
  end
  
end
