class CreateGuardianships < ActiveRecord::Migration
  def change
    create_table :guardianships do |t|
      t.integer :student_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
