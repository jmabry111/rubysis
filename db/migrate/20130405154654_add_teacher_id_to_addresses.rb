class AddTeacherIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :teacher_id, :integer
  end
end
