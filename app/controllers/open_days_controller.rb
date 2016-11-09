class OpenDaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :find_food_truck, only: [:new, :create]

  def index
    @open_days = FoodTruck.find(params[:food_truck_id]).open_days
  end

  def new
    @open_day = OpenDay.new
    @days = Day.all
  end

  def create
    @open_day = OpenDay.new(params_open_day)
    @open_day.food_truck = @food_truck
    @open_day.day = Day.find(params[:open_day][:day_id])

    if @open_day.save
      redirect_to food_truck_open_days_path, notice: "You'll create a new open day"
    else
      render :new
    end

  end

  private
    def params_open_day
      params.require(:open_day).permit(:opened_hour, :closed_hour, :address, :day)
    end

    def find_food_truck
      @food_truck = FoodTruck.find(params[:food_truck_id])
    end
end
