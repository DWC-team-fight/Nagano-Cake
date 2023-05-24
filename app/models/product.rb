class Product < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  belongs_to :genre


  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :tax_excluded_price, presence: true

    # 消費税を求めるメソッド
  def with_tax_excluded_price
    (tax_excluded_price * 1.08).floor
  end



end
