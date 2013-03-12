class AddNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :first_name, :string
    add_column :students, :middle_name, :string
    add_column :students, :last_name, :string
    add_column :students, :street_address, :string
    add_column :students, :city, :string
    add_column :students, :state, :string
    add_column :students, :zip, :string
    add_column :students, :street_address_911, :string
    add_column :students, :city_911, :string
    add_column :students, :state_911, :string
    add_column :students, :zip_911, :string   
    add_column :students, :home_phone, :string
    add_column :students, :cell_phone, :string
    add_column :students, :email, :string
    add_column :students, :empl, :string
    add_column :students, :dob, :date
    add_column :students, :medical_issues, :date
  end
end
