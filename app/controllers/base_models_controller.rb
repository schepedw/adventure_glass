class BaseModelsController < ApplicationController
  include PictureFinder
  respond_to :html, :json, :js
  before_action :check_permissions

  def edit
    @pictures = pictures_for(base_model, 100)
  end

  def update
    base_model.update_attributes(base_model_params)
    respond_with b
  end

  def upload_picture
    @base_model = BaseModel.find(params[:base_model_id])
    params[:files].each do |uploaded_io|
      @base_model.add_picture(uploaded_io)
    end
    @pictures = pictures_for(@base_model, 100)
    respond_to do |format|
      format.js
    end
  end

  def delete_picture
    @pic_to_delete = params[:filename]
    File.delete(Rails.root.join('public', 'assets', @pic_to_delete))
    @base_model = BaseModel.find(params[:base_model_id])
    @pictures = pictures_for(@base_model, 100)
  end

  def destroy
    base_model.delete
    unless base_model.image_path.blank?
      # This should be a lifecycle callback
      FileUtils.rm_rf(Rails.root.join('app', 'assets', 'images', base_model.image_path))
    end
    redirect_to root_path, notice: 'Product removed'
  end

  def create
    base_model = BaseModel.create(base_model_params)
    image_path = "user_added/#{base_model.name.downcase.tr(' ', '_')}"
    Dir.mkdir(Rails.root.join('app', 'assets', 'images', image_path))
    base_model.update_attribute(:image_path, image_path)
    redirect_to edit_base_model_path(base_model)
  end

  private

  def base_model
    @base_model ||= BaseModel.find(params[:id])
  end

  def class_name
    @class_name ||=
      %w[boat part lift dock base_model].find do |type|
        params[type].present?
      end
  end

  def base_model_params
    params.require(class_name).permit(
      :quantity, :shopping_cart_id, :price, :description, :class_name,
      :base_model_id, :name, :type, selected_option_ids: :selected
    )
  end

  def klass
    class_name.capitalize.constantize
  end

  def check_permissions
    raise UnauthorizedError unless current_user.try(:has_role?, :admin)
  end
end
