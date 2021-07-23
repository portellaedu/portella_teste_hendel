FactoryBot.define do
  factory :related_product do
    related_product_id { 1 }
    product { nil }
  end
end
