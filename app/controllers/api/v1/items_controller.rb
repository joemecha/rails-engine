class API::V1::ItemsController < API::APIController
  def index
    page = params[:page].to_i || 0
    if params[:per_page].present?
      results_limit = params[:per_page].to_i
      items = Item.limit(results_limit).offset(page * results_limit)
    else
      items = Item.limit(20).offset(page * 20)
    end
    render json: items
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create; end

  def update; end

  def destroy; end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
