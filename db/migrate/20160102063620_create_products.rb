class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.integer :quantity
      t.float :base_price
      t.float :total_price
      t.string :shorten_url

      t.timestamps null: false
    end
  end
end
