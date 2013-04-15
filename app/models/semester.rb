class Semester < ActiveRecord::Base
#  attr_accessible :description, :ends_on, :starts_on, :school_year_id
  
  has_many :sections
  has_many :grading_periods
  belongs_to :school_year
  
  
  def to_s
    "#{description}"
  end
end
