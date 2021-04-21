# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: '1@1',
  password: '111111'
)

User.create!(
  email: 'a@a',
  password: 'aaaaaa',
  last_name: 'ロロノア',
  first_name: 'ゾロ',
  last_name_kana: 'ロロノア',
  first_name_kana: 'ゾロ',
  nickname: '剣士',
  introduce: '何でも切ります！！！',
  birth_date: '1990.12.22',
  phone_number: '000-0000-0000',
  address: '日本',
  withdraw_status: 'false'
)

User.create!(
  email: 'b@b',
  password: 'bbbbbb',
  last_name: 'モンキーD',
  first_name: 'ルフィ',
  last_name_kana: 'モンキーD',
  first_name_kana: 'ルフィ',
  nickname: 'ゴム人間',
  introduce: '手が伸びます！！！',
  birth_date: '1970.10.12',
  phone_number: '000-0000-0000',
  address: '日本',
  withdraw_status: 'false'
)

Genre.create!(
  name: '求人'
)

Genre.create!(
  name: '住まい'
)

Town.create!(
  name: '秋田市'
)

Town.create!(
  name: '能代市'
)

Town.create!(
  name: '横手市'
)

Town.create!(
  name: '大館市'
)

Town.create!(
  name: '男鹿市'
)

Town.create!(
  name: '湯沢市'
)

Town.create!(
  name: '鹿角市'
)

Town.create!(
  name: '由利本荘市'
)

Town.create!(
  name: '潟上市'
)

Town.create!(
  name: '大仙市'
)

Town.create!(
  name: '北秋田市'
)

Town.create!(
  name: 'にかほ市'
)

Town.create!(
  name: '仙北市'
)

Town.create!(
  name: '小坂町'
)

Town.create!(
  name: '上小阿仁村'
)

Town.create!(
  name: '藤里町'
)

Town.create!(
  name: '三種町'
)

Town.create!(
  name: '八峰町'
)

Town.create!(
  name: '五城目町'
)

Town.create!(
  name: '八郎潟町'
)

Town.create!(
  name: '井川町'
)

Town.create!(
  name: '大潟村'
)

Town.create!(
  name: '美郷町'
)

Town.create!(
  name: '羽後町'
)

Town.create!(
  name: '東成瀬村'
)
