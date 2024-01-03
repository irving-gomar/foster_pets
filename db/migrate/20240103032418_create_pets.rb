class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :breed
      t.string :pet_name
      t.date :date_of_birth
      t.float :weight
      t.integer :size
      t.text :medical_condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
