require "rails_helper"

RSpec.describe API::V1::Revenue::ItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/revenue/items").to route_to("api/v1/revenue/items#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/revenue/items/1").to route_to("api/v1/revenue/items#show", id: "1")
    end
  end
end
