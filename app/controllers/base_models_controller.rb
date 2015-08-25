class BaseModelsController < ApplicationController
  include PictureFinder
  respond_to :html, :json, :js
  before_action :check_permissions

  def edit
    @base_model = BaseModel.find(params[:id])
    @pictures = pictures_for(@base_model, 100)
  end

  def update
    b = BaseModel.find(params[:id])
    b.update_attributes(base_model_params)
    respond_with b
  end

  def upload_picture
    @base_model = BaseModel.find(params[:base_model_id])
    params[:files].each do |uploaded_io|
      File.open(Rails.root.join('app', 'assets', 'images', @base_model.image_path, uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
    @pictures = pictures_for(@base_model, 100)
    respond_to do |format|
      format.js
    end
  end

  def delete_picture
    @pic_to_delete = params[:filename]
    File.delete(Rails.root.join('app', 'assets', 'images', @pic_to_delete))
    @base_model = BaseModel.find(params[:base_model_id])
    @pictures = pictures_for(@base_model, 100)
  end

  private

  def class_name
    @class_name ||= \
      ['boat', 'part', 'lift', 'dock', 'base_model'].find do |type|
      params[type].present?
    end
  end

  def base_model_params
    params.require(class_name).permit(
      :quantity,
      :shopping_cart_id,
      :price,
      :description,
      :class_name,
      :base_model_id,
      :name,
      :type,
      {selected_option_ids: :selected},
    )
  end

  def klass
    class_name.capitalize.constantize
  end

  def check_permissions
    redirect_to root_path unless current_user.try(:has_role?, :admin)
  end

end
