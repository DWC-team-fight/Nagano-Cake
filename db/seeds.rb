# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "-------------customer create------------"
Customer.create!(
  first_name: "練習",
  last_name: "太郎",
  first_name_kana: "レンシュウ",
  last_name_kana: "タロウ",
  postal_code: "0000000",
  address: "千代田区永田町１丁目７−１",
  phone_number: "0000000000",
  email: "test@gmail.com",
  password: "testtest"
)

puts "-------------genre create------------"
Genre.create!(name: "ケーキ")

Order.create!(
  customer_id: 1,
  shipping_fee: 500,
  delivery_address: "東京都港区芝公園４丁目２−８",
  delivery_postal_code: "1111111",
  delivery_name: "配送二郎",
  total_amount: 1000,
  payment_method: 1,
  status: 1
)

puts "-------------product create------------"
Product.create!(
  genre_id: 1,
  name: "チョコケーキ",
  description: "甘い",
  tax_excluded_price: 1000
)

puts "-------------order_detail create------------"
OrderDetail.create!(
  order_id: 1,
  product_id: 1,
  quantity: 1,
  product_order_status: 1,
  once_price: 1000
)

puts "-------------delivery_address create------------"
DeliveryAddress.create!(
  customer_id: 1,
  postal_code: "2222222",
  address: "東京都文京区後楽1-3-61",
  recive_name: "東京三郎"
)

puts "-------------cart_item create------------"
CartItem.create!(
  customer_id: 1,
  product_id: 1,
  quantity: 3
)

puts "----end----"
