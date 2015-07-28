class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItem.where(item_id: params[:item_id])
  end
end
