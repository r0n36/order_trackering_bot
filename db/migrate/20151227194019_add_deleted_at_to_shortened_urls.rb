class AddDeletedAtToShortenedUrls < ActiveRecord::Migration
  def change
    add_column :shortened_urls, :deleted_at, :datetime
    add_index :shortened_urls, :deleted_at
  end
end
