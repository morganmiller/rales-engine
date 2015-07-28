class Api::V1::Transactions::InvoicesController < ApplicationController
  def show
    transaction = Transaction.find_by(id: params[:transaction_id])
    render json: transaction.invoice
  end
end
