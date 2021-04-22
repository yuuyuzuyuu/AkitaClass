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
  last_name: '秋田',
  first_name: '犬子',
  last_name_kana: 'アキタ',
  first_name_kana: 'イヌコ',
  nickname: 'わんこ',
  introduce: '秋田県でたくさんの人たちと出会いたいです！',
  birth_date: '1990.12.22',
  contact: 'http://aaa',
  instagram: 'https://www.instagram.com/',
  twitter: 'https://twitter.com/',
  facebook: 'https://www.facebook.com/',
  address: '東京',
  withdraw_status: 'false'
)

User.create!(
  email: 'b@b',
  password: 'bbbbbb',
  last_name: '東北',
  first_name: '雪太',
  last_name_kana: 'トウホク',
  first_name_kana: 'ユキタ',
  nickname: 'ゆきんこ',
  introduce: 'にかほ市で、農業を営んでいます。',
  birth_date: '1970.10.12',
  contact: 'http://bbb',
  instagram: 'https://www.instagram.com/',
  twitter: 'https://twitter.com/',
  facebook: 'https://www.facebook.com/',
  address: '秋田',
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
