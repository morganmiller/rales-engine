require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "it has many invoices" do
    c = Customer.first
    assert_equal 2, c.invoices.count
  end

  test "it has many transactions" do
    c = Customer.first
    assert_equal 2, c.transactions.count
  end

  test "it knows its favorite merchant" do
    result = Customer.first.favorite_merchant

    assert_equal 1, result.id
  end
end
