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

  private
  def option_params
    params.require(:option).permit(:description, :price, :base_model_id)
  end
end
