# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address_type "Mailing"
    street "123 Super St"
    unit "S"
    city "Metropolis"
    state "NY"
    zip "75313"
    student
  end
end
