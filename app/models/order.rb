class Order < ActiveRecord::Base
  CURRENCY = 'BDT'
  TAX_PERCENTAGE = 15

  has_and_belongs_to_many :products
  belongs_to :user
  # validate :total_price, :status, :estimated_date, :tracking_id, :confirmation_phone_number, presence: true

  def generate_unique(long_url, user)
    uri = URI.parse(long_url)

    uri = "http://#{uri.to_s}" unless valid? uri
    return if uri.to_s.blank?
    Shortener::ShortenedUrl.generate(uri, owner: user).unique_key unless uri.to_s.blank?
  end

  def calculate_total_price(base_price, weight, tax)
    product_cost(base_price) + cargo_cost(weight) + (tax ? taxes(base_price) : 0)
  end

  def product_cost(base_price)
    rate = currency_conversion_rate(base_price)
    base_price * rate
  end

  def cargo_cost(weight_in_gm)
    # 60tk/100gm
    (weight_in_gm / 100) * 60
  end

  def taxes(base_price)
    (base_price * TAX_PERCENTAGE) / 100
  end

  def currency_conversion_rate(base_price)
    case base_price
      when 1000..4999
        1.45
      when 5000..19999
        1.40
      when 20000..49999
        1.35
      else
        if base_price >= 50000
          1.3
        elsif base_price <= 999
          1.5
        end
    end
  end

  def valid?(uri)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end
end
