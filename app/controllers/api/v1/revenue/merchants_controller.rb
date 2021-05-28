class API::V1::Revenue::MerchantsController < ApplicationController
  def index
    # returns a quantity of merchants sorted by descending revenue
    if params[:quantity] && params[:quantity].to_i > 0
      merchants = Merchant.revenue(params[:quantity])
      render json: MerchantRevenueSerializer.new(merchants)
    else
      render json: { errors: 'Bad Request' }, status: :bad_request
    end 
  end

  def show
    # total revenue for a given merchant
    if params[:id]
      merchant = Merchant.find(params[:id])
      merchant.revenue
      render json: MerchantRevenueSerializer.new(merchant)
    else
      render json: { errors: 'Not Found' }, status: :not_found
    end 
  end
end
