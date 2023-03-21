class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :id, :price
  belongs_to :pizza, serializer: PizzaSerializer
  end