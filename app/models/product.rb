class Product < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  belongs_to :genre


  has_one_attached :image

  def get_image(width, height)
    unless get_image.attached?
      file_path = Rils.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :tax_excluded_price, presence: true

    # 消費税を求めるメソッド
  def with_tax_excluded_price
    (tax_excluded_price * 1.08).floor
  end



end
