# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create!(name: "Bassett High School", address: "85 Riverside Dr", city: "Bassett", state: "VA", zip: "24055", site: "NCI")
School.create!(name: "Magna Vista High School", address: "701 Magna Vista School Rd", city: "Ridgeway", state: "VA", zip: "24148", site: "NCI")
School.create!(name: "Martinsville High School", address: "351 Commonwealth Blvd E", city: "Martinsville", state: "VA", zip: "24112", site: "NCI")
School.create!(name: "George Washington High School", address: "701 Broad St", city: "Danville", state: "VA", zip: "24541", site: "IALR")
School.create!(name: "Galileo High School", address: "230 S Ridge St", city: "Danville", state: "VA", zip: "24541", site: "IALR")
School.create!(name: "Tunstall High School", address: "100 Trojan Cir", city: "Tunstall", state: "VA", zip: "24549", site: "IALR")
School.create!(name: "Chatham High School", address: "100 Chatham Cavalier Cir", city: "Chatham", state: "VA", zip: "24531", site: "IALR")
School.create!(name: "Dan River High School", address: "100 Dan River Wildcat Cir", city: "Dan River", state: "VA", zip: "24586", site: "IALR")
School.create!(name: "Gretna High School", address: "100 Gretna Hawk Cir", city: "Gretna", state: "VA", zip: "24557", site: "IALR")

admin = Admin.create! do |a|
   a.email = "jmabry@mymabry.com"
   a.password = "password1"
   a.password_confirmation = "password1"
end