class CreateOpenDays < ActiveRecord::Migration[5.0]
  def change
    create_table :open_days do |t|
      t.time :opened_hour
      t.time :closed_hour
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :food_truck, foreign_key: true
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end
