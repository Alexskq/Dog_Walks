class WalksController < ApplicationController
  def index
    @walks = Walk.all
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
      redirect_to walks_path, notice: l(local: :fr, message: :walk_created)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def walk_params
    params
      .require(:walk)
      .permit(:name, :location, :number_of_dog, :description, :date)
  end
end
