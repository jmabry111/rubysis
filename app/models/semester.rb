class Semester < ActiveRecord::Base
  
  has_many :sections
  has_many :grading_periods
  belongs_to :school_year
  
  validates :description, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  
  
  def to_s
    description
  end
end
