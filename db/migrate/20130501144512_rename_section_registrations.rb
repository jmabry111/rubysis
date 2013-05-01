class RenameSectionRegistrations < ActiveRecord::Migration
  def change
    rename_table :section_registrations, :student_section_enrollments
  end
end
