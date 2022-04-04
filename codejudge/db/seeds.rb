# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#User.create(username: "admin", password: "admin", password_confirmation: "admin", firstname: "admin", lastname: "admin", email: "admin@email.com", registration_time: DateTime.now, user_role: 0)

require 'faker'

#TEST USERS

User.create(username: "admin", password: "admin", firstname: "admin", lastname: "admin", email: "admin@admin.com")
User.create(username: "testuser", password: "password", firstname: "Test", lastname: "User", email: "testuser@example.com")
User.create(username: "testinstructor", password: "password", firstname: "Test", lastname: "Instructor", email: "testinstructor@example.com")
User.create(username: "testTA", password: "password", firstname: "Test", lastname: "TA", email: "testTA@example.com") 

(1..50).each do |id|
  User.create(
    username: Faker::Creature::Animal.unique.name,
    password: Faker::Alphanumeric.alphanumeric(number: 10),
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

#TEST PROBLEMS

Problem.create(body: "Output should contain one line, containing the string 'Hello World!'.")

(1..50).each do |id|
  Problem.create(
    body: Faker::Lorem.paragraph(sentence_count: 5)
  )
end
