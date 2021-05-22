class API::V1::MerchantsController < API::APIController

  def index
    render json: Merchant.all
  end

  def show 
    render json: Merchant.find(params[:id])
  end
end