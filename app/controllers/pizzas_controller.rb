class PizzasController <ApplicationController
  def index
    @pizzas = Pizza.all
    render json: @pizzas.as_json(only: [:id, :name, :ingredients])
  end

  def show
    pizza = Pizza.find_by(id: params[:id])
    if pizza
    render json: pizza.as_json(only: [:name, :ingredients])
    else
      render json: {errors: "Pizza with that Id is not found"}, status: :not_found
    end
  end
#create
end
# GET /restaurants
# GET /restaurants/:id  If the `Restaurant` does not exist, return   "error": "Restaurant not found"
# DELETE /restaurants/:id If the `Restaurant` does not exist, return "error": "Restaurant not found"
# GET /pizzas
# POST /restaurant_pizzas
# post {

#   "price": 5,

#   "pizza_id": 1,

#   "restaurant_id": 3

# }









