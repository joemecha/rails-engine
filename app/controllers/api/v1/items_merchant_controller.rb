class API::V1::ItemsMerchantController < ApplicationController
  def index
    if Item.where(id: params[:item_id]).exists?
      item = Item.find(params[:item_id])
      render json: MerchantSerializer.new(item.merchant)
    else
      render :json => { :errors => "Not Found" }, :status => 404
    end 
  end 
end 
