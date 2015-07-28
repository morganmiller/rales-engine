require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "it belongs to an item" do
    i = Item.first
    ii = InvoiceItem.first

    i.invoice_items << ii
    assert_equal i, ii.item
  end

  test "it belongs to an invoice" do
    i = Invoice.first
    ii = InvoiceItem.first

    i.invoice_items << ii
    assert_equal i, ii.invoice
  end

  test "it knows its total cost" do
    i = InvoiceItem.create(unit_price: 30000, quantity: 2)

    assert_equal 600.00, i.total_cost.to_i
  end
end
