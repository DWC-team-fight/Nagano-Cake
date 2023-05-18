class Genre < ApplicationRecord
  
  has_many :product
  #dependentはいらない？
  
end
