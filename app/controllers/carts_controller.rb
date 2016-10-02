class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create]

  def index
    @carts = Cart.all
    @pizzas = Pizza.all
  end

  def create
    cart = Cart.new(cart_params)
    if user_signed_in?
      cart.user_id = current_user.id
    end
    cart.save
    redirect_to pizzas_path
  end

  private

  def cart_params
    params.require(:cart).permit(:pizza_id)
  end

end
