class FoodTrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    # @city = params[:search][:city]
    @food_trucks = FoodTruck.all
    @open_days = OpenDay.all
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create

  end
end
