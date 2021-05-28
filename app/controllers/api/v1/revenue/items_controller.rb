class API::V1::Revenue::ItemsController < ApplicationController
  def index
    # returns a quantity of items ranked by revenue descending
    if params[:quantity] && params[:quantity].to_i > 0
      items = Item.revenue(params[:quantity])
      render json: ItemRevenueSerializer.new(items)
    else
      render json: { errors: 'Bad Request' }, status: :bad_request
    end 
  end
end
