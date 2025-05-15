require 'rails_helper'

RSpec.describe Product, type: :model do
  context "as a dropship item" do
    it "is valid with supplier_cost" do
      item = build(:product, supplier_cost: 60)
      expect(item).to be_valid
    end

    it "calculates profit margin correctly" do
      item = build(:product, price: 100, supplier_cost: 60)
      expect(item.profit_margin).to eq(40) # (100 - 60) / 100 * 100 = 40%
      expect(item.profit_percentage).to eq(0.4) # 40%
    end

    it "has inventory tracking methods" do
      item = create(:product, supplier_cost: 60)
      expect(item.respond_to?(:total_inventory)).to eq(true)
      expect(item.respond_to?(:in_stock?)).to eq(true)
    end
  end
end
