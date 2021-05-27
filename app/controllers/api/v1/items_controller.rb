class API::V1::ItemsController < ApplicationController
  def index
    page = [params.fetch(:page, 1).to_i, 1].max
    per_page = params.fetch(:per_page, 20).to_i
  
    items = Item.limit(per_page).offset((page - 1) * per_page)
    render json: ItemSerializer.new(items)
  end

  def show
    if item = Item.find(params[:id])
      render json: ItemSerializer.new(item)
    else 
      render json: item.errors.full_messages, status: not_found
    end 
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(item), status: 201
    else
      render :json => { :errors => item.errors.full_messages }, :status => 404
    end 
  end

  def update
    item = Item.find(params[:id])
    if item.update!(item_params)
      render json: ItemSerializer.new(item)
    else
      render json: item.errors.full_messages, status: unprocessable_entity
    end 
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
