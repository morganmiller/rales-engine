class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def find
    render json: Invoice.find_by(find_params)
  end

  def find_all
    render json: Invoice.where(find_params)
  end

  def random
    respond_with Invoice.limit(1).order("RANDOM()")
  end

  private

  def find_params
    params.permit(:id, :customer_id, :merchant_id, :status)
  end
end
