require 'rails_helper'

RSpec.describe "clicks/edit", type: :view do
  let(:click) {
    Click.create!(
      affiliate_link: nil,
      ip_hash: "MyString",
      referrer: "MyString",
      user_agent: "MyString"
    )
  }

  before(:each) do
    assign(:click, click)
  end

  it "renders the edit click form" do
    render

    assert_select "form[action=?][method=?]", click_path(click), "post" do
      assert_select "input[name=?]", "click[affiliate_link_id]"

      assert_select "input[name=?]", "click[ip_hash]"

      assert_select "input[name=?]", "click[referrer]"

      assert_select "input[name=?]", "click[user_agent]"
    end
  end
end
