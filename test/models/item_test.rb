require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "it belongs to a merchant" do
    i = Item.first

    assert_equal 1, i.merchant.id
  end

  test "it has many invoice items" do
    i = Item.first

    assert_equal 1, i.invoice_items.count
  end

  test "it knows the items with most revenue" do
    result = Item.most_revenue(2)

    assert_equal 1, result.first.id
    assert_equal 3, result.last.id
  end

  test "it knows the items with the most items sold" do
    result = Item.most_items(2)

    assert_equal 3, result.first.id
    assert_equal 1, result.last.id
  end

  test "it knows the items best day" do
    result = Item.first.best_day

    assert_equal "2015-07-27 14:06:40 UTC", result.to_s
  end

  test "it knows the items revenue" do
    result = Item.first.revenue

    assert_equal 300, result
  end

  test "it sets unit price" do
    i = Item.create!(unit_price: 30000)

    assert_equal 300.00, i.unit_price
  end

  test "it finds a random item" do
    result = Item.random.first

    assert_instance_of Item, result
  end
end
