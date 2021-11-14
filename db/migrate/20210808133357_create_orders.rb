class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :total_price
      t.string :zipcode
      t.string :address
      t.integer :shipping_fee
      t.string :address_name
      t.integer :payment_method, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
