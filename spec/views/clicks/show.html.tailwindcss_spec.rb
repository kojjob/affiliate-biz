require 'rails_helper'

RSpec.describe "clicks/show", type: :view do
  before(:each) do
    assign(:click, Click.create!(
      affiliate_link: nil,
      ip_hash: "Ip Hash",
      referrer: "Referrer",
      user_agent: "User Agent"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Ip Hash/)
    expect(rendered).to match(/Referrer/)
    expect(rendered).to match(/User Agent/)
  end
end
