class FixColumnNameInAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :type
    add_column :addresses, :address_type, :string
  end
end
