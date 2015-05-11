class UsersController < Devise::RegistrationsController

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    @address = update_shipping_addresses! if params[:user][:shipping_addresses]
    redirect_to(params[:user][:redirect_path] || root_path)
  end

  def create
    @user = User.create(user_params)
    @address = update_shipping_addresses! if params[:user][:shipping_addresses]
    sign_up(resource_name, resource)
    redirect_to params[:user][:redirect_path]
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :phone_number,
    )
  end

  def devise_mapping
    Devise.mappings[:user]
  end

  def shipping_address_params
    params[:user].require(:shipping_addresses).permit(
      :building_number,
      :apt_or_unit_number,
      :street,
      :city,
      :state,
      :zip_code
    )
  end

  def update_shipping_addresses!
    address = ShippingAddress.find_or_create_by(shipping_address_params)
    address.update_attributes(:updated_at, Time.now)
    @user.shipping_addresses << address
    @user.save!
    address
  end
end
