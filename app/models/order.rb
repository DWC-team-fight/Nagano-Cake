class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {
    payment_pending: 1,
    payment_confirmation: 2,
    in_progress: 3,
    shipping_preparation: 4,
    shipped: 5
  }
end
