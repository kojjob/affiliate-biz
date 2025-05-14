require 'rails_helper'

RSpec.describe "conversions/edit", type: :view do
  let(:conversion) {
    Conversion.create!(
      affiliate_link: nil,
      click: nil,
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:conversion, conversion)
  end

  it "renders the edit conversion form" do
    render

    assert_select "form[action=?][method=?]", conversion_path(conversion), "post" do
      assert_select "input[name=?]", "conversion[affiliate_link_id]"

      assert_select "input[name=?]", "conversion[click_id]"

      assert_select "input[name=?]", "conversion[amount]"
    end
  end
end
