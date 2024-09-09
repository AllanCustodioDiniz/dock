# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { "Default Product" }
    price { 100.0 }
    quantity { 10 }
  end
end
