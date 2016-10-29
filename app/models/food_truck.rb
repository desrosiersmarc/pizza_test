class FoodTruck < ApplicationRecord
  belongs_to :category
  has_many :pizzas
  has_many :open_days
  has_attachment :photo

end
