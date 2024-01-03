class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.boolean :walking
      t.boolean :styling
      t.boolean :medication
      t.boolean :feeding
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
