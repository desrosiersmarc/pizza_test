class FoodTruck < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :pizzas
  has_many :open_days
  has_attachment :photo

  def open?
    !self.open_days
        .where("day_id = ?", Day.find_by_day_of_week(Time.now.strftime("%w")))[0]
        .opened_hour
        .strftime("%R")
        .nil?
  end


end
