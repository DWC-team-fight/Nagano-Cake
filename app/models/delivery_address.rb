class DeliveryAddress < ApplicationRecord
  
  belongs_to :customer
  
  validates :recive_name,presence:true
  validates :postal_code, presence:true,format: {with: /\A[0-9]{7}\z/}
  validates :address,presence:true
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + recive_name
  end
  
end
