require 'rails_helper'

RSpec.describe 'Merchants API' do
  before :each do
    create_list(:merchant, 100)
  end

  describe 'happy path' do
    it 'sends a list of merchants' do
      get '/api/v1/merchants'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchants[:data].count).to eq(20)

      merchants[:data].each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_an(String)
        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end

    it 'sends a list of first merchants 20 at a time' do
      get '/api/v1/merchants'

      expect(response).to be_successful
      first_merchants = JSON.parse(response.body, symbolize_names: true)

      get '/api/v1/merchants?page=1'
      expect(response).to be_successful
      page_1 = JSON.parse(response.body, symbolize_names: true)

      expect(first_merchants[:data].count).to eq(20)
      expect(first_merchants[:data]).to eq(page_1[:data])
    end

    it 'shows the second 20 merchants' do
      get '/api/v1/merchants?page=2'

      expect(response).to be_successful

      page_2 = JSON.parse(response.body, symbolize_names: true)

      expect(page_2[:data].count).to eq(20)
    end

    it 'shows first page of 50 merchants' do
      get '/api/v1/merchants?per_page=50'

      expect(response).to be_successful
      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(50)
    end

    it 'shows all merchants for large per_page requests' do
      get '/api/v1/merchants?per_page=100'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(100)
    end

    it 'shows a blank page for range of merchants that contains no data' do
      get '/api/v1/merchants?page=300'

      expect(response).to be_successful
      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(0)
    end
  end

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
