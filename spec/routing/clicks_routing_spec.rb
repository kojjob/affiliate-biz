require "rails_helper"

RSpec.describe ClicksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/clicks").to route_to("clicks#index")
    end

    it "routes to #new" do
      expect(get: "/clicks/new").to route_to("clicks#new")
    end

    it "routes to #show" do
      expect(get: "/clicks/1").to route_to("clicks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/clicks/1/edit").to route_to("clicks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/clicks").to route_to("clicks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/clicks/1").to route_to("clicks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/clicks/1").to route_to("clicks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/clicks/1").to route_to("clicks#destroy", id: "1")
    end
  end
end
