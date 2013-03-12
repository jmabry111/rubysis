class Student < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :school
end
