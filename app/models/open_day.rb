class OpenDay < ApplicationRecord
  belongs_to :food_truck
  belongs_to :day

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
