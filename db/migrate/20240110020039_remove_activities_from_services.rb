class RemoveActivitiesFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :walking
    remove_column :services, :styling
    remove_column :services, :medication
    remove_column :services, :feeding
  end
end
