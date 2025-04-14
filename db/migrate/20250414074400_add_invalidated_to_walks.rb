class AddInvalidatedToWalks < ActiveRecord::Migration[8.0]
  def change
    add_column :walks, :invalidated, :boolean, default: false
  end
end
