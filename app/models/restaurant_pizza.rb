class RestaurantPizza < ApplicationRecord
    belongs_to :pizzas
    belongs_to :restaurant
end