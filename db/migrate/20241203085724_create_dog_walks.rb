class CreateDogWalks < ActiveRecord::Migration[8.0]
  def change
    create_table :dog_walks do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :walk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
