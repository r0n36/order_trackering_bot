class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :total_price
      t.integer :status
      t.datetime :estimated_date
      t.text :shipping_address
      t.text :comment
      t.string :tracking_id
      t.string :confirmation_phone_number
      t.timestamps null: false
    end
  end
end
