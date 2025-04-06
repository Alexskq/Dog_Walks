class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :set_locale

  helper_method :pending_walks_count, :today_walks_count

  def set_locale
    I18n.locale = I18n.default_locale
  end

  private

  def pending_walks_count
    return 0 unless current_user&.admin?

    Walk.where(validated: false).count
  end

  def today_walks_count
    Walk.where(date: Date.today.all_day).count
  end
end
