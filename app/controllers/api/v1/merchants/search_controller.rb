class API::V1::Merchants::SearchController < ApplicationController 
  def index 
    if params[:name]
      merchant = Merchant.search_one(params[:name]).first
      render json: MerchantSerializer.new(merchant)
    elsif 
      if Merchant.search_one(params[:name]).nil?
        require 'pry'; binding.pry
        raise ActionController::RoutingError.new("Not Found")
      elsif !params[:name]
        require 'pry'; binding.pry
        render json: merchant.errors, status: "unprocessible entity"
      end 
    end
  end
end
