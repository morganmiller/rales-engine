class Api::V1::InvoiceItems::ItemsController < ApplicationController
  def index
    invoice_item = InvoiceItem.find_by(id: params[:invoice_item_id])
    render json: invoice_item.item
  end
end
