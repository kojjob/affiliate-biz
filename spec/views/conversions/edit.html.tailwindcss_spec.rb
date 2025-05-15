require 'rails_helper'

RSpec.describe "conversions/edit", type: :view do
  before(:each) do
    # Create a stub affiliate link
    @affiliate_link = double(Marketing::AffiliateLink, id: 1, destination_url: "https://example.com")
    allow(Marketing::AffiliateLink).to receive(:all).and_return([ @affiliate_link ])

    # Create a stub click
    @click = double(Click, id: 1, ip_hash: "MyString")
    allow(Click).to receive(:all).and_return([ @click ])

    @conversion = Conversion.new(amount: "9.99")
    allow(@conversion).to receive(:id).and_return(1)
    allow(@conversion).to receive(:persisted?).and_return(true)

    assign(:conversion, @conversion)
  end

  it "renders the edit conversion form" do
    render

    assert_select "form[action=?][method=?]", conversion_path(@conversion), "post" do
      assert_select "input[name=?]", "conversion[affiliate_link_id]"

      assert_select "input[name=?]", "conversion[click_id]"

      assert_select "input[name=?]", "conversion[amount]"
    end
  end
end
