class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    invoice = Invoice.find_by(id: params[:invoice_id])
    render json: invoice.items
  end
end
