class API::V1::Revenue::ItemsController < ApplicationController
  before_action :set_api_v1_revenue_item, only: %i[ show update destroy ]

  # GET /api/v1/revenue/items
  # GET /api/v1/revenue/items.json
  def index
    @api_v1_revenue_items = API::V1::Revenue::Item.all
  end

  # GET /api/v1/revenue/items/1
  # GET /api/v1/revenue/items/1.json
  def show
  end

  # POST /api/v1/revenue/items
  # POST /api/v1/revenue/items.json
  def create
    @api_v1_revenue_item = API::V1::Revenue::Item.new(api_v1_revenue_item_params)

    if @api_v1_revenue_item.save
      render :show, status: :created, location: @api_v1_revenue_item
    else
      render json: @api_v1_revenue_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/revenue/items/1
  # PATCH/PUT /api/v1/revenue/items/1.json
  def update
    if @api_v1_revenue_item.update(api_v1_revenue_item_params)
      render :show, status: :ok, location: @api_v1_revenue_item
    else
      render json: @api_v1_revenue_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/revenue/items/1
  # DELETE /api/v1/revenue/items/1.json
  def destroy
    @api_v1_revenue_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_revenue_item
      @api_v1_revenue_item = API::V1::Revenue::Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_revenue_item_params
      params.fetch(:api_v1_revenue_item, {})
    end
end
