class AddGenderGradeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gender, :string
    add_column :students, :grade_level, :string
  end
end
