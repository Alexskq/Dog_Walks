class RemoveLatitudeAndLongitudeToWalks < ActiveRecord::Migration[8.0]
  def change
    remove_column :walks, :latitude, :float
    remove_column :walks, :longitude, :float
  end
end
