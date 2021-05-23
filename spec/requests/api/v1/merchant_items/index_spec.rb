require 'rails_helper'

RSpec.describe "Merchant Items API" do
  before :each do
    @merchant = create(:merchant)

    create_list(:item, 3, merchant: @merchant)
  end

  describe "happy path" do
    it "shows a list of a merchant's items" do
      create_list(:merchant, 20)
      get "/api/v1/merchants/#{@merchant.id}/items"

      items = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful

      expect(items.count).to eq(3)

      items.each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_an(Integer)
        expect(item).to have_key(:name)
        expect(item[:name]).to be_a(String)
        expect(item).to have_key(:description)
        expect(item[:description]).to be_a(String)
        expect(item).to have_key(:unit_price)
        expect(item[:unit_price]).to be_a(Float)
        expect(item).to have_key(:merchant_id)
        expect(item[:merchant_id]).to be_a(Integer)
      end
    end
  end 




  #   it 'sends a list of merchants 20 at a time' do
  #     create_list(:merchant, 21)
  #     get '/api/v1/merchants'
  #     expect(response).to be_successful
  #     first_merchants = JSON.parse(response.body, symbolize_names: true)

  #     get '/api/v1/merchants?page=0'
  #     expect(response).to be_successful
  #     page_0_merchants = JSON.parse(response.body, symbolize_names: true)

  #     expect(first_merchants.count).to eq(20)
  #     expect(first_merchants).to eq(page_0_merchants)
  #   end

  #   it 'shows the second 20 merchants' do
  #     create_list(:merchant, 40)
  #     get '/api/v1/merchants?page=1'

  #     expect(response).to be_successful

  #     page_2 = JSON.parse(response.body, symbolize_names: true)

  #     expect(page_2.count).to eq(20)
  #   end

  #   it 'shows first page of 50 merchants' do
  #     create_list(:merchant, 51)
  #     get '/api/v1/merchants?per_page=50'

  #     expect(response).to be_successful
  #     merchants = JSON.parse(response.body, symbolize_names: true)

  #     expect(merchants.count).to eq(50)
  #   end

  #   it 'shows all merchants for large per_page requests' do
  #     create_list(:merchant, 101)
  #     get '/api/v1/merchants?per_page=100'

  #     expect(response).to be_successful

  #     merchants = JSON.parse(response.body, symbolize_names: true)

  #     expect(merchants.count).to eq(100)
  #   end

  #   it 'shows a blank page for range of merchants that contains no data' do
  #     get '/api/v1/merchants?page=300'

  #     expect(response).to be_successful
  #     merchants = JSON.parse(response.body, symbolize_names: true)

  #     expect(merchants.count).to eq(0)
  #   end
  # end

  # describe 'sad path' do
  #   it 'shows page 1 if page is 0 or lower' do
  #     get '/api/v1/merchants?page=1'
  #     page_1 = JSON.parse(response.body, symbolize_names: true)

  #     get '/api/v1/merchants?page=0'
  #     expect(response).to be_successful
  #     page_0 = JSON.parse(response.body, symbolize_names: true)

  #     expect(page_1).to eq(page_0)
  #   end
  # end
end 
