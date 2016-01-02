class CreateOrderProductTable < ActiveRecord::Migration
  def change
    create_table :order_product do |t|
      t.integer :order_id
      t.integer :product_id
    end
  end
end
