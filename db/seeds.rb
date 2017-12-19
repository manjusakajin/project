# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Admin",
             email: "admin@gmail.com",
             password:              "admin",
             password_confirmation: "admin",
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
  introduction = "Demo Book"
  web_rate = 3.5
  Book.create!(name:  name,
               introdution: introduction,
               web_ratting: web_rate)
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
