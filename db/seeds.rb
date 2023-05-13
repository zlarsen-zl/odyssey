# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.where(email: "zlarsen.zl@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password"
)

# 100.times do |i|
#   BlogPost.create title: "blog post #{i}", content: "Hello World", published_at: Time.current
# end