require 'rails_helper'

RSpec.describe "Merchants Revenue Index API /api/v1/revenue/merchants?quantity=", type: :request do
  before :each do 
    set_up 
  end 

  describe 'Revenue Merchants Happy path' do
    it 'sends a list of merchants and revenue' do
      get '/api/v1/revenue/merchants?quantity=2'

      # require 'pry'; binding.pry
      merchants = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(merchants[:data].count).to eq(2)
      expect(merchants[:data].first[:attributes][:revenue]).to eq(50.0)
      expect(merchants[:data].last[:attributes][:revenue]).to eq(5.0)

      merchants[:data].each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_an(String)
        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes][:name]).to be_a(String)
        expect(merchant[:attributes]).to have_key(:revenue)
        expect(merchant[:attributes][:revenue]).to be_a(Float)
      end
    end

    it 'sends a list of all merchants if the quantity is too large' do
      get '/api/v1/revenue/merchants?quantity=100'

      expect(response).to be_successful
      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(4)
      expect(merchants[:data].last[:attributes][:revenue]).to eq(2.0)
    end
  end 

  describe 'sad path' do
    it 'returns an error if the quantity parameter is missing or less than one' do
      get '/api/v1/revenue/merchants'

      expect(response).to_not be_successful
      expect(response.status).to eq 400
      
      get '/api/v1/revenue/merchants?quantity=0'
      expect(response).to_not be_successful
      expect(response.status).to eq 400

      get '/api/v1/revenue/merchants?quantity=nonsense'
      expect(response).to_not be_successful
      expect(response.status).to eq 400
    end
  end

  def set_up
    @merchant_1 = create(:merchant) # revenue = 3.0
    @merchant_2 = create(:merchant) # revenue = 5.0
    @merchant_3 = create(:merchant) # revenue = 0
    @merchant_4 = create(:merchant) # revenue = 50.0
    @merchant_5 = create(:merchant) # revenue = 2
    
    @item_1_1 = create(:item, merchant: @merchant_1)
    @item_2_1 = create(:item, merchant: @merchant_1)
    @item_3_1 = create(:item, merchant: @merchant_1)
    
    @item_4_2 = create(:item, merchant: @merchant_2)
    @item_5_2 = create(:item, merchant: @merchant_2)
    @item_6_2 = create(:item, merchant: @merchant_2)
    @item_7_2 = create(:item, merchant: @merchant_2)
    @item_8_2 = create(:item, merchant: @merchant_2)
    
    @item_9_3 = create(:item, merchant: @merchant_3)
    
    @item_10_4 = create(:item, merchant: @merchant_4)
    @item_11_4 = create(:item, merchant: @merchant_4)
    @item_12_4 = create(:item, merchant: @merchant_4)
    @item_13_4 = create(:item, merchant: @merchant_4)
    @item_14_4 = create(:item, merchant: @merchant_4)
    @item_15_4 = create(:item, merchant: @merchant_4)
    
    @item_16_5 = create(:item, merchant: @merchant_5)
    @item_17_5 = create(:item, merchant: @merchant_5)

    @invoice_1 = create(:invoice, merchant_id: @merchant_1.id, status: "shipped")
    @invoice_2 = create(:invoice, merchant_id: @merchant_2.id, status: "shipped")
    @invoice_3 = create(:invoice, merchant_id: @merchant_3.id, status: "shipped")
    @invoice_4 = create(:invoice, merchant_id: @merchant_4.id, status: "shipped")
    @invoice_5 = create(:invoice, merchant_id: @merchant_5.id, status: "shipped")

    @invoice_item_1_1 = create(:invoice_item, invoice_id: @invoice_1.id, item_id: @item_1_1.id, quantity: 1, unit_price: 1.00)
    @invoice_item_2_1 = create(:invoice_item, invoice_id: @invoice_1.id, item_id: @item_2_1.id, quantity: 1, unit_price: 1.00)
    @invoice_item_3_1 = create(:invoice_item, invoice_id: @invoice_1.id, item_id: @item_3_1.id, quantity: 1, unit_price: 1.00)
    
    @invoice_item_4_2 = create(:invoice_item, invoice_id: @invoice_2.id, item_id: @item_4_2.id, quantity: 1, unit_price: 1.00)
    @invoice_item_5_2 = create(:invoice_item, invoice_id: @invoice_2.id, item_id: @item_5_2.id, quantity: 1, unit_price: 1.00)
    @invoice_item_6_2 = create(:invoice_item, invoice_id: @invoice_2.id, item_id: @item_6_2.id, quantity: 1, unit_price: 1.00)
    @invoice_item_7_2 = create(:invoice_item, invoice_id: @invoice_2.id, item_id: @item_7_2.id, quantity: 1, unit_price: 1.00)
    @invoice_item_8_2 = create(:invoice_item, invoice_id: @invoice_2.id, item_id: @item_8_2.id, quantity: 1, unit_price: 1.00)

    @invoice_item_9_3 = create(:invoice_item, invoice_id: @invoice_3.id, item_id: @item_9_3.id, quantity: 1, unit_price: 1.00)
    
    @invoice_item_10_4 = create(:invoice_item, invoice_id: @invoice_4.id, item_id: @item_10_4.id, quantity: 45, unit_price: 1.00)
    @invoice_item_11_4 = create(:invoice_item, invoice_id: @invoice_4.id, item_id: @item_11_4.id, quantity: 1, unit_price: 1.00)
    @invoice_item_12_4 = create(:invoice_item, invoice_id: @invoice_4.id, item_id: @item_12_4.id, quantity: 1, unit_price: 1.00)
    @invoice_item_13_4 = create(:invoice_item, invoice_id: @invoice_4.id, item_id: @item_13_4.id, quantity: 1, unit_price: 1.00)
    @invoice_item_14_4 = create(:invoice_item, invoice_id: @invoice_4.id, item_id: @item_14_4.id, quantity: 1, unit_price: 1.00)
    @invoice_item_15_4 = create(:invoice_item, invoice_id: @invoice_4.id, item_id: @item_15_4.id, quantity: 1, unit_price: 1.00)

    @invoice_item_16_5 = create(:invoice_item, invoice_id: @invoice_5.id, item_id: @item_16_5.id, quantity: 1, unit_price: 1.00)
    @invoice_item_17_5 = create(:invoice_item, invoice_id: @invoice_5.id, item_id: @item_17_5.id, quantity: 1, unit_price: 1.00)

    create(:transaction, invoice: @invoice_1, result: 'success')
    create(:transaction, invoice: @invoice_2, result: 'success')
    create(:transaction, invoice: @invoice_3, result: 'failed')
    create(:transaction, invoice: @invoice_4, result: 'success')
    create(:transaction, invoice: @invoice_5, result: 'success')
  end
end
