require 'rails_helper'

RSpec.describe 'Items API' do
  before :each do
    @merchant = create(:merchant)
    item_params = ({
                    name: 'Icelandic model volcano kit',
                    description: 'some nice thing',
                    unit_price: 75.95,
                    merchant_id: @merchant.id,
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    @created_item = Item.last
  end 
  it "can update an existing item" do
    id = @created_item.id
    previous_name = Item.last.name
    item_params = { name: "Icelandic ice cubes" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Icelandic ice cubes")
  end

  # ADD SAD PATHS with ERROR RESPONSE
end 