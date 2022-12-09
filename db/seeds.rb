# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# price = rand(1..100)

Product.all do |p|
  if p.price < 0 || p.price == nil
    p.price = 1
  else
  end
end
# 100.times do
#   product = Product.new(name: Faker::Creature::Animal.name, price: price, image_url: "http://www.thisisaplaceholder.com", description: Faker::Quote.jack_handey)
#   product.save
# end