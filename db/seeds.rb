# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Admin123",
             email: "admin@gmail.com",
             password:              "admin123",
             password_confirmation: "admin123",
             activated: true,
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true)
end
99.times do |n|
  name  = Faker::Name.name
  introduction = Faker::Lorem.paragraphs(paragraph_count = 20, supplemental = false)
  web_rate = 3.5
  Book.create!(name:  name,
               introdution: introduction,
               web_ratting: web_rate)
end

99.times do |n|
  book_id = Faker::Number.between(from = 1.00, to = 100.00)
  genre_id = Faker::Number.between(from = 1.00, to = 10.00)
  BookGenre.create!(book_id: book_id,
                      genre_id: genre_id)
end

99.times do |n|
  follower_id = Faker::Number.between(from = 1.00, to = 100.00)
  followed_id = Faker::Number.between(from = 1.00, to = 100.00)
  Relationship.create!(follower_id: follower_id,
                        followed_id: followed_id)
end

99.times do |n|
  title  = Faker::Name.name
  user_id = Faker::Number.between(from = 1.00, to = 100.00)
  book_id = Faker::Number.between(from = 1.00, to = 100.00)
  content = Faker::Lorem.paragraphs(paragraph_count = 20, supplemental = false)
  Review.create!(user_id: user_id,
                book_id: book_id,
                content: content,
                title: title)
end
Genre.create(name: "Historical", id:7)
Genre.create(name: "Action", id:1)
Genre.create(name: "Shounen", id:13)
Genre.create(name: "Adventure", id:2)
Genre.create(name: "Mecha", id:8)
Genre.create(name: "Slice of Life", id:14)
Genre.create(name: "Comedy", id:3)
Genre.create(name: "Romance", id:9)
Genre.create(name: "Sports", id:15)
Genre.create(name: "Drama", id:4)
Genre.create(name: "Science Fiction", id:10)
Genre.create(name: "Ecchi", id:5)
Genre.create(name: "Seinen/Mature", id:11)
Genre.create(name: "Fantasy", id:6)
Genre.create(name: "Shoujo", id:12)
