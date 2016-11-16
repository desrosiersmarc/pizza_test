class AddColumnToFoodTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :food_trucks, :siren, :integer
  end
end
