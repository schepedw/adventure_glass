require 'rails_helper'

describe Order do
  describe 'status' do
    let(:order) { Order.create(user_id: 1, shopping_cart_id: 1) }
    it 'defaults to new status' do
      expect(order.status).to eql Status['new']
    end
  end
end
