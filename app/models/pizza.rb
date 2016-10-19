class Pizza < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :ingredients, through: :recipes
  belongs_to :food_truck
  has_attachments :photos, maximum: 4

  validates :name, :price, presence: true

end
