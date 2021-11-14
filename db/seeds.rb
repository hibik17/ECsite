# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EndUser.create!(
  first_name:"テスト",
  family_name:"太郎",
  first_name_kana:"テスト",
  family_name_kana:"タロウ",
  email:"testtarou@test",
  address:"testtesttest",
  zip_code:"0000000",
  phone_number:"00000000000",
  password:"testtest"
  )

Admin.create!(
  email: 'a@a',
  password: 'aaaaaa',
  )

Genre.create!(
  name: "ケーキ"
  )

Genre.create!(
  name: "クッキー"
  )

Item.create!(
  name: "チーズケーキ",
  genre_id: 1,
  explanation: "美味しいチーズケーキです",
  price: 500,
  is_sold: true
  )

Item.create!(
  name: "バタークッキー",
  genre_id: 2,
  explanation: "美味しいクッキーです",
  price: 300,
  is_sold: true
  )

Address.create!(
  end_user_id: 1,
  zip_code: "0010001",
  address: "テスト用住所1",
  name: "テスト1"
  )

Address.create!(
  end_user_id: 1,
  zip_code: "0020002",
  address: "テスト用住所2",
  name: "テスト2"
  )