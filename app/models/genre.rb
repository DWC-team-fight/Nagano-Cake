class Genre < ApplicationRecord

  has_many :product
  #dependentはいらない？
  validates :name, presence:true, uniqueness: true

end
