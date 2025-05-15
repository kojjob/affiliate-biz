require "rails_helper"

RSpec.describe StaticController, type: :routing do
  describe "routing" do
    it "routes to #about" do
      expect(get: "/about").to route_to("static#about")
    end
  end
end
