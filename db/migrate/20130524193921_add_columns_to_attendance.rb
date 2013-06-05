class AddColumnsToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :student_section_enrollment_id, :integer
    add_column :attendances, :status, :string
    add_column :attendances, :day, :date 
  end
end
