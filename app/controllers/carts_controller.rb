class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create]

  def index
    @carts = Cart.all
  end

  def create

  end

end
