class AddActivityToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :activity, :string
  end
end
