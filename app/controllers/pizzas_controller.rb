class PizzasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_pizza, only: [:show, :edit, :update, :destroy]

  def index
    @pizzas = Pizza.all.where('food_truck_id = ?', params['food_truck_id'])
  end

  def show
    @ingredients = @pizza.ingredients
    @cart = Cart.new
  end

  def new
    @pizza = Pizza.new()
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      redirect_to pizzas_path
    else
      #flash[:notice] = 'failed'
      render :new
    end
  end

  def edit
  end

  def update
    @pizza.update(pizza_params)
    redirect_to pizzas_path
  end

  def destroy
    @pizza.destroy
    redirect_to pizzas_path
  end

private

  def find_pizza
    @pizza = Pizza.find(params[:id])
  end

  def pizza_params
    params.require(:pizza).permit(:name, :price, :description, photos: [])
  end
end
