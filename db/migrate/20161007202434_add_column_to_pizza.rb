class AddColumnToPizza < ActiveRecord::Migration[5.0]
  def change
    add_reference :pizzas, :food_truck, foreign_key: true
  end
end
