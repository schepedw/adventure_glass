class OrdersController < ApplicationController
  before_filter :authenticate_user!
  def show
    order = Order.all.find{|o| !o.products.empty?}
    @user = order.user
    @products = order.products
    render 'order_mailer/confirm_order'
  end

  def create
    order = Order.create(order_params)
    current_user.shopping_cart = ShoppingCart.create
    OrderMailer.confirm_order(order).deliver_later
    redirect_to order_path(order)
    #make an orders index page, part of the logged in users ish
    #flash[:success] (something)
  end

  private
  def order_params
    params.require(:order).permit(:shopping_cart_id, :user_id)
  end
end
