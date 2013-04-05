class AddFieldsToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :work_phone, :string
    add_column :teachers, :home_phone, :string
    add_column :teachers, :cell_phone, :string
  end
end
