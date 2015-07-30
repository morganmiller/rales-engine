require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "it has many invoices" do
    m = Merchant.first

    assert_equal 1, m.invoices.count
  end

  test "it has many items" do
    m = Merchant.first

    assert_equal 1, m.items.count
  end

  test "it has many transactions" do
    m = Merchant.first

    assert_equal 1, m.transactions.count
  end

  test "it has many customers" do
    m = Merchant.first
    c = Customer.first

    assert_equal c, m.customers.first
  end

  test "it knows merchants with most revenue" do
    result = Merchant.most_revenue(1)

    assert_equal 1, result.count
    assert_equal "I sell hats", result.first.name
  end

  test "it knows who sold most items" do
    result = Merchant.most_items(2)

    assert_equal 2, result.count
    assert_equal "I sell hats", result.first.name
    assert_equal "I sell spoons", result.last.name
  end

  test "it knows items sold" do
    result = Merchant.first.items_sold

    assert_equal 3, result
  end

  test "it can find revenue by date" do
    result = Merchant.revenue("2015-07-27 14:06:40")

    assert_equal 500, result.to_i
  end

  test "it knows its own revenue" do
    result = Merchant.first.revenue

    assert_equal 300, result.to_i
  end

  test "it knows its own revenue by date" do
    result = Merchant.first.revenue("2015-07-27 14:06:40")

    assert_equal 300, result.to_i
  end

  test "it knows its favorite customer" do
    result = Merchant.first.favorite_customer
    result2 = Merchant.find(2).favorite_customer

    assert_equal 1, result.id
    assert_equal 2, result2.id
  end

  test "it knows customers with pending invoices" do
    result = Merchant.find(2).customers_with_pending_invoices

    assert_equal 2, result.first.id
  end
end
