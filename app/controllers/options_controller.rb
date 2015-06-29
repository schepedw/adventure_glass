class OptionsController < ApplicationController
  respond_to :html, :json
  def create
    Option.create(option_params)
    @product = Product.find(option_params[:product_id]) rescue nil
    @options = @product.present? ? @product.available_options : Option.all
  end

  def update
    o = Option.find(params[:id])
    o.update_attributes(option_params)
    respond_with o
  end

  def destroy
    Option.delete(params[:id])
    @product = Product.find(params[:product_id]) rescue nil
    @options = @product.present? ? @product.available_options : Option.all
  end

  private
  def option_params
    params.require(:option).permit(:description, :price, :product_id)
  end
end
