require 'rails_helper'

RSpec.describe 'Items API' do
  before :each do 
    @merchant = create(:merchant)
    create_list(:item, 100, merchant: @merchant)
  end

  describe "Happy path" do
    it 'sends a list of items' do
      
      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(items.count).to eq(100)

      items.each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_an(Integer)
        expect(item).to have_key(:name)
        expect(item[:name]).to be_a(String)
      end
    end
  end 
  #   it 'sends a list of items 20 at a time' do
  #     create_list(:item, 21)
  #     get '/api/v1/items'
  #     expect(response).to be_successful
  #     first_items = JSON.parse(response.body, symbolize_names: true)

  #     get '/api/v1/items?page=0'
  #     expect(response).to be_successful
  #     page_0_items = JSON.parse(response.body, symbolize_names: true)

  #     expect(first_items.count).to eq(20)
  #     expect(first_items).to eq(page_0_items)
  #   end

  #   it 'shows the second 20 items' do
  #     create_list(:item, 40)
  #     get '/api/v1/items?page=1'

  #     expect(response).to be_successful

  #     page_2 = JSON.parse(response.body, symbolize_names: true)

  #     expect(page_2.count).to eq(20)
  #   end

  #   it 'shows first page of 50 items' do
  #     get '/api/v1/items?per_page=50'

  #     expect(response).to be_successful
  #     items = JSON.parse(response.body, symbolize_names: true)

  #     expect(items.count).to eq(50)
  #   end

  #   it 'shows all items for large per_page requests' do
  #     get '/api/v1/items?per_page=100'

  #     expect(response).to be_successful

  #     items = JSON.parse(response.body, symbolize_names: true)

  #     expect(items.count).to eq(100)
  #   end

  #   it 'shows a blank page for range of items that contains no data' do
  #     get '/api/v1/items?page=300'

  #     expect(response).to be_successful
  #     items = JSON.parse(response.body, symbolize_names: true)

  #     expect(items.count).to eq(0)
  #   end
  # end

  # describe 'sad path' do
  #   it 'shows page 1 if page is 0 or lower' do
  #     get '/api/v1/items?page=1'
  #     page_1 = JSON.parse(response.body, symbolize_names: true)

  #     get '/api/v1/items?page=0'
  #     expect(response).to be_successful
  #     page_0 = JSON.parse(response.body, symbolize_names: true)

  #     expect(page_1).to eq(page_0)
  #   end
  # end
end