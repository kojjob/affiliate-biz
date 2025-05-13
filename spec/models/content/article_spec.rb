require 'rails_helper'

RSpec.describe Content::Article, type: :model do
  it "is valid with valid attributes" do
    article = build(:article)
    expect(article).to be_valid
  end

  it "generates a slug from title" do
    article = create(:article, title: "Test Article", slug: nil)
    expect(article.slug).to eq("test-article")
  end

  it "can have associated products" do
    article = create(:article)
    product = create(:affiliate_item)
    article.products << product

    expect(article.products.count).to eq(1)
  end
end
