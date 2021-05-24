require 'rails_helper'

RSpec.describe 'Item Merchant API' do
  before :each do
    @merchant = create(:merchant)
    @item = create(:item, merchant: @merchant)
  end

  describe 'Happy path' do
    it "shows information about an item's merchant" do
      get "/api/v1/items/#{@item.id}/merchant"

      merchant_info = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(merchant_info.count).to eq(1)
      expect(merchant_info).to have_key(:id)
      expect(merchant_info[:id]).to be_an(Integer)
      expect(merchant_info).to have_key(:name)
      expect(merchant_info[:name]).to be_a(String)
      expect(merchant_info[:id]).to eq(@item.id)
    end
  end
end

  # describe 'Sad path' do
  #   it 'Returns 404 with bad item id' do
  #     get '/api/v1/items/100000000/merchant'

  #     expect(response.status).to eq 404
  #   end
  # end
