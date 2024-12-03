class CreateWalks < ActiveRecord::Migration[8.0]
  def change
    create_table :walks do |t|
      t.string :name
      t.string :location
      t.integer :number_of_dog

      t.timestamps
    end
  end
end
