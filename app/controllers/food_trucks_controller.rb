class FoodTrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    @city = params[:search][:city]
    @food_trucks = FoodTruck.all
    @open_days = OpenDay.near(@city, 10)
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create

  end

  private
end
