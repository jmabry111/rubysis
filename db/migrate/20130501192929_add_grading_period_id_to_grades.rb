class AddGradingPeriodIdToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :grading_period_id, :integer
  end
end
