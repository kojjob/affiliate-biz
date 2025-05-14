require 'rails_helper'

RSpec.describe "clicks/index", type: :view do
  before(:each) do
    assign(:clicks, [
      Click.create!(
        affiliate_link: nil,
        ip_hash: "Ip Hash",
        referrer: "Referrer",
        user_agent: "User Agent"
      ),
      Click.create!(
        affiliate_link: nil,
        ip_hash: "Ip Hash",
        referrer: "Referrer",
        user_agent: "User Agent"
      )
    ])
  end

  it "renders a list of clicks" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ip Hash".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Referrer".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("User Agent".to_s), count: 2
  end
end
