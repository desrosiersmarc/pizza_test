class FoodTrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :show]

  def index
    @city = params[:search][:city]

    @open_day = Day.find_by_day_of_week(Time.now.strftime("%w")).id
    @open_days = OpenDay.where(open_days: {day_id:@open_day})
                        .near(@city, 200)
                        .map{|o| o.food_truck_id}
    @food_trucks = FoodTruck.where("id IN (?)", @open_days)
                            .includes(:category, :open_days)
    #TODO replace .map by .pluck(:foodtruck_id)
    #TODO find a solution for multi-opened hour in the same zone and the same day
    #TODO can select only :open_days for today
  end

  def show
    @food_truck = FoodTruck.includes(:open_days).find(params[:id])
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create
    @food_truck = FoodTruck.new(params_foodtruck)
    @food_truck.user = current_user
    if @food_truck.save
      redirect_to new_food_truck_open_day_path(@food_truck), notice: "You create your foodtruck !"
    else
      render :new
    end
  end

  def edit
    @food_truck = FoodTruck.find(params[:id])
  end

  private
    def params_foodtruck
      params.require(:food_truck).permit(:name, :phone, :photo)
    end
end
