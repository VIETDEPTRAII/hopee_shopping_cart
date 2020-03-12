# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Shop
Shop.create!(name: 'THANH VIET ELECTRONIC',
             email: 'nguyenthanhviet31031998@gmail.com',
             password: '1234567@@',
             password_confirmation: '1234567@@',
             phone: '0904716299',
             address: 'Q6,TP.HCM',
             description: 'Shop sell electronic stuff',
             tax_code: '123ABC')

# Product
65.times do |n = 0|
  name = "Product #{n + 1}"
  Product.create!(name: name,
                  description: 'Test',
                  price: 1_000_000,
                  shop_id: 1,
                  total: 50)
end
