class OrdersController < ApplicationController
  before_filter :authenticate_user!
  def show
    order = Order.all.find { |o| !o.products.empty? }
    @user = order.user
    @products = order.products
    render 'order_mailer/confirm_order'
  end

  def create
    order = Order.create(order_params)
    current_user.shopping_cart = ShoppingCart.create
    OrderMailer.confirm_order(order).deliver # TODO: Move this to a worker
    redirect_to order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:shopping_cart_id, :user_id)
  end
end
