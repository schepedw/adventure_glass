class SpecificationsController < ApplicationController
  respond_to :html, :json
  def create
    Specification.create(specification_params)
    @base_model = BaseModel.find_by_id(specification_params[:base_model_id])
    @specifications = @base_model.present? ? @base_model.specifications : Specification.all
  end

  def update
    o = Specification.find(params[:id])
    o.update_attributes(specification_params)
    respond_with o
  end

  def destroy
    Specification.delete(params[:id])
    @base_model = BaseModel.find_by_id(params[:base_model_id])
    @specifications = @base_model.present? ? @base_model.specifications : Specification.all
  end

  private

  def specification_params
    params.require(:specification).permit(:description, :price, :base_model_id)
  end
end
