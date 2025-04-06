class PagesController < ApplicationController
  def home
    @user_walk = current_user.user_walks.build(walk: @walk)
    @dropdown_title = 'Toutes les balades'

    # Déterminer le type de vue et le titre en fonction du paramètre
    if params[:view_type] == 'my_walks' && user_signed_in?
      @closest_walks = current_user.user_walks.includes(:walk).map(&:walk).sort_by(&:created_at).reverse
      @dropdown_title = 'Mes balades inscrites'
    else
      @closest_walks = Walk.order('created_at DESC').limit(3)
      @dropdown_title = 'Toutes les balades'
    end

    @walks = Walk.all
    @markers = @walks.geocoded.map do |walk|
      {
        lat: walk.latitude,
        lng: walk.longitude,
        info_window_html: render_to_string(partial: 'shared/info_window', locals: { walk: walk }, formats: [:html])
      }
    end
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
