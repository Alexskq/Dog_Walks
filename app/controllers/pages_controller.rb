class PagesController < ApplicationController
  def home
    # les 3 dernieres walks créees
    @closest_walks = Walk.order('created_at DESC').limit(3)
  end

  def profil
    @user = current_user
    @walks = current_user.walks
  end

  def destroy_user_walk
    @user_walk = current_user.user_walks.find_by(walk_id: params[:walk_id])

    if @user_walk&.destroy
      redirect_to profil_path,
                  notice: I18n.t(local: :fr, message: :unsubscribe_success)
    else
      redirect_to walks_path, alert: I18n.t(local: :fr, message: :registrations_forbidden)
    end
  end
end
