class AddSpeciesAndDateOfBirthAndDescriptionToDog < ActiveRecord::Migration[8.0]
  def change
    add_column :dogs, :species, :string
    add_column :dogs, :date_of_birth, :date
    add_column :dogs, :description, :text
  end
end
