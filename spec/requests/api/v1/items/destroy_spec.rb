require 'rails_helper'

RSpec.describe 'Items API' do
  before :each do
    merchant = create(:merchant)
    @item = create(:item, merchant: merchant)
  end
  it 'can delete an item' do
    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{@item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(@item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end 