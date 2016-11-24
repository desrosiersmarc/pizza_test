class OpenDay < ApplicationRecord
  belongs_to :food_truck
  belongs_to :day

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  #TODO
  # scope :today, -> (date) { where(date: date) }

  # OpenDay.today(Date.today)

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

  def times_list
    @times=[]
    hour_time = 0
    min_time = ['00', '15', '30', '45']
    24.times do
      min_time_count = 0
      4.times do
        @times << (hour_time.to_s + ':' + min_time[min_time_count])
        min_time_count+=1
      end
      hour_time+=1
    end
    @times
  end
end
