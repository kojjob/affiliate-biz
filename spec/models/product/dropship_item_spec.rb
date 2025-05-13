require 'rails_helper'

RSpec.describe Product::DropshipItem, type: :model do
  it "is valid with valid attributes" do
    item = build(:dropship_item)
    expect(item).to be_valid
  end

  it "calculates profit margin correctly" do
    item = build(:dropship_item, price: 100, supplier_cost: 60, shipping_cost: 10)
    expect(item.profit_margin).to eq(30) #  profit
    expect(item.profit_percentage).to eq(0.3) # 30%
  end

  it "tracks inventory quantity" do
    item = create(:dropship_item)
    inventory = create(:inventory, product: item, quantity: 10)

    expect(item.total_inventory).to eq(10)
  end
end
