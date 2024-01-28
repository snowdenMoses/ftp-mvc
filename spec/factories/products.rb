FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    stock { rand(1..20) }
    description { Faker::Restaurant.description }
  end
end
