class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :quantity
      t.references :pizza, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
