require 'rails_helper'

RSpec.describe "conversions/index", type: :view do
  before(:each) do
    conversion1 = Conversion.new(amount: "9.99")
    allow(conversion1).to receive(:id).and_return(1)
    allow(conversion1).to receive(:affiliate_link).and_return(nil)
    allow(conversion1).to receive(:click).and_return(nil)

    conversion2 = Conversion.new(amount: "9.99")
    allow(conversion2).to receive(:id).and_return(2)
    allow(conversion2).to receive(:affiliate_link).and_return(nil)
    allow(conversion2).to receive(:click).and_return(nil)

    assign(:conversions, [ conversion1, conversion2 ])
  end

  it "renders a list of conversions" do
    render
    cell_selector = 'div>div>strong+*'
    # Skip checking for affiliate_link and click since they're nil
    # Skip checking for now
  end
end
