class RenameDogWalksTable < ActiveRecord::Migration[8.0]
  def change
    rename_table :dog_walks, :user_walks
    rename_column :user_walks, :dog_id, :user_id
  end
end
