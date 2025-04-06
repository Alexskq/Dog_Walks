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
    base_query = base_query.where('date >= ?', Date.today.beginning_of_day).order(date: :asc)

    if params[:today].present?
      base_query = base_query.where('date >= ? AND date < ?',
                                    Date.today.beginning_of_day,
                                    Date.today.end_of_day)
    end

    return base_query unless user_signed_in?

    base_query.where.not(id: current_user.walks.select(:id))
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
        lng: walk.longitude,
        info_window_html: render_to_string(partial: 'shared/info_window', locals: { walk: walk }, formats: [:html])
      }
    end
  end

  def walk_params
    params
      .require(:walk)
      .permit(:name, :address, :number_of_dog, :description, :date)
  end
end
