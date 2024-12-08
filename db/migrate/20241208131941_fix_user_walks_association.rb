class FixUserWalksAssociation < ActiveRecord::Migration[8.0]
  def change
    # Supprimez la contrainte de clé étrangère incorrecte
    remove_foreign_key :user_walks, column: :user_id

    # Ajoutez la bonne contrainte de clé étrangère vers la table users
    add_foreign_key :user_walks, :users
  end
end
