# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restaurant.destroy_all
Pizza.destroy_all
RestaurantPizza.destroy_all

puts "pizza faker..."
30.times do
    Pizza.create(
        name: Faker::Food.ingredient,
        #has 3 ingredients in an array
        ingredients: [Faker::Food.ingredient, Faker::Food.ingredient, Faker::Food.ingredient],

    )

end

puts "faker restaurant..."
30.times do
    Restaurant.create(
        name: Faker::Restaurant.name,
        address: Faker::Address.street_address
    )
end

puts "faker restaurant_pizza...."#faker for restaurant_pizza

30.times do
    RestaurantPizza.create(
        restaurant_id:Restaurant.all.sample.id,
        pizza_id: Pizza.all.sample.id
    )
end
puts "done seeding..."