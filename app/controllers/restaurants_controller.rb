class RestaurantsController <ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        @restaurants = Restaurant.all
        render json: @restaurants
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
    
      private
    
      def restaurant_params
        params.permit(:name, :location, :rating)
      end
    end