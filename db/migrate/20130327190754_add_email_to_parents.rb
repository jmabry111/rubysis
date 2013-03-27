class AddEmailToParents < ActiveRecord::Migration
  def change
    remove_column :parents, :email
    add_column :parents, :email, :string
  end
end
