# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
  User.create!(email: "admin@example.com", password: "12345678", password_confirmation: "12345678")
end

user = User.first
post_one = user.posts.create!(title: "Life is brilliance!", body: "Today bla bla...", status: "published")
post_two = user.posts.create!(title: "How I met Ted Mosby", body: "Kids, 20 years ago...")

happy_tag = Tag.create!(text: "happy")
diary_tag = Tag.create!(text: "MyDiary")

post_one.tags << happy_tag
post_one.tags << diary_tag
post_two.tags << diary_tag
