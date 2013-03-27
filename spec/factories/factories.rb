FactoryGirl.define do
  factory :student do
    school_id   1
    first_name  "Clark"
    last_name   "Kent"
    gender      "Male"
    grade_level "12"
    dob         "Tue, Mar 12 2013"
    home_phone  "5555551212"
  end
end


FactoryGirl.define do
  factory :school do
    id  1
    name  "Marvel High School"
  end
end


FactoryGirl.define do
  factory :parent do
    first_name "Jor"
    last_name "El"
    home_phone "5557778888"
    work_phone "5557778888"
    student
  end
end


FactoryGirl.define do
  factory :guardianship do
    student_id 1
    parent_id 1
  end
end


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

FactoryGirl.define do
  factory :admin do
  end
end
