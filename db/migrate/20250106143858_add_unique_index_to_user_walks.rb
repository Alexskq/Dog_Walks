class AddUniqueIndexToUserWalks < ActiveRecord::Migration[8.0]
  def change
    add_index :user_walks, [:user_id, :walk_id], unique: true
  end
end
