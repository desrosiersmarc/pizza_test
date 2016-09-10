class AddColumnToCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :pizza, foreign_key: true
  end
end
