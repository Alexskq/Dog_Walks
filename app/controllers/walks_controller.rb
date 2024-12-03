class WalksController < ApplicationController
  def index
    @walks = Walk.all
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
      redirect_to walks_path, notice: 'Balade créee avec succès'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def walk_params
    params
      .require(:walk)
      .permit(:name, :location, :number_of_dog, :description, :date, :time)
  end
end
