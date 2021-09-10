class Api::V1::ItemsController < ApplicationController

  def index
    if params[:page].nil?
      page = params.fetch(:page, 1).to_i
    elsif params[:page].to_i <= 0
      page = 1
    else
      page = params[:page].to_i
    end
    
    if params[:per_page].nil?
      limit = 20 
    else 
      limit = params[:per_page].to_i
    end
    
    items = Item.offset((page - 1) * limit).limit(limit)
    render json: ItemSerializer.new(items)  
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def create
    # require 'pry'; binding.pry
    merchant = Merchant.find(params[:item][:merchant_id])
    render json: merchant.items.create(item_params), status: 201
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end