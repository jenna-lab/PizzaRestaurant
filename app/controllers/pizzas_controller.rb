class PizzasController <ApplicationController
  
  def index
    @pizzas = Pizza.all
    render json: @pizzas.as_json(only: [:id, :name, :ingredients])
  end

end