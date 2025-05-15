require 'rails_helper'

RSpec.describe "clicks/new", type: :view do
  before(:each) do
    # Create a stub affiliate link
    @affiliate_link = double(Marketing::AffiliateLink, id: 1, destination_url: "https://example.com")
    allow(Marketing::AffiliateLink).to receive(:all).and_return([ @affiliate_link ])

    assign(:click, Click.new(
      ip_hash: "MyString",
      referrer: "MyString",
      user_agent: "MyString"
    ))
  end

  it "renders new click form" do
    render

    assert_select "form[action=?][method=?]", clicks_path, "post" do
      assert_select "input[name=?]", "click[affiliate_link_id]"

      assert_select "input[name=?]", "click[ip_hash]"

      assert_select "input[name=?]", "click[referrer]"

      assert_select "input[name=?]", "click[user_agent]"
    end
  end
end
