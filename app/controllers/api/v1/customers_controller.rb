class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    if params[:customers]
      respond_with params[:customers]
    else
      respond_with Customer.all
    end
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    render json: Customer.find_by(find_params)
  end

  def find_all
    render json: Customer.where(find_params)
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :id, :last_name)
  end

  def find_params
    params.permit(:id, :first_name, :last_name)
  end
end
