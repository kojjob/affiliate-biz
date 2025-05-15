FactoryBot.define do
  factory :dropship_item, class: 'Product::DropshipItem' do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    slug { nil } # Will be auto-generated
    product_type { 'Product::DropshipItem' }
    price { Faker::Commerce.price(range: 30..200) }
    supplier_cost { (price.to_f * 0.6).round(2) }
    shipping_cost { 5.99 }
    sku { Faker::Alphanumeric.alphanumeric(number: 10).upcase }

    association :supplier, factory: :supplier
  end

  factory :supplier, class: 'Product::Supplier' do
    name { Faker::Company.name }
    api_key { Faker::Alphanumeric.alphanumeric(number: 32) }
    api_url { Faker::Internet.url(host: 'api.example.com') }
  end

  factory :inventory, class: 'Product::Inventory' do
    quantity { Faker::Number.between(from: 1, to: 100) }
    sku { Faker::Alphanumeric.alphanumeric(number: 10).upcase }

    association :product, factory: :dropship_item
    association :supplier
  end
end
