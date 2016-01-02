class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @urls = current_user.shortened_urls
  end

  def destroy_shortened
    @url_id = params[:url_id]
    Shortener::ShortenedUrl.find(@url_id).destroy
  end
end
