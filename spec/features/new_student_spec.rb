require 'spec_helper'

  feature 'student_applies' do
    scenario 'without_errors' do
      School.create(name: "Beverly High School")
      visit "root"
      page.should have_content "Enter student information"
      
      select "Beverly High School", :from => "School"
      fill_in "First name", with: "Jethro"
      fill_in "Last name", with: "Clampett"
	    fill_in "EMPL ID", with: "23456"
      choose "Male"
      choose "12"
      fill_in "Date of Birth", with: "Mon, Feb 01 1995"
      fill_in "Street Address or PO Box", with: "PO Box 1"
      fill_in "City", with: "Beverly Hills"
      fill_in "State", with: "CA"
      fill_in "5 Digit Zip Code", with: "90210"
      fill_in "Street Address", with: "12 Beverly Way"
      fill_in "City 911", with: "Beverly Hills"
      fill_in "State 911", with: "CA"
      fill_in "5 Digit Zip Code 911", with: "90210"
      fill_in "Home phone", with: "555-765-0987"
      fill_in "Cell phone", with: "555-555-1212"
	  fill_in "Email", with: "jed@clampett.com"
      click_button "Submit new student"
      page.should have_content ("Information was successfully submitted")
    end
  end