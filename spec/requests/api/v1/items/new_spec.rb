require 'rails_helper'

RSpec.describe 'Items API' do
  before :each do
    @merchant = create(:merchant)
  end 

  it "Happy path - it can create a new item" do
    item_params = ({
                    name: 'Icelandic model volcano kit',
                    description: 'some nice thing',
                    unit_price: 75.95,
                    merchant_id: @merchant.id,
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    created_item = Item.last

    expect(response).to be_successful
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end

  it "Sad path - fields left blank" do
    item_params = ({
                    name: '',
                    description: '',
                    unit_price: 75.95,
                    merchant_id: @merchant.id,
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    created_item = Item.last

    expect(response).to be_successful
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end

  # Sad path - wrong field included - ignore and create
  # Sad path - wrong data type - error don't create
end 