class API::V1::MerchantsController < API::APIController 

  def index
    @page = params[:page].to_i || 0
    @merchants = Merchant.limit(20).offset(@page * 20)
    render json: @merchants
  end

  def show 
    render json: Merchant.find(params[:id])
  end

end