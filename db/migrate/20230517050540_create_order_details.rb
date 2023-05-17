class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantify
      t.integer :product_order_status
      t.integer :once_price

      t.timestamps
    end
  end
end
