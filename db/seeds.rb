# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "1@1",
  password: "111111"
  )
  
User.create!(
  email: "a@a",
  password: "aaaaaa",
  last_name: "ロロノア",
  first_name: "ゾロ",
  last_name_kana: "ロロノア",
  first_name_kana: "ゾロ",
  nickname: "剣士",
  birth_date: "1990.12.22",
  withdraw_status: true
  )