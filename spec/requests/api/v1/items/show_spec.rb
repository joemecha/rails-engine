require 'rails_helper'

RSpec.describe 'Items API' do
  before :each do
    merchant = create(:merchant)
    @item = create(:item, merchant: merchant)
  end

  describe 'Happy path' do
    it 'gets one item by its id' do
      get "/api/v1/items/#{@item.id}"

      item_info = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item_info[:data]).to have_key(:id)
      expect(item_info[:data][:id].to_i).to eq(@item.id)

      expect(item_info[:data]).to have_key(:attributes)
      expect(item_info[:data][:attributes][:name]).to be_a(String)
    end
  end
end