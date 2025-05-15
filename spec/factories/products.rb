FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    slug { nil } # Will be auto-generated
    price { Faker::Commerce.price(range: 10..100) }
    sku { Faker::Alphanumeric.alphanumeric(number: 10).upcase }

    # For affiliate items
    trait :affiliate do
      external_url { Faker::Internet.url }
      commission_rate { rand(5..30) }
      tracking_code { Faker::Alphanumeric.alphanumeric(number: 8) }
    end

    # For dropship items
    trait :dropship do
      supplier_cost { (price.to_f * 0.6).round(2) }
      shipping_cost { 5.99 }
      association :supplier
    end
  end
end
