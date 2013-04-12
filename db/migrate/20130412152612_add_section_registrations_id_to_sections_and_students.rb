class AddSectionRegistrationsIdToSectionsAndStudents < ActiveRecord::Migration
  def change
    add_column :students, :section_registration_id, :integer
    add_column :sections, :section_registration_id, :integer
  end
end
