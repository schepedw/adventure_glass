require 'rails_helper'

describe Order do
  describe 'status' do
    let(:user) { create(:user) }
    let(:cart) { ShoppingCart.create(user_id: user.id) }
    let(:order) { Order.create(user_id: user.id, shopping_cart_id: cart.id) }

    it 'defaults to new status' do
      expect(order.status).to eql Status['new']
    end
  end
end
