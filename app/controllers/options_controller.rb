class OptionsController < ApplicationController
  respond_to :html, :json
  def create
    Option.create(option_params)
    @base_model = BaseModel.find(option_params[:base_model_id]) rescue nil
    @options = @base_model.present? ? @base_model.available_options : Option.all
  end

  def update
    o = Option.find(params[:id])
    o.update_attributes(option_params)
    respond_with o
  end

  def destroy
    Option.delete(params[:id])
    @base_model = BaseModel.find(params[:base_model_id]) rescue nil
    @options = @base_model.present? ? @base_model.available_options : Option.all
  end

  def update_selected
    @product = Product.find(params[:product_id])
    @option = Option.find(params[:id])
    if params[class_name][:option_ids][params[:id]] == '1'
      @product.selected_options << @option
    else
      @product.selected_options.delete(@option)
    end
    @product.save!
  end

  private
  def option_params
    params.require(:option).permit(:description, :price, :base_model_id)
  end

  def class_name
    @class_name ||= \
      ['boat', 'part', 'lift', 'dock', 'product'].find do |type|
      params[type].present?
    end
  end
end
