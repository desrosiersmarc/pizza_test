class FoodTrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    @city = params[:search][:city]
    @food_trucks = FoodTruck.all
    @open_days = OpenDay.where("day_id = ?", Day.find_by_day_of_week(Time.now.strftime("%w")).id)
                        .near(@city, 200)
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create
    @food_truck = FoodTruck.new(params_foodtruck)
    @food_truck.user = current_user
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
