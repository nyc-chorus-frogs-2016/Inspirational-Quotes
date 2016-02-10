# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dj = User.create!(username: Faker::Internet.user_name, password: "123")
20.times do
  User.create!(username: Faker::Internet.user_name, password: "123")
end
other_users = User.where.not(id: dj.id)
post = dj.postquotes.create!(title: Faker::Name.title, content: Faker::Lorem.paragraph)

19.times do 
dj.postquotes.first.comments.create!(user: other_users.sample, content: Faker::Hipster.paragraph)
end