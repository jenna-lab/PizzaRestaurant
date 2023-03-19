class Restaurant < ApplicationRecord
    has_many :pizzas, through: :restaurant_pizzas
    has_many :restaurant_pizzas
    validates :name, presence: true
    validates :name, uniqueness: true
end