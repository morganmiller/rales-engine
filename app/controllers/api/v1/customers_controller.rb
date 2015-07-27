class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
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

  def random
    respond_with Customer.limit(1).order("RANDOM()")
  end

private

  def find_params
    params.permit(:id, :first_name, :last_name)
  end
end

# def customer_params
#   params.require(:customer).permit(:first_name, :id, :last_name)
# end
