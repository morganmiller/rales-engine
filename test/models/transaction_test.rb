require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "it belongs to an invoice" do
    t = Transaction.first
    i = Invoice.first

    i.transactions << t
    assert_equal i, t.invoice
  end

  test "it has many invoice items" do
    ii = InvoiceItem.first
    i = Invoice.first
    t = Transaction.first

    i.invoice_items << ii
    i.transactions << t
    assert_equal 1, t.invoice_items.count
  end

  test "it scopes for successful transactions" do
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "failed")

    assert Transaction.all.count > 1
    assert_equal 1, Transaction.successful.count
  end
end
