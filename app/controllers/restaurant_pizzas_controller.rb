class RestaurantPizzasController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render json: @restaurants
end
def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
end
def create
    @restaurant = Restaurant.create(restaurant_params)
    render json: @restaurant
end
def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    render json: @restaurant
end
def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    render json: @restaurant
end
private
def restaurant_params
    params.require(:restaurant).permit(:name, :location, :rating)
end
end
