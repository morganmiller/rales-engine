require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "it has many invoices" do
    c = Customer.first
    i = Invoice.first

    c.invoices << i
    assert_equal 1, c.invoices.count
  end

  test "it has many transactions" do
    t = Transaction.first
    i = Invoice.first
    c= Customer.first

    i.transactions << t
    c.invoices << i
    assert_equal 1, c.transactions.count
  end
end
