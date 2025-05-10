class AddPhotoToDogs < ActiveRecord::Migration[8.0]
  def change
    remove_column :dogs, :photo, :string
  end
end
