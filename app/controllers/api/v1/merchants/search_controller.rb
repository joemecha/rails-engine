class API::V1::Merchants::SearchController < ApplicationController 
  def index 
    if params[:name]
      merchant = Merchant.search_one(params[:name])
      
      # require 'pry'; binding.pry
      render json: MerchantSerializer.new(merchant)
    elsif 
      !params[:name] || Merchant.search_one(params[:name]).nil?
      raise ActionController::RoutingError.new("Not Found")
      render json: merchant.errors, status: "unprocessible entity"
    end
  end
end
