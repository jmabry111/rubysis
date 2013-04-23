class AddTimeBlockToSections < ActiveRecord::Migration
  def change
    add_column :sections, :time_block, :string
  end
end
