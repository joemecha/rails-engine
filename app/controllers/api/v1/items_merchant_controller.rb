class API::V1::ItemsMerchantController < ApplicationController
  def index
    item = Item.find(params[:item_id])
    render json: item.merchant
  end
end