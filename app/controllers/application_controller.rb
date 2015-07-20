class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_shopping_cart

  def current_shopping_cart
    @cart ||= current_user.shopping_cart unless current_user.nil?
    @cart ||= shopping_cart_from_session
    @cart
  end

  private

  def shopping_cart_from_session
    shopping_cart = session[:cart_id].nil? ? ShoppingCart.create(user: current_user) : ShoppingCart.find(session[:cart_id])
    session[:cart_id] = shopping_cart.id
    shopping_cart
  end
end
