class Api::V1::Invoices::MerchantsController < ApplicationController
  def show
    invoice = Invoice.find_by(id: params[:invoice_id])
    render json: invoice.merchant
  end
end
