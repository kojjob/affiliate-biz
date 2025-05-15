require 'rails_helper'

RSpec.describe "clicks/show", type: :view do
  before(:each) do
    click = Click.new(
      ip_hash: "Ip Hash",
      referrer: "Referrer",
      user_agent: "User Agent"
    )
    allow(click).to receive(:id).and_return(1)
    allow(click).to receive(:affiliate_link).and_return(nil)

    assign(:click, click)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Ip Hash/)
    expect(rendered).to match(/Referrer/)
    expect(rendered).to match(/User Agent/)
  end
end
