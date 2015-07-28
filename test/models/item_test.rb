require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "it belongs to a merchant" do
    m = Merchant.first
    i = Item.first

    m.items << i
    assert_equal m, i.merchant
  end

  test "it has many invoice items" do
    ii = InvoiceItem.first
    i = Item.first

    i.invoice_items << ii
    assert_equal 1, i.invoice_items.count
  end
end
