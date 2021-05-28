class API::V1::MerchantItemsController < ApplicationController
  def index
    if Merchant.where(id: params[:merchant_id]).exists?
      merchant = Merchant.find(params[:merchant_id])
      render json: ItemSerializer.new(merchant.items)
    else
      render json: { errors: 'Not Found' }, status: :not_found
    end
  end
end
