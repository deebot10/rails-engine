require 'rails_helper'

RSpec.describe 'Items API' do
  before(:all) do
    @merchant = create(:merchant)
  end
  
  describe 'Item Index' do
    it 'get all items, a maximum of 20 at a time' do
      create_list(:item, 50, merchant: @merchant)
      get '/api/v1/items'
      
      expect(response).to be_successful
      
      items = JSON.parse(response.body, symbolize_names: true)
      expect(items[:data].size).to eq(20)
    end
  end

  describe 'Item Show' do
    it 'can find a single item' do
      create_list(:item, 50)
      item = Item.first
      get "/api/v1/items/#{item.id}"

      merch = JSON.parse(response.body, symbolize_names: true) 

      expect(response).to be_successful
      expect(merch[:data][:id]).to eq("#{item.id}")
    end  
  end
end