require 'rails_helper'

describe ShoppingCart do
  let(:product) { build :product }
  subject(:cart) { described_class.new(products: [product]) }
  describe '#total_item_count' do
    it 'counts item quantity' do
      expect(cart.total_item_count).to eql product.quantity
    end
  end
  describe '#subtotal' do
    before do
      allow(product).to receive(:price).and_return(3.00)
    end
    it 'correctly calculates' do
      expect(cart.subtotal).to eql 9.00
    end
  end
end
