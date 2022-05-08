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
student = User.create!(username: "student", password: "password", password_confirmation: "password", firstname: "test", lastname: "student", email: "student@example.com")


# (1..50).each do |id|
#   user = User.create(
#     username: Faker::Creature::Animal.unique.name,
#     password: Faker::Alphanumeric.alphanumeric(number: 10),
#     firstname: Faker::Name.first_name,
#     lastname: Faker::Name.last_name,
#     email: Faker::Internet.email
#   )
# end

#TEST PROBLEMS
problem = Problem.create!(
  title: "Hello World",
  body: "Output should contain one line, containing the string 'Hello World!'."
)
problem.save
problem.test_cases.create!(input: "", output: "Hello World!")

fib = Problem.create!(
  title: "Fibonacci Sequence",
  body: "Given a number n, print the nth Fibonacci number."
)

fib.test_cases.create!(input: "2", output: "1", example: false)
fib.test_cases.create!(input: "9", output: "34", example: false)
fib.test_cases.create!(input: "1", output: "1", example: false)

# (1..10).each do |id|
#   Problem.create(
#     title: Faker::Lorem.sentence(word_count: 3),
#     body: Faker::Lorem.paragraph(sentence_count: 5)
#   )
# end

langs = [
["assembly", ".as", "Assembly"],
["ats", ".dats", "ATS"],
["bash", ".sh", "Bash"],
["c", ".c", "C"],
["clojure", ".clj", "Clojure"],
["cobol", ".cob", "COBOL"],
["cofeescript", ".coffee", "CoffeeScript"],
["cpp", ".cpp", "C++"],
["crystal", ".cr", "Crystal"],
["csharp", ".cs", "C#"],
["d", ".d", "D"],
["elixir", ".ex", "Elixir"],
["elm", ".elm", "Elm"],
["erlang", ".erl", "Erlang"],
["fsharp", ".fs", "F#"],
["go", ".go", "Go"],
["groovy", ".groovy", "Groovy"],
["haskell", ".hs", "Haskell"],
["idris", ".idr", "Idris"],
["java", ".java", "Java"],
["javascript", ".js", "Javascript"],
["julia", ".jl", "Julia"],
["kotlin", ".kt", "Kotlin"],
["lua", ".lua", "Lua"],
["mercury", ".m", "Mercury"],
["nim", ".nim", "Nim"],
["nix", ".nix", "Nix"],
["ocaml", ".ml", "OCaml"],
["perl", ".pl", "Perl"],
["php", ".php", "PHP"],
["python", ".py", "Python 3"],
["raku", ".raku", "Raku"],
["ruby", ".rb", "Ruby"],
["rust", ".rs", "Rust"],
["sac", ".sac", "SaC"],
["scala", ".scala", "Scala"],
["swift", ".swift", "Swift"],
["typescript", ".ts", "TypeScript"],
["zig", ".zig", "Zig"]
]

langs.each do |lang|
  Language.create(
    name: lang[0],
    extension: lang[1],
    pretty_name: lang[2]
  )
end
