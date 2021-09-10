class Api::V1::Revenue::MerchantsController < ApplicationController

  def show
    merchant = Merchant.total_rev.find(params[:id])
    render json: MerchantRevenueSerializer.new(merchant)
  end
end