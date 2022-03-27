# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#User.create(username: "admin", password: "admin", password_confirmation: "admin", firstname: "admin", lastname: "admin", email: "admin@email.com", registration_time: DateTime.now, user_role: 0)

#TEST USERS

User.create(username: "admin", password: "admin", firstname: "admin", lastname: "admin", email: "admin@admin.com", registration_time: DateTime.now, user_role: 0)
User.create(username: "testuser", password: "password", firstname: "Test", lastname: "User", email: "testuser@example.com", registration_time: DateTime.now, user_role: 2)
User.create(username: "testinstructor", password: "password", firstname: "Test", lastname: "Instructor", email: "testinstructor@example.com", registration_time: DateTime.now, user_role: 1)
User.create(username: "testTA", password: "password", firstname: "Test", lastname: "TA", email: "testTA@example.com", registration_time: DateTime.now, user_role: 1) 



#TEST PROBLEMS

Problem.create(problem_text: "Output should contain one line, containing the string 'Hello World!'.", number_test_cases: 1)