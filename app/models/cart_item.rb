class CartItem < ApplicationRecord
  
  belongs_to :product
  belongs_to :customer
  
  
  # 消費税を求めるメソッド
  def with_tax_price
    (tax_excluded_price * 1.1).floor
  end
  
  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * quantity
  end
  
end
