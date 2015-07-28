class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    render json: Merchant.find_by(find_params)
  end

  def find_all
    render json: Merchant.where(find_params)
  end

  def random
    respond_with Merchant.limit(1).order("RANDOM()")
  end

  def most_revenue
    render json: Merchant.most_revenue(params[:quantity])
  end

  def most_items
    render json: Merchant.most_items(params[:quantity])
  end

  def show_revenue
    ##Something needs to go here to account for whether a date is being passed in, what format?
    merchant = Merchant.find_by(id: params[:id])
    render json: merchant.revenue
  end

  def favorite_customer
    merchant = Merchant.find_by(id: params[:id])
    render json: merchant.favorite_customer
  end

  def customers_with_pending_invoices
    merchant = Merchant.find_by(id: params[:id])
    render json: merchant.customers_with_pending_invoices
  end

  private

  def find_params
    params.permit(:id, :name)
  end
end
