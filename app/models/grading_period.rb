class GradingPeriod < ActiveRecord::Base
  
  belongs_to :semester
  
  validates :description, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  
  def to_s
    description
  end
end
