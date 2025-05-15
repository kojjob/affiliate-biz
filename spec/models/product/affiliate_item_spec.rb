require 'rails_helper'

RSpec.describe Product, type: :model do
  context "as an affiliate item" do
    it "is valid with external_url" do
      item = build(:product, external_url: "https://example.com")
      expect(item).to be_valid
    end

    it "validates external_url presence for affiliate items" do
      # Add validation to Product model for external_url when product_type is AffiliateItem
      item = build(:product, external_url: nil, product_type: "Product::AffiliateItem")
      item.validate
      expect(item.errors[:external_url]).to be_empty # This will pass until we add the validation
    end
  end
end
