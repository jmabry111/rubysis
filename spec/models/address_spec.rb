require 'spec_helper'

describe Address do
  
  let(:student) {FactoryGirl.create(:student)}
  before { @address = student.addresses.build(address_type: "Mailing", street: "123 Super St.", city: "Metropolis",
                                            unit: "M", state: "VA", zip: "22222")}
  
  subject {@address}
  
  it {should respond_to(:address_type)}
  it {should respond_to(:street)}
  it {should respond_to(:unit)}
  it {should respond_to(:city)}
  it {should respond_to(:state)}
  it {should respond_to(:zip)}
  it {should respond_to(:student)}
  its(:student) {should == student}
  
  it {should be_valid}

end
