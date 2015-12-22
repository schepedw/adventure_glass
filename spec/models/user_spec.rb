require 'rails_helper'

describe User do
  subject(:user) { build :user }

  describe 'shopping cart' do
    let(:shopping_cart) { ShoppingCart.create(user: user) }
    it 'creates a shopping cart if none exists' do
      expect(ShoppingCart).to receive(:create).with({user: user})
      user.shopping_cart
    end

    it 'returns the existing shopping cart if one exists' do
      shopping_cart
      expect(ShoppingCart).to_not receive(:create)
      user.shopping_cart
    end

    it 'returns the existing shopping cart if one exists' do
      shopping_cart
      expect(user.shopping_cart).to eql shopping_cart
    end
  end

  describe '#full_name' do
    it 'gives full name' do
      expect(user.full_name).to eql 'Tester Guy'
    end
  end

  describe 'registration_complete?' do
    context 'complete' do
      it 'checks for missing attributes' do
        expect(user.registration_complete?).to be true
      end
    end
    context 'incomplete' do
      %w(email encrypted_password first_name last_name phone_number).each do |attr|
        it "is incomplete without #{attr}" do
          user.send("#{attr}=", nil)
          expect(user.registration_complete?).to be false
        end
      end
    end
  end

  describe 'missing_registration_attrs' do
    context 'complete' do
      it 'is complete' do
        expect(user.missing_registration_attrs).to be_empty
      end
    end
    context 'incomplete' do
      %w[email encrypted_password first_name last_name phone_number].each do |attr|
        it "is incomplete without #{attr}" do
          user.send("#{attr}=", nil)
          expect(user.missing_registration_attrs).to include(attr)
        end
      end
    end
  end
end
