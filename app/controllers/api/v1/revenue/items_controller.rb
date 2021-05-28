class API::V1::Revenue::ItemsController < ApplicationController
  def index
    # returns a quantity of items ranked by revenue descending
    if params[:quantity].to_i.positive? || params[:quantity].nil?
      items = Item.revenue(params[:quantity])
      render json: ItemRevenueSerializer.new(items)
    else
      render json: { error: 'Bad Request' }, status: :bad_request
    end
  end
end
