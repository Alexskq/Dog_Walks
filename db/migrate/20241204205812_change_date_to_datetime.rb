class ChangeDateToDatetime < ActiveRecord::Migration[8.0]
  def change
    remove_column :walks, :date
    add_column :walks, :date, :datetime
  end
end
