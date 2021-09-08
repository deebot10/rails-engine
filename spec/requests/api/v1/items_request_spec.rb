require 'rails_helper'

RSpec.describe 'Items API' do
  
  describe 'Item Index' do
    it 'get all items, a maximum of 20 at a time' do
      create_list(:item, 50)
      get '/api/v1/items'
      
      expect(response).to be_successful
      
      items = JSON.parse(response.body, symbolize_names: true)
      expect(items[:data].size).to eq(20)
    end
  end
end