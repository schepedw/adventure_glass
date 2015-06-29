class SpecificationsController < ApplicationController
  respond_to :html, :json
  def create
    Specification.create(specification_params)
    @product = Product.find(specification_params[:product_id]) rescue nil
    @specifications = @product.present? ? @product.specifications : Specification.all
  end

  def update
    o = Specification.find(params[:id])
    o.update_attributes(specification_params)
    respond_with o
  end

  def destroy
    Specification.delete(params[:id])
    @product = Product.find(params[:product_id]) rescue nil
    @specifications = @product.present? ? @product.specifications : Specification.all
  end

  private
  def specification_params
    params.require(:specification).permit(:description, :price, :product_id)
  end
end
