require 'rails_helper'

RSpec.describe 'Merchant Items API' do
  before :each do
    @merchant = create(:merchant)

    create_list(:item, 3, merchant: @merchant)
  end

  describe 'Happy path' do
    it "shows a list of a merchant's items" do
      get "/api/v1/merchants/#{@merchant.id}/items"

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(items[:data].count).to eq(3)
      
      items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_an(String)
        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)
        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes][:description]).to be_a(String)
        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes][:unit_price]).to be_a(Float)
        expect(item[:attributes]).to have_key(:merchant_id)
        expect(item[:attributes][:merchant_id]).to be_a(Integer)
      end
    end
  end

  describe 'Sad path' do
    it 'Returns 404 with bad merchant id' do
      get '/api/v1/merchants/100000000/items'

      expect(response.status).to eq 404
    end
  end
end
