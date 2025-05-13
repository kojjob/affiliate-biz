FactoryBot.define do
  factory :affiliate_item, class: 'Product::AffiliateItem' do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    slug { nil } # Will be auto-generated
    product_type { 'Product::AffiliateItem' }
    external_url { Faker::Internet.url }
    commission_rate { rand(0.05..0.3) }
    tracking_code { Faker::Alphanumeric.alphanumeric(number: 8) }
  end
end
