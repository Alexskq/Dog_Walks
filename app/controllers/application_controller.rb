class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
