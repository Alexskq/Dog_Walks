class Admin::WalksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_walk, only: %i[show validate invalidate]

  def index
    @walks = Walk.all.order(date: :asc)
  end

  def show
    @participants = @walk.users.includes(:dog)
  end

  def validate
    @walk.update(validated: true, invalidated: false)
    redirect_to admin_walks_path, notice: 'La balade a été validée avec succès.'
  end

  def invalidate
    @walk.update(validated: false, invalidated: true)
    redirect_to admin_walks_path, notice: 'La balade a été invalidée avec succès.'
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
