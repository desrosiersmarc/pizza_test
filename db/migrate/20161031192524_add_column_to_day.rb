class AddColumnToDay < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :day_of_week, :string
  end
end
