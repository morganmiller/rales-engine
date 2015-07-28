require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "it has many invoices" do
    m = Merchant.first
    i = Invoice.first

    m.invoices << i
    assert_equal 1, m.invoices.count
  end

  test "it has many items" do
    m = Merchant.first
    i = Item.first

    m.items << i
    assert_equal 1, m.items.count
  end

  test "it has many transactions" do
    m = Merchant.first
    i = Invoice.first
    t = Transaction.first

    i.transactions << t
    m.invoices << i
    assert_equal 1, m.transactions.count
  end
end
