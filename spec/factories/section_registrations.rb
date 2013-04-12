# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :section_registration, :class => 'SectionRegistrations' do
    student_id 1
    sections_id 1
  end
end
