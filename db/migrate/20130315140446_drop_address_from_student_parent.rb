class DropAddressFromStudentParent < ActiveRecord::Migration
  def change
    remove_column :students, :street_address
    remove_column :students, :city
    remove_column :students, :state
    remove_column :students, :zip
    remove_column :students, :street_address_911
    remove_column :students, :city_911
    remove_column :students, :state_911
    remove_column :students, :zip_911
    remove_column :parents, :address
    remove_column :parents, :city
    remove_column :parents, :state
    remove_column :parents, :zip
  end
end
