class AddValidationToUserWalks < ActiveRecord::Migration[8.0]
  def change
    add_column :user_walks, :validated, :boolean
    add_column :user_walks, :invalidated, :boolean
  end
end
