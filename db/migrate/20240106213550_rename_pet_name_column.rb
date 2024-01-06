class RenamePetNameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :pet_name, :name
  end
end
