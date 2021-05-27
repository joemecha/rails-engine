require 'rails_helper'

RSpec.describe 'Find one Merchant API' do
  before :each do
    @merchant_1 = create(:merchant, name: 'The Screaming Carpet')
    @merchant_2 = create(:merchant, name: 'Elegant Bean Bags')
    @merchant_3 = create(:merchant, name: 'Thunder Dogs')
    @merchant_4 = create(:merchant, name: 'Wish You Wash Here')
    @merchant_5 = create(:merchant, name: 'Fresh Mammoth')
  end

  describe 'Happy path' do
    it 'Find one merchant by fragment' do
      get '/api/v1/merchants/find?name=nDer d'
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      
      found_merchant = JSON.parse(response.body, symbolize_names: true)
      
      expect(found_merchant.keys).to eq([:data])
      expect(found_merchant[:data]).to be_a(Hash)
      expect(found_merchant[:data].keys).to eq([:id, :type, :attributes])
      expect(found_merchant[:data][:id]).to eq("#{@merchant_3.id}")

      expect(found_merchant[:data]).to have_key(:type)
      expect(found_merchant[:data][:type]).to eq('merchant')

      expect(found_merchant[:data][:attributes]).to have_key(:name)
      expect(found_merchant[:data][:attributes][:name]).to be_a(String)
      expect(found_merchant[:data][:attributes][:name]).to eq(@merchant_3.name)
    end
  end

  describe 'sad path' do
    it 'no fragment matched' do
      get '/api/v1/merchants/find?name=NOMATCH'

      expect(response).to be_successful

      not_a_merchant = JSON.parse(response.body, symbolize_names: true)

      expect(not_a_merchant.keys).to include(:data)
      expect(not_a_merchant[:data]).to be_an(Object)
    end
  end
end