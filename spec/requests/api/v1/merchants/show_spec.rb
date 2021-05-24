require 'rails_helper'

RSpec.describe 'Merchants API' do
  before :each do
    @merchant = create(:merchant)
  end

  describe 'Happy path' do
    it 'gets one merchant by its id' do
      get "/api/v1/merchants/#{@merchant.id}"

      merchant_info = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(merchant_info[:data]).to have_key(:id)
      expect(merchant_info[:data][:id].to_i).to eq(@merchant.id)

      expect(merchant_info[:data]).to have_key(:attributes)
      expect(merchant_info[:data][:attributes][:name]).to be_a(String)
    end
  end
end

