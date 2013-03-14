# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parent do
    first_name "MyString"
    last_name "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    home_phone "MyString"
    work_phone "MyString"
  end
end
