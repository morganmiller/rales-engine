class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by(find_params)
  end

  def find_all
    respond_with Merchant.where(find_params)
  end

  def random
    respond_with Merchant.random
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def revenue
    respond_with Merchant.revenue(params[:date])
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity])
  end

  def show_revenue
    merchant = Merchant.find_by(id: params[:id])
    respond_with merchant.revenue(params[:date])
  end

  def favorite_customer
    merchant = Merchant.find_by(id: params[:id])
    respond_with merchant.favorite_customer
  end

  def customers_with_pending_invoices
    merchant = Merchant.find_by(id: params[:id])
    respond_with merchant.customers_with_pending_invoices
  end

  private

  def find_params
    params.permit(:id, :name)
  end
end
