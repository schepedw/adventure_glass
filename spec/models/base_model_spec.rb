require 'rails_helper'

describe BaseModel do
  describe '#price_to_s' do
    { 12.34 => '12.34', 12.3456 => '12.35', 12.0 => '12.00', 12 => '12.00' }.each do |price, to_s|
      it 'correctly formats the price' do
        base_model = build :base_model, price: price
        expect(base_model.price_to_s).to eql to_s
      end
    end
  end
end
