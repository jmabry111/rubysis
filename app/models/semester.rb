class Semester < ActiveRecord::Base
  
  has_many :sections
  has_many :grading_periods
  belongs_to :school_year
  
  
  def to_s
    description
  end
end
