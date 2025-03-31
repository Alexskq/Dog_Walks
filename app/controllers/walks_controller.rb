class WalksController < ApplicationController
  def index
    @walks = filtered_walks
    @user_walk = UserWalk.new
    @markers = build_markers
  end

  def show
    @walk = Walk.find(params[:id])
  end

  def new
    @walk = Walk.new
  end

  def create
    @walk = Walk.new(walk_params)
    @walk.users << current_user if user_signed_in?

    if @walk.save
      redirect_to walks_path, notice: I18n.t('walk_created', locale: :fr)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @walk = Walk.find(params[:id])
    @walk.destroy
    redirect_to profil_path, notice: I18n.t('walk_destroyed', locale: :fr)
  end

  private

  def filtered_walks
    base_query = build_base_query
    return base_query.where('date >= ?', Date.today).order(date: :asc) unless user_signed_in?

    base_query.where.not(id: current_user.walks.select(:id))
              .where('date >= ?', Date.today)
              .order(date: :asc)
              .includes(:user_walks)
  end

  def build_base_query
    return Walk.search_by_walk_name(params[:search][:query]) if params.dig(:search, :query).present?

    Walk.all
  end

  def build_markers
    @walks.geocoded.map do |walk|
      {
        lat: walk.latitude,
        lng: walk.longitude

      }
    end
  end

  def walk_params
    params
      .require(:walk)
      .permit(:name, :address, :number_of_dog, :description, :date)
  end
end
