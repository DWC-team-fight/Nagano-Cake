# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "-------------genre create------------"
Genre.create!(name: "ケーキ")
Genre.create!(name: "焼き菓子")
Genre.create!(name: "プリン")
Genre.create!(name: "キャンディ")

puts "-------------order create------------"
# Order.create!(
#   customer_id: 1,
#   shopping_fee: 500,
#   delivery_address: "東京都港区芝公園４丁目２−８",
#   delivery_postal_code: "1111111",
#   delivery_name: "配送二郎",
#   total_amount: 1000,
#   payment_method: 1,
#   status: 1
# )

puts "-------------product create------------"

product1 = Product.create!(
genre_id: 1,
name: "チョコケーキ",
description: "程よい甘さが特徴です",
tax_excluded_price: 550
)
product1.image.attach(io: File.open(Rails.root.join('app/assets/images/sample.jpeg')), filename: 'sample.jpeg')

puts "-------------product2 create------------"

product2 = Product.create!(

  genre_id: 1,
  name: "ショートケーキ",
  description: "定番のケーキです",
  tax_excluded_price: 500
)
product2.image.attach(io: File.open(Rails.root.join('app/assets/images/shortcake.jpeg')), filename: 'shortcake.jpeg')

puts "-------------product3 create------------"

# product3 = Product.create!(
#   genre_id: 1,
#   name: "チーズケーキ",
#   description: "濃厚",
#   tax_excluded_price: 400
# )
# product3.image.attach(io: File.open(Rails.root.join('app/assets/images/cheesecake.jpeg')), filename: 'cheesecake.jpeg')

# puts "-------------product4 create------------"

# product4 = Product.create!(
#   genre_id: 1,
#   name: "タルトケーキ",
#   description: "いちごとマッチ！",
#   tax_excluded_price: 400
# )
# product4.image.attach(io: File.open(Rails.root.join('app/assets/images/tartcake.jpeg')), filename: 'tartcake.jpeg')


product5 = Product.create!(
  genre_id: 1,
  name: "モンブランケーキ",
  description: "栗が濃厚です",
  tax_excluded_price: 600
)
product5.image.attach(io: File.open(Rails.root.join('app/assets/images/montoblanccake.jpeg')), filename: 'montoblanccake.jpeg')


# product6 = Product.create!(
#   genre_id: 1,
#   name: "抹茶ケーキ",
#   description: "お茶",
#   tax_excluded_price: 400
# )
# product6.image.attach(io: File.open(Rails.root.join('app/assets/images/montoblanccake.jpeg')), filename: 'montoblanccake.jpeg')


product7 = Product.create!(
  genre_id: 1,
  name: "いちごのホールケーキ",
  description: "お誕生日にどうぞ",
  tax_excluded_price: 3000
)
product7.image.attach(io: File.open(Rails.root.join('app/assets/images/wholecake.jpeg')), filename: 'wholecake.jpeg')


# product8 = Product.create!(
#   genre_id: 1,
#   name: "ホールケーキ(チョコレート)",
#   description: "誕生日に",
#   tax_excluded_price: 1500
# )
# product8.image.attach(io: File.open(Rails.root.join('app/assets/images/wholechococake.jpeg')), filename: 'wholechococake.jpeg')


puts "--------------order create-----------------"
# Order.create!(
#   customer_id: 1,
#   shopping_fee: 800,
#   delivery_address: "東京都墨田区押上１丁目１−２",
#   delivery_postal_code: "1310045",
#   delivery_name: "墨田四郎",

# )

puts "-------------order_detail create------------"
# OrderDetail.create!(
#   order_id: 1,
#   product_id: 1,
#   quantity: 1,
#   product_order_status: 1,
#   once_price: 1000
# )

puts "-------------delivery_address create------------"
# DeliveryAddress.create!(
#   customer_id: 1,
#   postal_code: "2222222",
#   address: "東京都文京区後楽1-3-61",
#   recive_name: "東京三郎"
# )

puts "-------------cart_item create------------"
# CartItem.create!(
#   customer_id: 1,
#   product_id: 1,
#   quantity: 3
# )
# CartItem.create!(
#   customer_id: 1,
#   product_id: 1,
#   quantity: 5
# )

puts "------------admin create----------------"
Admin.create!(
  # first_name: "午藤",
  # last_name: "紅茶",
  # first_name_kana: "ゴトウ",
  # last_name_kana: "コウチャ",
  # postal_code: "125-0052",
  # address: "東京都葛飾区柴又７丁目１０−３",
  # phone_number: "0000000000",
  email: "admin@gmail.com",
  password: "adminadmin"
  )
puts "----end----"
