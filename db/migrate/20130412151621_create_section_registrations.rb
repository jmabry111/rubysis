class CreateSectionRegistrations < ActiveRecord::Migration
  def change
    create_table :section_registrations do |t|
      t.integer :student_id
      t.integer :sections_id

      t.timestamps
    end
  end
end
