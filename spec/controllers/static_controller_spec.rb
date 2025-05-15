require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  describe "GET #about" do
    it "returns a successful response" do
      get :about
      expect(response).to be_successful
    end

    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end
end
