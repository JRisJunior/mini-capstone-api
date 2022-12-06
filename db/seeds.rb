# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

price = rand(1..100)

100.times do
product = Product.new(name: Faker::Creature::Animal.name, price: price, image_url: Faker::String.random(length: 3..12), description: Faker::Quote.jack_handey)
product.save
end