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

  describe 'Item Create' do
    it 'can create a new Item' do
      item_params = {
                      name: 'Plumbus',
                      description: 'A Plumbus is an all-purpose home device.
                                    Everyone knows what it does, so there is  
                                    no reason to explain it.',
                      unit_price:  700.00,
                      merchant_id: @merchant.id                  
      }   
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)
      created_item = Hash.new
      created_item[:data] = JSON.parse(response.body, symbolize_names: true)
     
      expect(response).to be_successful
      expect(created_item[:data][:name]).to eq(item_params[:name])
      expect(created_item[:data][:description]).to eq(item_params[:description])
      expect(created_item[:data][:unit_price]).to eq(item_params[:unit_price])
      expect(created_item[:data][:merchant_id]).to eq(item_params[:merchant_id])
    end
  end

  describe 'Item edit' do
    it 'can edit an item' do
    end
  end

  describe 'Item Delete' do
    it 'can delete a Item' do
      item = create(:item, merchant: @merchant)

      expect{ delete}
    end
  end
end