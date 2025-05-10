class AddAdminMessageToWalks < ActiveRecord::Migration[8.0]
  def change
    add_column :walks, :admin_message, :text
  end
end
