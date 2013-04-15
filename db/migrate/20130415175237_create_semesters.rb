class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.date :starts_on
      t.date :ends_on
      t.string :description

      t.timestamps
    end
  end
end
