class School < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :students
end
