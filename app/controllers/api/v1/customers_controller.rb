class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with   Customer.find_by(find_params)
  end

  def find_all
    respond_with   Customer.where(find_params)
  end

  def random
    respond_with Customer.random
  end

  def favorite_merchant
    customer = Customer.find_by(id: params[:id])
    respond_with customer.favorite_merchant
  end
private

  def find_params
    params.permit(:id, :first_name, :last_name)
  end
end
