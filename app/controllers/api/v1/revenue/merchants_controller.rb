class API::V1::Revenue::MerchantsController < ApplicationController
  def index
    # returns a quantity of merchants sorted by descending revenue
    if params[:quantity] && params[:quantity].to_i.positive?
      merchants = Merchant.revenue(params[:quantity])
    else
      render json: { error: 'Bad Request' }, status: :bad_request
    end
  end

  def show
    # total revenue for a given merchant
    if Merchant.where(id: params[:id]).exists?
      merchant = Merchant.find(params[:id])
      render json: MerchantRevenueSerializer.new(merchant.one_revenue.first)
    else
      render json: { error: 'Not Found' }, status: :not_found
    end
  end
end
