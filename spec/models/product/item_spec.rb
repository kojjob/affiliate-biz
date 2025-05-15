require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    item = build(:product, name: "Test Product", slug: "test-product")
    expect(item).to be_valid
  end

  it "is not valid without a name" do
    item = build(:product, name: nil)
    expect(item).not_to be_valid
  end

  it "generates a slug if not provided" do
    item = create(:product, name: "Auto Slug Test", slug: nil)
    expect(item.slug).to eq("auto-slug-test")
  end
end
