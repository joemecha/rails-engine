require 'rails_helper'

RSpec.describe 'Find all matching Items API' do
 before :each do
    @merchant_5 = create(:merchant, name: 'Fresh Mammoth')

    @item_1 = create(:item, merchant_id: @merchant_5.id)
    @item_2 = create(:item, merchant_id: @merchant_5.id)
    @item_3 = create(:item, name: "Handcarved stout table", description: "something nice", merchant_id: @merchant_5.id)
    @item_4 = create(:item, merchant_id: @merchant_5.id)
    @item_5 = create(:item, merchant_id: @merchant_5.id)
    @item_6 = create(:item, merchant_id: @merchant_5.id)
  end

  describe 'Happy path' do
    it 'Find all items by name fragment' do
      get '/api/v1/items/find_all?name=Carved s'
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      
      found_items = JSON.parse(response.body, symbolize_names: true)
      
      expect(found_items.keys).to eq([:data])
      expect(found_items[:data].first).to be_a(Hash)
      expect(found_items[:data].first.keys).to eq([:id, :type, :attributes])
      expect(found_items[:data].first[:id]).to eq("#{@item_3.id}")

      expect(found_items[:data].first).to have_key(:type)
      expect(found_items[:data].first[:type]).to eq('item')

      expect(found_items[:data].first[:attributes]).to have_key(:name)
      expect(found_items[:data].first[:attributes][:name]).to be_a(String)
      expect(found_items[:data].first[:attributes][:name]).to eq("Handcarved stout table")

      expect(found_items[:data].first[:attributes]).to have_key(:description)
      expect(found_items[:data].first[:attributes][:description]).to be_a(String)
      expect(found_items[:data].first[:attributes][:description]).to eq("something nice")
    end
  end

  describe 'sad path' do
    it 'no fragment matched' do
      get '/api/v1/merchants/find?name=NOMATCH'
      expect(response).to be_successful
      
      not_a_merchant = JSON.parse(response.body, symbolize_names: true)
      expect(not_a_merchant[:data]).to eq(nil)
    end
  end

end