require 'spec_helper'

describe Teacher do
  before do
    @teacher = FactoryGirl.create(:teacher)
  end
  
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:work_phone)}
  
end
