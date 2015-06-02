class OrdersController < ApplicationController
  before_filter :authenticate_user!
  def show
  end

  def create
    order = Order.create(order_params)
    current_user.shopping_cart = ShoppingCart.create
    redirect_to order_path(order)
    #redirect to orders#show for this order
    #make an orders index page, part of the logged in users ish
    #flash[:success] (something)
  end

  private
  def order_params
    params.require(:order).permit(:shopping_cart_id, :user_id)
  end
end
