class API::V1::MerchantsController < API::APIController

  def index
    render json: Merchant.all
  end
end