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
      expect(merchant_info).to have_key(:id)
      expect(merchant_info[:id].to_i).to eq(@merchant.id)

      expect(merchant_info).to have_key(:name)
      expect(merchant_info[:name]).to be_a(String)
    end
  end
end

