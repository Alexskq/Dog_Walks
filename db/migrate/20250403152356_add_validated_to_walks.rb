class AddValidatedToWalks < ActiveRecord::Migration[8.0]
  def change
    add_column :walks, :validated, :boolean, default: false
  end
end
