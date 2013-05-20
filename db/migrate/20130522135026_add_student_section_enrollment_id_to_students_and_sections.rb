class AddStudentSectionEnrollmentIdToStudentsAndSections < ActiveRecord::Migration
  def change
    add_column :students, :student_section_enrollment_id, :integer
    add_column :sections, :student_section_enrollment_id, :integer
    remove_column :students, :section_registration_id
    remove_column :sections, :section_registration_id
  end
end
