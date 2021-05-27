class API::V1::Items::SearchController < ApplicationController 
  def index 
    if params[:name]
      items = Item.search_all(params[:name])
      render json: ItemSerializer.new(items)
    elsif 
      !params[:name] || items.search_all(params[:name]).nil?
      raise ActionController::RoutingError.new("Not Found")
      render json: items.errors, status: "unprocessible entity"
    end
  end
end