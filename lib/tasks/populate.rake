
namespace :db do 
  desc "Add Initial Dev Data"
  task populate: [:environment, 'db:migrate'] do


    teacher = Teacher.create! do |t|
        t.name = "Albert Einstein"
        t.email = "aeinstein@example.com"
        t.password = "password"
        t.password_confirmation = "password"
        t.work_phone = "5557778888"
    end

    Student.create!(first_name: "John", middle_name: "Q.", last_name: "Smith", gender: "Male", grade_level: "12", dob: "Tue, Mar 12 1990", home_phone: "5555551212", school_id: 2)

    Address.create!(address_type: "Mailing", street: "123 Super St", unit: "S", city: "Jamestown", state: "VA", zip: "75313", student_id: 1)

    Parent.create!(first_name: "John", last_name: "Smith", home_phone: "5557778888", work_phone: "5557778888")

    Guardianship.create!(parent_id: 1, student_id: 1)

    SchoolYear.create!(starts_on: "2012-08-13", ends_on: "2013-05-24", description: "2012-2013")
    SchoolYear.create!(starts_on: "2013-08-12", ends_on: "2014-05-30", description: "2013-2014")

    Semester.create!(starts_on: "2012-08-13", ends_on: "2012-12-21", description: "Fall 2012", school_year_id: 1)
    Semester.create!(starts_on: "2013-01-08", ends_on: "2013-05-24", description: "Spring 2013", school_year_id: 1)
    Semester.create!(starts_on: "2013-08-12", ends_on: "2013-12-20", description: "Fall 2013", school_year_id: 2)
    Semester.create!(starts_on: "2014-01-06", ends_on: "2014-05-30", description: "Spring 2014", school_year_id: 2)

    GradingPeriod.create!(starts_on: "2012-08-13", ends_on: "2012-09-21", description: "1st Six Weeks", semester_id: 1)
    GradingPeriod.create!(starts_on: "2012-09-24", ends_on: "2012-11-02", description: "2nd Six Weeks", semester_id: 1)
    GradingPeriod.create!(starts_on: "2012-11-05", ends_on: "2012-12-21", description: "3rd Six Weeks", semester_id: 1)
    GradingPeriod.create!(starts_on: "2012-12-21", ends_on: "2012-12-21", description: "Fall Exam", semester_id: 1)
    GradingPeriod.create!(starts_on: "2013-01-08", ends_on: "2013-02-11", description: "4th Six Weeks", semester_id: 2)
    GradingPeriod.create!(starts_on: "2013-02-12", ends_on: "2013-03-11", description: "5th Six Weeks", semester_id: 2)
    GradingPeriod.create!(starts_on: "2013-03-12", ends_on: "2013-05-24", description: "6th Six Weeks", semester_id: 2)
    GradingPeriod.create!(starts_on: "2013-05-24", ends_on: "2013-05-24", description: "Spring Exam", semester_id: 2)
    GradingPeriod.create!(starts_on: "2013-08-12", ends_on: "2013-08-20", description: "1st Six Weeks", semester_id: 3)
    GradingPeriod.create!(starts_on: "2013-08-23", ends_on: "2013-11-01", description: "2nd Six Weeks", semester_id: 3)
    GradingPeriod.create!(starts_on: "2013-11-04", ends_on: "2013-12-20", description: "3rd Six Weeks", semester_id: 3)
    GradingPeriod.create!(starts_on: "2013-12-20", ends_on: "2013-12-20", description: "Fall Exam", semester_id: 3)
    GradingPeriod.create!(starts_on: "2014-01-06", ends_on: "2014-02-14", description: "4th Six Weeks", semester_id: 4)
    GradingPeriod.create!(starts_on: "2014-02-17", ends_on: "2014-03-28", description: "5th Six Weeks", semester_id: 4)
    GradingPeriod.create!(starts_on: "2014-03-31", ends_on: "2014-05-30", description: "6th Six Weeks", semester_id: 4)
    GradingPeriod.create!(starts_on: "2014-05-30", ends_on: "2014-05-30", description: "Spring Exam", semester_id: 4)

    Course.create!(course_name: "Precalculus", course_description: "Prerequisite to Calculus I")
    Course.create!(course_name: "Calculus", course_description: "Hard Math")

    Section.create!(course_id: 1, teacher_id: 1, semester_id: 2, section_number: 1, days_of_week: ["M", "W", "F", ""], time_block: "7:45-9:15")
    Section.create!(course_id: 2, teacher_id: 1, semester_id: 2, section_number: 1, days_of_week: ["T", "TH", "F", ""], time_block: "7:45-9:15")

    TimeBlock.create!(block: "7:45-9:15")
    TimeBlock.create!(block: "9:30-11:00")
  end
end
