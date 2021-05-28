class API::V1::Revenue::MerchantsController < ApplicationController
  before_action :set_api_v1_revenue_merchant, only: %i[ show update destroy ]

  # GET /api/v1/revenue/merchants
  # GET /api/v1/revenue/merchants.json
  def index
    @api_v1_revenue_merchants = API::V1::Revenue::Merchant.all
  end

  # GET /api/v1/revenue/merchants/1
  # GET /api/v1/revenue/merchants/1.json
  def show
  end

  # POST /api/v1/revenue/merchants
  # POST /api/v1/revenue/merchants.json
  def create
    @api_v1_revenue_merchant = API::V1::Revenue::Merchant.new(api_v1_revenue_merchant_params)

    if @api_v1_revenue_merchant.save
      render :show, status: :created, location: @api_v1_revenue_merchant
    else
      render json: @api_v1_revenue_merchant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/revenue/merchants/1
  # PATCH/PUT /api/v1/revenue/merchants/1.json
  def update
    if @api_v1_revenue_merchant.update(api_v1_revenue_merchant_params)
      render :show, status: :ok, location: @api_v1_revenue_merchant
    else
      render json: @api_v1_revenue_merchant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/revenue/merchants/1
  # DELETE /api/v1/revenue/merchants/1.json
  def destroy
    @api_v1_revenue_merchant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_revenue_merchant
      @api_v1_revenue_merchant = API::V1::Revenue::Merchant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_revenue_merchant_params
      params.fetch(:api_v1_revenue_merchant, {})
    end
end
