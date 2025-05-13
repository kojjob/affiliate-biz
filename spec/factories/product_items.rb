FactoryBot.define do
  factory :product_item, class: 'Product::Item' do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    slug { nil } # Will be auto-generated
    price { Faker::Commerce.price(range: 10..100) }
  end
end
