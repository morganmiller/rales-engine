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

  test "it finds a random invoice item" do
    result = InvoiceItem.random.first

    assert_instance_of InvoiceItem, result
  end
end
