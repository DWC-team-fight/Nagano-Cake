class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  validates :quantity,presence:true

  # 小計を求めるメソッド
  def subtotal
    product.with_tax_excluded_price * quantity
  end

end
