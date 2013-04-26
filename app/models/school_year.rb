class SchoolYear < ActiveRecord::Base
  has_many :semesters


  def to_s
    description
  end
end
