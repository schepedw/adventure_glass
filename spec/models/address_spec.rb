require 'rails_helper'

describe Address do
  describe '#to_s' do
    context 'with apt number' do
      let(:address) { build :address, :with_apt_number }
      it 'formats correctly' do
        expect(address.to_s).to eql '1600 Pennsylvania Avenue, 6B, Washington, D.C., The 51st one, 12345'
      end
    end
    context 'without apt number' do
      let(:address) { build :address }
      it 'formats correctly' do
        expect(address.to_s).to eql '1600 Pennsylvania Avenue, Washington, D.C., The 51st one, 12345'
      end
    end
  end
end
