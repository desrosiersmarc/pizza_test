class AddUserRefToFoodTruck < ActiveRecord::Migration[5.0]
  def change
    add_reference :food_trucks, :user, foreign_key: true
  end
end
