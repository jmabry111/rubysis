# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grading_period do
    starts_on "2013-04-15"
    ends_on "2013-04-15"
    description "MyString"
    semester_id 1
  end
end
