class UserWalksController < ApplicationController
  before_action :authenticate_user!

  def new
    # @walk = Walk.find(params[:walk_id])
    # @user_walk = UserWalk.new
  end

  def create
    @walk = Walk.find(params[:walk_id])

    if current_user.user_walks.exists?(walk: @walk)
      return redirect_to @walk,
                         alert: I18n.t(local: :fr,
                                       message: :already_registered)
    end

    if @walk.user_walks.count >= @walk.number_of_dog
      redirect_to @walk, alert: I18n.t(local: :fr, message: :max_participants_reached)
      return
    end

    if @walk.date.present? && 12.hours.from_now > @walk.date
      redirect_to @walk, alert: I18n.t(local: :fr, message: :registration_deadline_passed)
      return
    end

    @user_walk = current_user.user_walks.build(walk: @walk)
    if @user_walk.save
      redirect_to @walk, notice: I18n.t(local: :fr, message: :subscribe_success)
    else
      redirect_to @walk, alert: I18n.t(local: :fr, message: :registration_failed)
    end
  end

  def destroy
    @user_walk = current_user.user_walks.find_by(walk_id: params[:walk_id])

    if @user_walk&.destroy
      redirect_to @user_walk.walk,
                  notice: I18n.t(local: :fr, message: :unsubscribe_success)
    else
      redirect_to walks_path, alert: I18n.t(local: :fr, message: :registrations_forbidden)
    end
  end
end
