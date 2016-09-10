class Pizza < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :ingredients, through: :recipes

  validates :name, :price, presence: true

end
