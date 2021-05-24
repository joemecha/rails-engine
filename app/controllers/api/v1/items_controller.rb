class API::V1::ItemsController < API::APIController
  def index
    page = [params.fetch(:page, 1).to_i, 1].max
    per_page = params.fetch(:per_page, 20).to_i

    items = Item.limit(per_page).offset((page - 1) * per_page)

    render json: items
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    item = Item.create!(item_params)
    render json: item
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
