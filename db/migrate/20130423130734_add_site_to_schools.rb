class AddSiteToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :site, :string
  end
end
