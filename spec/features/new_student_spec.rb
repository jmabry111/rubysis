require 'spec_helper'

  feature 'student_applies' do
    scenario 'without_errors' do
      School.create(name: "Beverly High School")
      visit "root"
      page.should have_content "Enter student details"
      
      select "Beverly High School", :from => "School"
      fill_in "First name", with: "Jethro"
      fill_in "Last name", with: "Clampett"
	    fill_in "EMPL ID", with: "23456"
      choose "Male"
      choose "12"
      fill_in "Date of Birth", with: "Mon, Feb 01 1995"
      fill_in "Home phone", with: "555-765-0987"
      fill_in "Cell phone", with: "5555551223"
	    fill_in "Email", with: "jed@clampett.com"
	    select "Mailing Address"
     fill_in "Street Address or PO Box", with: "PO Box 1"
      fill_in "City", with: "Beverly Hills"
      fill_in "State", with: "CA"
      fill_in "5 Digit Zip Code", with: "90210"
      fill_in "parents_first_name", with: "Jed"
      fill_in "parents_last_name", with: "Clampett"
      select "Physical Address", :from => "parents_addresses_type"
      fill_in "parents_addresses_street", with: "12 Beverly Way"
      fill_in "parents_addresses_city", with: "Beverly Hills"
      fill_in "parents_addresses_state", with: "CA"
      fill_in "parents_addresses_zip", with: "90210"
      fill_in "parents_home_phone", with: "23434547"
      fill_in "parents_work_phone", with: "234-234-8765"
      fill_in "Medical issues", with: "Outrageous hunger pangs!"
     click_button "Submit new student"
      page.should have_content ("PO Box 1")
      page.should have_content ("Jed")
      save_and_open_page
    end
  end