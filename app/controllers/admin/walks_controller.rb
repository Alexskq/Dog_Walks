class Admin::WalksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_walk, only: %i[show validate_participant invalidate_participant]

  def index
    @walks = Walk.all.order(date: :asc)
  end

  def show
    @participants = @walk.user_walks.includes(user: :dog)
  end

  def validate_participant
    user_walk = @walk.user_walks.find(params[:user_walk_id])
    user_walk.update(validated: true, invalidated: false)

    # Forcer le rechargement des données
    user_walk.reload
    @walk.reload

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update(
            "participant_status_#{user_walk.id}",
            partial: 'participant_status',
            locals: { user_walk: user_walk, walk: @walk }
          ),
          turbo_stream.update(
            "walk_status_#{@walk.id}",
            partial: 'walk_status',
            locals: { walk: @walk }
          )
        ]
      end
      format.html { redirect_to admin_walks_path, notice: 'Le participant a été validé avec succès.' }
    end
  end

  def invalidate_participant
    user_walk = @walk.user_walks.find(params[:user_walk_id])
    user_walk.update(validated: false, invalidated: true)

    # Forcer le rechargement des données
    user_walk.reload
    @walk.reload

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update(
            "participant_status_#{user_walk.id}",
            partial: 'participant_status',
            locals: { user_walk: user_walk, walk: @walk }
          ),
          turbo_stream.update(
            "walk_status_#{@walk.id}",
            partial: 'walk_status',
            locals: { walk: @walk }
          )
        ]
      end
      format.html { redirect_to admin_walks_path, notice: 'Le participant a été invalidé avec succès.' }
    end
  end

  private

  def check_admin
    return if current_user.admin?

    redirect_to root_path, alert: "Vous n'avez pas les droits d'accès."
  end

  def set_walk
    @walk = Walk.find(params[:id])
  end
end
