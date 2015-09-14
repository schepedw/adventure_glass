class ApplicationController < ActionController::Base
  class UnauthorizedError < RuntimeError; end
  protect_from_forgery with: :exception
  before_action :current_shopping_cart

  rescue_from UnauthorizedError do |ex|
    render 'site/unauthorized', layout: 'application', status: 403, formats: [:html]
  end

  def current_shopping_cart
    @cart ||= current_user.shopping_cart unless current_user.nil?
    @cart ||= shopping_cart_from_session
    @cart
  end

  private

  def shopping_cart_from_session
    shopping_cart = ShoppingCart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    shopping_cart = ShoppingCart.create(user: current_user).id
  ensure
    session[:cart_id] = shopping_cart.id
    shopping_cart
  end
end
