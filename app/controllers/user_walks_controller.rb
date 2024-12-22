class UserWalksController < ApplicationController
  before_action :authenticate_user!

  def new
    @walk = Walk.find(params[:walk_id])
    @user_walk = UserWalk.new
  end

  def create
    @walk = Walk.find(params[:walk_id])

    # Vérifier si le nombre maximum de participants n'est pas atteint
    if @walk.user_walks.count >= @walk.number_of_dog
      redirect_to @walk, alert: "Cette balade est complète."
      return
    end

    @user_walk = current_user.user_walks.build(walk: @walk)

    if @user_walk.save
      redirect_to @walk, notice: "Vous êtes inscrit à cette balade."
    else
      render :new
    end
  end

  def destroy
    @user_walk = current_user.user_walks.find_by(walk_id: params[:walk_id])

    if @user_walk&.destroy
      redirect_to @user_walk.walk,
                  notice: "Vous avez été désinscrit de cette balade."
    else
      redirect_to walks_path, alert: "Impossible de vous désinscrire."
    end
  end
end
