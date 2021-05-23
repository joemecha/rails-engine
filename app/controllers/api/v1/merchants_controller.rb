class API::V1::MerchantsController < API::APIController
  def index
    page = params[:page].to_i || 0
    if params[:per_page].present?
      results_limit = params[:per_page].to_i
      merchants = Merchant.limit(results_limit).offset(page * results_limit)
    else
      merchants = Merchant.limit(20).offset(page * 20)
    end
    render json: merchants
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: merchant
  end
end
