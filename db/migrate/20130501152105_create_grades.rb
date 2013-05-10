class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :numerical_grade
      t.integer :student_section_enrollment_id

      t.timestamps
    end
  end
end
