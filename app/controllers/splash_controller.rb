class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'splash'

  def index
    # Le splash screen sera affiché pendant 5 secondes
    # La redirection sera gérée côté client avec JavaScript
  end
end
