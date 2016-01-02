class ProductImage < ActiveRecord::Base
  belongs_to :product
  validate :img_url, presence: ture
end
