class AddDescriptionToWalk < ActiveRecord::Migration[8.0]
  def change
    add_column :walks, :description, :text
  end
end
