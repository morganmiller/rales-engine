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

  private

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id)
  end
end
