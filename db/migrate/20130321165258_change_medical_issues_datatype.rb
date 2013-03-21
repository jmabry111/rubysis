class ChangeMedicalIssuesDatatype < ActiveRecord::Migration
  def change
    change_column :students, :medical_issues, :string
  end
end
