class GradingPeriod < ActiveRecord::Base
  
  belongs_to :semester
  
  def to_s
    description
  end
end
