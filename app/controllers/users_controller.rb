class UsersController < Devise::RegistrationsController
  def update
    @user = User.find(user_params[:id])
    @user.update_attributes(user_params)
    @address = update_shipping_addresses! if params[:user][:shipping_addresses]
    redirect_to(params[:request][:referer] || root_path)
  end

  def create
    @user = User.create(user_params)
    @address = update_shipping_addresses! if params[:user][:shipping_addresses]
    sign_up(resource_name, resource)
    redirect_to(params.dig(:request, :referer) || root_path)
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :phone_number,
      :id
    )
  end

  def shipping_address_params
    params[:user].require(:shipping_addresses).permit(
      :building_number,
      :apt_or_unit_number,
      :street,
      :city,
      :state,
      :zip_code
    ).merge(user_id: user_params[:id])
  end

  def update_shipping_addresses!
    Address.find_or_create_by(shipping_address_params)
  end
end
