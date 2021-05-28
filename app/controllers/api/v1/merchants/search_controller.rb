class API::V1::Merchants::SearchController < ApplicationController
  def index
    if params[:name]
      merchant = Merchant.search_one(params[:name]).first
      render json: MerchantSerializer.new(merchant)
    elsif Merchant.search_one(params[:name]).nil?
      raise ActionController::RoutingError, 'Not Found'
    elsif !params[:name]
      render json: merchant.errors, status: 'unprocessible entity'
    end
  end
end
