class AddSchoolYearIdToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :school_year_id, :integer
  end
end
