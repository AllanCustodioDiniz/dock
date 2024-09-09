require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new product' do
      post :create, params: { product: { name: 'Product 1', price: 100.0, quantity: 10 } }
      expect(Product.last.name).to eq('Product 1')
    end
  end

  describe 'PATCH #update' do
    it 'updates an existing product' do
      product = Product.create!(name: 'Product 1', price: 100.0, quantity: 10)
      patch :update, params: { id: product.id, product: { name: 'Updated Product' } }
      expect(product.reload.name).to eq('Updated Product')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a product' do
      product = Product.create!(name: 'Product 1', price: 100.0, quantity: 10)
      delete :destroy, params: { id: product.id }
      expect(Product.exists?(product.id)).to be_falsey
    end
  end
end
