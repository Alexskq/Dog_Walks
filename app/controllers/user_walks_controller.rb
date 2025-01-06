class UserWalksController < ApplicationController
  before_action :authenticate_user!

  def new
    # @walk = Walk.find(params[:walk_id])
    # @user_walk = UserWalk.new
  end

  def create
    @walk = Walk.find(params[:walk_id])

    # Vérifier si le nombre maximum de participants n'est pas atteint
    if @walk.user_walks.count >= @walk.number_of_dog
      redirect_to @walk, alert: l(local: :fr, message: :max_participants_reached)
      return
    end

    @user_walk = current_user.user_walks.build(walk: @walk)

    @user_walk.save
    redirect_to @walk, notice: l(local: :fr, message: :subscribe_success)
    # else
    #   render @walk, status: :unprocessable_entity
    # end
  end

  def destroy
    @user_walk = current_user.user_walks.find_by(walk_id: params[:walk_id])

    if @user_walk&.destroy
      redirect_to @user_walk.walk,
                  notice: l(local: :fr, message: :unsubscribe_success)
    else
      redirect_to walks_path, alert: l(local: :fr, message: :registrations_forbidden)
    end
  end
end
