require 'rails_helper'

RSpec.describe Product::AffiliateItem, type: :model do
  it "is valid with valid attributes" do
    item = build(:affiliate_item)
    expect(item).to be_valid
  end

  it "is not valid without an external_url" do
    item = build(:affiliate_item, external_url: nil)
    expect(item).not_to be_valid
  end

  it "can generate an affiliate link" do
    item = create(:affiliate_item)
    expect(item.generate_affiliate_link).to include(item.tracking_code)
  end
end
