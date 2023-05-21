class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shopping_fee
      t.string :delivery_address
      t.string :delivery_postal_code
      t.string :delivery_name
      t.integer :total_amount
      t.integer :payment_method
      t.integer :status
      t.timestamps
    end
  end
end
