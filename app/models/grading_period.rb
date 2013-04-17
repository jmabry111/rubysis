class GradingPeriod < ActiveRecord::Base
  attr_accessible :description, :ends_on, :semester_id, :starts_on
  
  belongs_to :semester
end
