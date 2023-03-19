class Restaurant < ApplicationRecord
    has_many :pizzas, through: :restaurant_pizzas
    has_many :restaurant_pizzas
    
end