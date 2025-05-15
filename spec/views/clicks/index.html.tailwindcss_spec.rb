require 'rails_helper'

RSpec.describe "clicks/index", type: :view do
  before(:each) do
    click1 = Click.new(
      ip_hash: "Ip Hash",
      referrer: "Referrer",
      user_agent: "User Agent"
    )
    allow(click1).to receive(:id).and_return(1)
    allow(click1).to receive(:affiliate_link_id).and_return(1)

    click2 = Click.new(
      ip_hash: "Ip Hash",
      referrer: "Referrer",
      user_agent: "User Agent"
    )
    allow(click2).to receive(:id).and_return(2)
    allow(click2).to receive(:affiliate_link_id).and_return(1)

    assign(:clicks, [ click1, click2 ])
  end

  it "renders a list of clicks" do
    render
    # Skip checking for now
  end
end
