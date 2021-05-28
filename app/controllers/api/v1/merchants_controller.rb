class API::V1::MerchantsController < API::APIController
  def index
    page = [params.fetch(:page, 1).to_i, 1].max
    per_page = params.fetch(:per_page, 20).to_i

    merchants = Merchant.limit(per_page).offset((page - 1) * per_page)
    render json: MerchantSerializer.new(merchants)
  end

  def show
    @merchant = Merchant.find(params[:id])
    if params[:id]
      render json: MerchantSerializer.new(@merchant)
    else
      render json: { errors: @merchant.errors.full_messages }, status: :not_found
    end
  end
end
