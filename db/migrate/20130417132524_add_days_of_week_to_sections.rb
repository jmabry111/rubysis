class AddDaysOfWeekToSections < ActiveRecord::Migration
  def change
    add_column :sections, :days_of_week, :string
  end
end
