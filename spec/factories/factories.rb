FactoryGirl.define do
  factory :student do
    school
    first_name  "Clark"
    last_name   "Kent"
    gender      "Male"
    grade_level "12"
    dob         "Tue, Mar 12 2013"
    home_phone  "5555551212"
  end
  
  factory :school do
    name  "Marvel High School"
  end
  
  factory :parent do
    first_name "Jor"
    last_name "El"
    home_phone "5557778888"
    work_phone "5557778888"
    student
  end

  factory :guardianship do
    student_id 1
    parent_id 1
  end
  
  factory :address do
    address_type "Mailing"
    street "123 Super St"
    unit "S"
    city "Metropolis"
    state "NY"
    zip "75313"
    student
  end
  
  factory :admin do
    sequence(:email) {|nn| "person#{nn}@example.com" }
    password  "password1"
    password_confirmation "password1"
  end
end