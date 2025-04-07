class AddPhotoToDogs < ActiveRecord::Migration[8.0]
  def change
    add_column :dogs, :photo, :string
  end
end
