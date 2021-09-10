require 'rails_helper'

RSpec.describe 'Merchants API' do
  
  describe 'Merchant Index' do
    it 'get all merchants, a maximum of 20 at a time' do
      create_list(:merchant, 50)
      get '/api/v1/merchants'
      
      expect(response).to be_successful
      
      merchants = JSON.parse(response.body, symbolize_names: true)
      expect(merchants[:data].size).to eq(20)
    end
  end

  describe 'Merchant Show' do
    it 'can find a single merchant' do
      create_list(:merchant, 50)
      merchant = Merchant.first
      get "/api/v1/merchants/#{merchant.id}"

      merch = JSON.parse(response.body, symbolize_names: true) 

      expect(response).to be_successful
      expect(merch[:data][:id]).to eq("#{merchant.id}")
    end  
  end
end