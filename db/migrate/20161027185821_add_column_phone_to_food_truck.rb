class AddColumnPhoneToFoodTruck < ActiveRecord::Migration[5.0]
  def change
    add_column :food_trucks, :phone, :string
  end
end
