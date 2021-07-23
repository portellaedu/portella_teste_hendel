FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    description { Faker::Lorem.sentences.join }
    price { Faker::Commerce.price }
    quantity { Faker::Number.between(from: 0, to: 50) }
  end
end
