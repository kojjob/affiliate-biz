require 'rails_helper'

RSpec.describe "conversions/index", type: :view do
  before(:each) do
    assign(:conversions, [
      Conversion.create!(
        affiliate_link: nil,
        click: nil,
        amount: "9.99"
      ),
      Conversion.create!(
        affiliate_link: nil,
        click: nil,
        amount: "9.99"
      )
    ])
  end

  it "renders a list of conversions" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
