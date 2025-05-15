require 'rails_helper'

RSpec.describe "conversions/new", type: :view do
  before(:each) do
    # Create a stub affiliate link
    @affiliate_link = double(Marketing::AffiliateLink, id: 1, destination_url: "https://example.com")
    allow(Marketing::AffiliateLink).to receive(:all).and_return([ @affiliate_link ])

    # Create a stub click
    @click = double(Click, id: 1, ip_hash: "MyString")
    allow(Click).to receive(:all).and_return([ @click ])

    assign(:conversion, Conversion.new(amount: "9.99"))
  end

  it "renders new conversion form" do
    render

    assert_select "form[action=?][method=?]", conversions_path, "post" do
      assert_select "input[name=?]", "conversion[affiliate_link_id]"

      assert_select "input[name=?]", "conversion[click_id]"

      assert_select "input[name=?]", "conversion[amount]"
    end
  end
end
