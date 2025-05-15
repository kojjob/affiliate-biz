require 'rails_helper'

RSpec.describe Order::Order, type: :model do
  it "is valid with valid attributes" do
    order = build(:order)
    expect(order).to be_valid
  end

  it "calculates total correctly" do
    order = create(:order)
    create(:order_item, order: order, price: 50, quantity: 2)
    create(:order_item, order: order, price: 30, quantity: 1)

    order.reload
    expect(order.calculate_total).to eq(130) # (50*2) + (30*1)
  end

  it "transitions through valid states" do
    order = create(:order)
    expect(order.status).to eq("pending")

    order.process!
    expect(order.status).to eq("processing")

    order.ship!
    expect(order.status).to eq("shipped")

    order.deliver!
    expect(order.status).to eq("delivered")
  end
end
