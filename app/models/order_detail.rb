class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :product

    enum product_order_status: {
    impossible_work: 0,
    waiting_work: 1,
    working: 2,
    finish: 3,
    }
end
