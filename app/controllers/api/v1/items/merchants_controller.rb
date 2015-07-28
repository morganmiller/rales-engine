class Api::V1::Items::MerchantsController < ApplicationController
  def index
    item = Item.find_by(id: params[:item_id])
    render json: item.merchant
  end
end
