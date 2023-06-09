class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  # バリデーション
  validates :delivery_postal_code, format: {with: /\A[0-9]{7}\z/}
  validates :delivery_address,presence:true
  validates :delivery_name,presence:true
  validates :payment_method,presence:true


  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {
    payment_pending: 0,
    payment_confirmation: 1,
    in_progress: 2,
    shipping_preparation: 3,
    shipped: 4
  }
end