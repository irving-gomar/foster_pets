class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :telephone, :string
    add_column :users, :role, :integer
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
