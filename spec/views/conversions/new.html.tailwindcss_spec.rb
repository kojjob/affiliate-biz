require 'rails_helper'

RSpec.describe "conversions/new", type: :view do
  before(:each) do
    assign(:conversion, Conversion.new(
      affiliate_link: nil,
      click: nil,
      amount: "9.99"
    ))
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
