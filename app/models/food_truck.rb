class FoodTruck < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :pizzas
  has_many :open_days
  has_attachment :photo

  def open_today?
    !self.open_days.find_by_day_id(Day.find_by_day_of_week(Time.now.strftime("%w")).id).nil?
  end

  def open_now?

  end

end
