require "rails_helper"

RSpec.describe API::V1::Revenue::MerchantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/revenue/merchants").to route_to("api/v1/revenue/merchants#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/revenue/merchants/1").to route_to("api/v1/revenue/merchants#show", id: "1")
    end
  end 
end
