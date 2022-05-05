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
admin = User.create!(username: "admin", password: "password", password_confirmation: "password", firstname: "admin", lastname: "admin", email: "admin@example.com")
admin.assignments.create!(role: role_admin)
instructor = User.create!(username: "instructor", password: "password", password_confirmation: "password", firstname: "test", lastname: "instructor", email: "instructor@example.com")
instructor.assignments.create!(role: role_instructor)
ta = User.create!(username: "teaching_asst", password: "password", password_confirmation: "password", firstname: "test", lastname: "ta", email: "ta@example.com")
ta.assignments.create!(role: role_ta)
ta = User.create!(username: "student", password: "password", password_confirmation: "password", firstname: "test", lastname: "student", email: "student@example.com")
ta.assignments.create!(role: role_student)


(1..50).each do |id|
  user = User.create(
    username: Faker::Creature::Animal.unique.name,
    password: Faker::Alphanumeric.alphanumeric(number: 10),
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

#TEST PROBLEMS
problem = Problem.create!(
  title: "Hello World",
  body: "Output should contain one line, containing the string 'Hello World!'."
)
problem.save
problem.test_cases.create!(input: "", output: "Hello World")

fib = Problem.create!(
  title: "Fibonacci Sequence",
  body: "Given a number n, print the nth Fibonacci number."
)

fib.test_cases.create!(input: "2", output: "1", example: false)
fib.test_cases.create!(input: "9", output: "34", example: false)
fib.test_cases.create!(input: "1", output: "1", example: false)

(1..10).each do |id|
  Problem.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 5)
  )
end

Language.create(
  name: "python",
  extension: ".py",
  url_name: "https://glot.io/api/run/python"
)

["assembly", ".as", "https://glot.io/api/run/python"]
["ats", ".as", "https://glot.io/api/run/python"]
["bash", ".as", "https://glot.io/api/run/python"]
["c", ".as", "https://glot.io/api/run/python"]
["clojure", ".as", "https://glot.io/api/run/python"]
["cobol", ".as", "https://glot.io/api/run/python"]
["cofeescript", ".as", "https://glot.io/api/run/python"]
["cpp", ".as", "https://glot.io/api/run/python"]
["crystal", ".as", "https://glot.io/api/run/python"]
["csharp", ".as", "https://glot.io/api/run/python"]
["d", ".as", "https://glot.io/api/run/python"]
["elixir", ".as", "https://glot.io/api/run/python"]
["erlang", ".as", "https://glot.io/api/run/python"]
["fsharp", ".as", "https://glot.io/api/run/python"]
["go", ".as", "https://glot.io/api/run/python"]
["groovy", ".as", "https://glot.io/api/run/python"]
["haskell", ".as", "https://glot.io/api/run/python"]
["idris", ".as", "https://glot.io/api/run/python"]
["java", ".as", "https://glot.io/api/run/python"]
["javascript", ".as", "https://glot.io/api/run/python"]
["julia", ".as", "https://glot.io/api/run/python"]
["kotlin", ".as", "https://glot.io/api/run/python"]
["lua", ".as", "https://glot.io/api/run/python"]
["mercury", ".as", "https://glot.io/api/run/python"]
["nim", ".as", "https://glot.io/api/run/python"]
["nix", ".as", "https://glot.io/api/run/python"]
["ocaml", ".as", "https://glot.io/api/run/python"]
["perl", ".as", "https://glot.io/api/run/python"]
["php", ".as", "https://glot.io/api/run/python"]
["python", ".as", "https://glot.io/api/run/python"]
["raku", ".as", "https://glot.io/api/run/python"]
["ruby", ".as", "https://glot.io/api/run/python"]
["rust", ".as", "https://glot.io/api/run/python"]
["sac", ".as", "https://glot.io/api/run/python"]
["scala", ".as", "https://glot.io/api/run/python"]
["swift", ".as", "https://glot.io/api/run/python"]
["typescript", ".as", "https://glot.io/api/run/python"]
["zig", ".as", "https://glot.io/api/run/python"]
