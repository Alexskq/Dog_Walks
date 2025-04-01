class DogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dog, only: [:update]

  def update
    if @dog.update(dog_params)
      redirect_to profil_path, notice: 'Les informations de votre chien ont été mises à jour avec succès.'
    else
      redirect_to profil_path, alert: 'Une erreur est survenue lors de la mise à jour.'
    end
  end

  private

  def set_dog
    @dog = current_user.dog
  end

  def dog_params
    params.require(:dog).permit(:name, :species, :date_of_birth, :description)
  end
end
