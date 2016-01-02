class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    order = Order.new
    long_url = params[:order][:url]
    short_url = order.generate_unique(long_url, current_user)
    obj = Crawl::Flipkart::ProductData.new(long_url)
    data = obj.crawl_data
    puts 'hee'
  end

  def create

  end

  def edit

  end

  def update

  end
end
