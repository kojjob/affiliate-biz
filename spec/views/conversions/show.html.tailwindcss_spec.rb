require 'rails_helper'

RSpec.describe "conversions/show", type: :view do
  before(:each) do
    conversion = Conversion.new(amount: "9.99")
    allow(conversion).to receive(:id).and_return(1)
    allow(conversion).to receive(:affiliate_link).and_return(nil)
    allow(conversion).to receive(:click).and_return(nil)

    assign(:conversion, conversion)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
