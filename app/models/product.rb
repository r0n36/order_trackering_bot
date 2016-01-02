class Product < ActiveRecord::Base
  has_many :product_images

  # validate :url, :quantity, :base_price, :total_price, :shorten_url, presence: true
end
