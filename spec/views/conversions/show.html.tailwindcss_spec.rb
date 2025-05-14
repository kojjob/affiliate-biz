require 'rails_helper'

RSpec.describe "conversions/show", type: :view do
  before(:each) do
    assign(:conversion, Conversion.create!(
      affiliate_link: nil,
      click: nil,
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
