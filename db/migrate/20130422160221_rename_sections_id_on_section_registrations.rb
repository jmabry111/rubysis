class RenameSectionsIdOnSectionRegistrations < ActiveRecord::Migration
  def change
    remove_column :section_registrations, :sections_id
    add_column :section_registrations, :section_id, :integer
  end
end
