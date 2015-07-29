class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find
    render json: Item.find_by(find_params)
  end

  def find_all
    render json: Item.where(find_params)
  end

  def random
    respond_with Item.limit(1).order("RANDOM()")
  end

  def most_revenue
    render json: Item.most_revenue(params[:quantity])
  end

  def most_items
    render json: Item.most_items(params[:quantity])
  end

  def best_day
    item = Item.find_by(id: params[:id])
    render json: item.best_day
  end

  private

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id)
  end
end
