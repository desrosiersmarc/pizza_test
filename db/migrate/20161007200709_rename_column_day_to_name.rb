class RenameColumnDayToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :days, :day, :name
  end
end
