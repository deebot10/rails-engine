require 'rails_helper'

RSpec.describe 'Merchant Revenue' do
  before(:each) do
    @merchant = create(:merchant)  
    @customer = create(:customer)

    @item_1 = create(:item, merchant: @merchant)
    @item_2 = create(:item, merchant: @merchant)

    @invoice_1 = create(:invoice, merchant: @merchant, customer: @customer, status: 'shipped') 
    @invoice_2 = create(:invoice, merchant: @merchant, customer: @customer, status: 'shipped') 
    @invoice_item_1 = create(:invoice_item, invoice: @invoice_1, item: @item_1, unit_price: 5.0, quantity: 5)
    @invoice_item_2 = create(:invoice_item, invoice: @invoice_2, item: @item_2, unit_price: 2.0, quantity: 5)
    @tran_1 = create(:transaction, invoice: @invoice_1, result: 0)
    @tran_2 = create(:transaction, invoice: @invoice_2, result: 1)
  end

  it 'total revenue for a given merchant' do
    get "/api/v1/revenue/merchants/#{@merchant.id}"

    total_rev = Merchant.total_rev.find(@merchant.id)

    revenue = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful
  end
end