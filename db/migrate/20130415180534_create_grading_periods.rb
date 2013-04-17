class CreateGradingPeriods < ActiveRecord::Migration
  def change
    create_table :grading_periods do |t|
      t.date :starts_on
      t.date :ends_on
      t.string :description
      t.integer :semester_id

      t.timestamps
    end
  end
end
