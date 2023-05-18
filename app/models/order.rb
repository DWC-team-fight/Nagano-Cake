class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  
end
