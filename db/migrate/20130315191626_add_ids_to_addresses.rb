class AddIdsToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :student_id, :integer
    add_column :addresses, :parent_id, :integer
  end
end
