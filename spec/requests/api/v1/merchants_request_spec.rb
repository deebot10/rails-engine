require 'rails_helper'

RSpec.describe 'Merchants API' do
    
  it 'get all merchants, a maximum of 20 at a time' do
    create_list(:merchant, 50)
    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_name: true)
    expect(merchants['data'].size).to eq(20)
  end
end