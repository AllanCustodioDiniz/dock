require 'rails_helper'

RSpec.describe CartController, type: :controller do
  describe 'POST #add_to_cart' do
    it 'adds a product to the cart' do
      product = Product.create!(name: 'Product 1', price: 100.0, quantity: 10)
      post :add_to_cart, params: { id: product.id, quantity: 2 }
      expect(session[:cart].length).to eq(1)
      expect(session[:cart].first['id']).to eq(product.id)
      expect(session[:cart].first['quantity']).to eq(2)
    end
  end

  describe 'DELETE #remove_product' do
    it 'removes a product from the cart' do
      product = Product.create!(name: 'Product 1', price: 100.0, quantity: 10)
      session[:cart] = [{ 'id' => product.id, 'quantity' => 1 }]
      delete :remove_product, params: { product_id: product.id }
      expect(session[:cart]).to be_empty
    end
  end
end
