class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user
  # validate :total_price, :status, :estimated_date, :tracking_id, :confirmation_phone_number, presence: true

  def generate_unique(long_url, user)
    uri = URI.parse(long_url)

    uri = "http://#{uri.to_s}" unless valid? uri
    return if uri.to_s.blank?
    Shortener::ShortenedUrl.generate(uri, owner: user).unique_key unless uri.to_s.blank?
  end

  def valid?(uri)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end
end
