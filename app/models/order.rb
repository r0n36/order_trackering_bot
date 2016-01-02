class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user
  validate :total_price, :status, :estimated_date, :tracking_id, :confirmation_phone_number, presence: true
end
