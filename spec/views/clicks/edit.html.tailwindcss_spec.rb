require 'rails_helper'

RSpec.describe "clicks/edit", type: :view do
  before do
    # Create a stub affiliate link
    @affiliate_link = double(Marketing::AffiliateLink, id: 1, destination_url: "https://example.com")
    allow(Marketing::AffiliateLink).to receive(:all).and_return([ @affiliate_link ])

    @click = Click.new(
      ip_hash: "MyString",
      referrer: "MyString",
      user_agent: "MyString"
    )
    allow(@click).to receive(:id).and_return(1)
    allow(@click).to receive(:persisted?).and_return(true)
    assign(:click, @click)
  end



  it "renders the edit click form" do
    render

    assert_select "form[action=?][method=?]", click_path(@click), "post" do
      assert_select "input[name=?]", "click[affiliate_link_id]"

      assert_select "input[name=?]", "click[ip_hash]"

      assert_select "input[name=?]", "click[referrer]"

      assert_select "input[name=?]", "click[user_agent]"
    end
  end
end
