class WalksController < ApplicationController
  def index
    @walks = if params[:search] && params[:search][:query].present?
               Walk.search_by_walk_name(params[:search][:query])
             else
               Walk.all
             end
    @user_walk = UserWalk.new
  end

  def show
    @walk = Walk.find(params[:id])
  end

  def new
    @walk = Walk.new
  end

  def create
    @walk = Walk.new(walk_params)
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

  def walk_params
    params
      .require(:walk)
      .permit(:name, :location, :number_of_dog, :description, :date)
  end
end
