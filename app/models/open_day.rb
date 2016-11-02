class OpenDay < ApplicationRecord
  belongs_to :food_truck
  belongs_to :day

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def time_opened_hour
    self.opened_hour.strftime("%H:%M")
  end

  def time_closed_hour
    self.closed_hour.strftime("%H:%M")
  end

  def open_now?
    time_opened_hour < Time.now.strftime("%R") && time_closed_hour > Time.now.strftime("%R")
  end

  def name_of_day
    Day.find(self.day_id).name
  end

end
