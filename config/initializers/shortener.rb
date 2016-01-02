Shortener.unique_key_length = 6
Shortener.forbidden_keys.concat %w(terms promo)
Shortener::ShortenedUrl.class_eval do
  acts_as_paranoid
end