class AddDifferentColsToWalk < ActiveRecord::Migration[8.0]
  def change
    add_column :walks, :date, :date
    add_column :walks, :time, :time
  end
end
