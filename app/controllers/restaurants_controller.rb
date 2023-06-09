class RestaurantsController <ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        render json: Restaurant.all
    end

    def show
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
          render json: restaurant.as_json(include: { pizzas: { only: [:id, :name, :ingredients] } }, only: [:id, :name, :address])
        else
          render json: { error: "Restaurant not found" }, status: :not_found
        end
      end

      def destroy 
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        head :no_content
    end
    
    def create
      restaurant = Restaurant.new(restaurant_params)
      if restaurant.save
        render json: restaurant, status: :created
      else
        render json: { error: "Failed to create restaurant" }, status: :unprocessable_entity
      end
    end
    
    end