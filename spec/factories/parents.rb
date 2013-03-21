# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parent do
    first_name "Jor"
    last_name "El"
    address "7 Krypton Dr"
    city "Krypton"
    state "KR"
    zip "77777"
    home_phone "5557778888"
    work_phone "5557778888"
  end
end
