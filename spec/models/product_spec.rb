require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      product = Product.new(name: 'Product 1', price: 100.0, quantity: 10)
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product = Product.new(name: nil)
      expect(product).to_not be_valid
    end

    it 'is invalid with a negative price' do
      product = Product.new(price: -1)
      expect(product).to_not be_valid
    end
  end

end
