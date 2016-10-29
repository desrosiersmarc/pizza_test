class FoodTrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    @city = params[:search][:city]
    @food_trucks = FoodTruck.all
    @open_days = OpenDay.near(@city, 200)
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create
    @food_truck = FoodTruck.new(params_foodtruck)
    if @food_truck.save
      redirect_to root_path, notice: "You create your foodtruck !"
    else
      render :new
    end

  end

  private
    def params_foodtruck
      params.require(:food_truck).permit(:name, :phone, :photo)
    end
end
