class DeliveryAddress < ApplicationRecord
  
  belongs_to :customer
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + recive_name
  end
  
end
