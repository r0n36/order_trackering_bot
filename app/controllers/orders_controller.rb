class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    order = Order.new
    long_url = params[:order][:url]
    unique_key = order.generate_unique(long_url, current_user)
    obj = Crawl::Flipkart::ProductData.new(long_url)
    product_attributes = obj.product_data
    total_price = order.calculate_total_price(product_attributes[:base_price], product_attributes[:weight], false)
    product_attributes.merge!(total_price: total_price, shorten_url: "#{root_url}#{unique_key}")
    @product = Product.create product_attributes.except(:weight, :img_url, :seller_name)
  end

  def create

  end

  def edit

  end

  def update

  end
end
