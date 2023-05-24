class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {
    payment_pending: 0,
    payment_confirmation: 1,
    in_progress: 2,
    shipping_preparation: 3,
    shipped: 4
  }
end
