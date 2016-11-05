class FoodTrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :show]

  def index
    @city = params[:search][:city]
    @opendays = OpenDay.includes(food_truck:[:category]).near(@city, 200)
                    .where(open_days: {day_id: Day.find_by_day_of_week(Time.now.strftime("%w")).id })


  end

  def show
    @food_truck = FoodTruck.find(params[:id])
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

  def edit
    @food_truck = FoodTruck.find(params[:id])
  end

  private
    def params_foodtruck
      params.require(:food_truck).permit(:name, :phone, :photo)
    end
end
