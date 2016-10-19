class FoodTrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @food_trucks = FoodTruck.all
  end
end
