class FoodTruck < ApplicationRecord
  belongs_to :category
  has_many :pizzas
end
