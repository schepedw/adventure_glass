class ProductsController < ApplicationController
  include PictureFinder
  respond_to :html, :json
  before_action :parse_selections!, only: [:create]

  def create
    Product.create(product_params)
    redirect_to shopping_cart_path
  end

  def new
    @base_model = BaseModel.find(params[:base_model_id])
    @pictures = pictures_for(@base_model)
  end

  def destroy
    Product.find(params[:id]).delete
    redirect_to shopping_cart_path
  end

  def show
    @pictures = pictures_for(Product.find(params[:id]))
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @pictures = pictures_for(@product, 100)
  end

  def update
    p = Product.find(params[:id])
    p.update_attributes(product_params)
    respond_with p
  end

  private

  def check_correct_cart
    if product.shopping_cart != cart
      flash[:error] = 'That product is not in your shopping cart!'
      redirect_to :back
    end
  end

  def class_name
    @class_name ||= \
      ['boat', 'part', 'lift', 'dock', 'product'].find do |type|
      params[type].present?
    end
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
