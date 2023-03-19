class RestaurantPizzasController < ApplicationController
  def create
    restaurant_pizza = RestaurantPizza.new(restaurant_pizza_params)

    if restaurant_pizza.save
      render json: restaurant_pizza.pizza.slice(:id, :name, :ingredients), status: :created
    else
      render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    restaurant_pizzas = RestaurantPizza.all
    render json: restaurant_pizzas.as_json(include: { pizza: { only: [:id, :name, :ingredients] } }, only: [:id, :pizza_id, :restaurant_id, :price])
  end
  

  
  private

  def restaurant_pizza_params
    params.permit(:price, :pizza_id, :restaurant_id)
  end
end
