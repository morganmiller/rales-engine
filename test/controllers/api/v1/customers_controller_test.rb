require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  def parse_response
    JSON.parse(@response.body)
  end

  test "should get all customers in index" do
    get :index, format: :json
    assert_response :success
    assert parse_response.first.has_key?("first_name")
    assert parse_response.first.has_key?("last_name")
  end

  test "should show instance of customer" do
    customer = Customer.first
    get :show, format: :json, id: customer.id
    assert_response :success
    assert_equal customer.id, parse_response["id"].to_i
  end
end
