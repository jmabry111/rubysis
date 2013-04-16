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
  
  factory :parent_with_student, :parent => :student do |student|
    student.after_create { |s| FactoryGirl.create(:parent, :student => s) }
  end

  factory :guardianship do
    student
    parent
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
  
  factory :teacher do
    name  "Mr. Teacher"
    sequence(:email) {|nn| "teacher#{nn}@example.com"}
    password  "rtyuioio567"
    password_confirmation "rtyuioio567"
    work_phone  "5557778888"
  end
  
  factory :course do
    course_name "English 101"
    course_description "BS English Class"
  end
  
  factory :section do
    course
    section_number 1
    teacher
  end
  
  factory :school_year do
    starts_on "2013-04-15"
    ends_on "2013-04-15"
    description "MyString"
  end
  
  factory :semester do
    starts_on "2013-04-15"
    ends_on "2013-04-15"
    description "MyString"
  end
  
  factory :grading_period do
    starts_on "2013-04-15"
    ends_on "2013-04-15"
    description "MyString"
    semester
  end
end