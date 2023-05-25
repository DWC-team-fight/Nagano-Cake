class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  
  validates :postal_code, presence:true, format: {with: /\A[0-9]{7}\z/}
  validates :first_name,presence:true
  validates :last_name,presence:true
  validates :first_name_kana,presence:true
  validates :last_name_kana,presence:true
  validates :address,presence:true
  validates :phone_number,presence:true, format: {with: /\A0\d{9,10}\z/}
  validates :email,presence:true
   
end
