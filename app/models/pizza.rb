class Pizza < ApplicationRecord
    has_many :restaurants through: :restaurant_pizzas
    has_many :restaurant_pizzas
end