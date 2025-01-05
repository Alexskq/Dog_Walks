class PagesController < ApplicationController
  def home
    # les 3 dernieres walks créees
    @closest_walks = Walk.order('created_at DESC').limit(3)
  end
end
