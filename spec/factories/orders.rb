FactoryBot.define do
  factory :order, class: 'Order::Order' do
    customer_email { Faker::Internet.email }
    status { "pending" }
    total_amount { 0 }
  end

  factory :order_item, class: 'Order::OrderItem' do
    quantity { Faker::Number.between(from: 1, to: 5) }
    price { Faker::Commerce.price(range: 10..100) }

    association :order
    association :product, factory: :dropship_item
  end
end
