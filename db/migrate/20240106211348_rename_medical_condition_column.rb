class RenameMedicalConditionColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :medical_condition, :description
  end
end
