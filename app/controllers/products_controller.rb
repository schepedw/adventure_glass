class ProductsController < ApplicationController
  include PictureFinder
  respond_to :html, :json
  before_action :parse_selections!, only: [:create]
  before_action :check_cart, only: [:show, :update, :destroy]
  #TODO: need a filter for show, update, destroy to make sure that the item is in the current cart & the current cart belongs to the user
  #TODO: do we ever use the edit view?

  def create
    Product.create(product_params)
    redirect_to shopping_cart_path(@cart)
  end

  def new
    @base_model = BaseModel.find(params[:base_model_id])
    @pictures = pictures_for(@base_model)
  end

  def destroy
    @cart.products.find(params[:id]).delete
    redirect_to shopping_cart_path(@cart)
  end

  def show
    @product = Product.find(params[:id])
    @pictures = pictures_for(@product)
  end

  def edit
    @product = Product.find(params[:id])
    @pictures = pictures_for(@product)
  end

  def update
    p = @cart.products.find(params[:id])
    p.update_attributes(product_params)
    respond_with p
  end

  private

  def check_cart
    redirect_to root_path unless given_cart == @cart && @cart.product_ids.include?(params[:id].to_i)
  end

  def class_name
    @class_name ||= \
      ['boat', 'part', 'lift', 'dock', 'product'].find do |type|
      params[type].present?
    end
  end

  def given_cart
    cart = ShoppingCart.find(params[:shopping_cart_id] || product_params[:shopping_cart_id])
    cart ||= (product_params[:shopping_cart] if product_params[:shopping_cart])
  end

  def product_params
    params.require(class_name).permit(
      :quantity,
      :shopping_cart_id,
      :price,
      :description,
      :class_name,
      :base_model_id,
      :name,
      :type,
      {selected_option_ids: []}
     ).merge(shopping_cart: current_shopping_cart)
  end

  def klass
    class_name.capitalize.constantize
  end

  def parse_selections!
    association = :selected_option_ids #extendable to be an array
    if params[class_name][association].is_a? Hash
      params[class_name][association] = \
      params[class_name][association].keys.select do |k|
        params[class_name][association][k][:selected] == '1'
      end
    end
  end
end
