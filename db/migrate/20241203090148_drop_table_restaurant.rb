class DropTableRestaurant < ActiveRecord::Migration[8.0]
  def change
    drop_table :restaurants
  end
end
