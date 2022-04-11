# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#User.create(username: "admin", password: "admin", password_confirmation: "admin", firstname: "admin", lastname: "admin", email: "admin@email.com", registration_time: DateTime.now, user_role: 0)

require 'faker'

#TEST ROLES
role_admin = Role.create(name: "admin")
role_instructor = Role.create(name: "instructor")
role_ta = Role.create(name: "ta")
role_student = Role.create(name: "student")

#TEST USERS

admin = User.create(username: "admin", password: "admin", firstname: "admin", lastname: "admin", email: "admin@example.com")
admin.assignments.create(role: role_admin)
instructor = User.create(username: "instructor", password: "instructor", firstname: "test", lastname: "instructor", email: "instructor@example.com")
instructor.assignments.create(role: role_instructor)
ta = User.create(username: "ta", password: "ta", firstname: "test", lastname: "ta", email: "ta@example.com")
ta.assignments.create(role: role_ta)
ta = User.create(username: "student", password: "password", firstname: "test", lastname: "student", email: "student@example.com")
ta.assignments.create(role: role_student)


(1..50).each do |id|
  user = User.create(
    username: Faker::Creature::Animal.unique.name,
    password: Faker::Alphanumeric.alphanumeric(number: 10),
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email
  )
  user.assignments.create(role: role_student)
end

#TEST PROBLEMS

Problem.create(
  title: "Hello World",
  body: "Output should contain one line, containing the string 'Hello World!'."
)

(1..50).each do |id|
  Problem.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 5)
  )
end
