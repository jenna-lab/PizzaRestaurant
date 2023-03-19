class RestaurantPizzasController <ApplicationController
    def index
        @restaurants = Restaurant.all
        render json: @restaurants
    en
end