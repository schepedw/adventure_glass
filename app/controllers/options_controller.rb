class OptionsController < ApplicationController
  respond_to :html, :json
  def create
    Option.create!(option_params)
    @base_model = BaseModel.find_by_id(option_params[:base_model_id])
    @options = @base_model.try(:available_options) || Option.all
  end

  def update
    option.update_attributes(option_params)
    respond_with option
  end

  def destroy
    Option.delete(params[:id])
    @base_model = BaseModel.find_by_id(params[:base_model_id])
    @options = @base_model.try(:available_options) || Option.all
  end

  def update_selected
    @product = Product.find(params[:product_id])
    if option_selected?
      @product.selected_options << option
    else
      @product.selected_options.delete(option)
    end
    @product.save!
  end

  private

  def option
    @option ||= Option.find(params[:id])
  end

  def option_params
    params.require(:option).permit(:description, :price, :base_model_id)
  end

  def class_name
    @class_name ||= %w[boat part lift dock product].find { |type| params[type].present? }
  end

  def option_selected?
    params[class_name][:option_ids][params[:id]] == '1'
  end
end
