class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.datetime :delivery_at

      t.timestamps
    end
  end
end
