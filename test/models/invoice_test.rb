require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "it belongs to a customer" do
    i = Invoice.first
    c = Customer.first

    c.invoices << i
    assert_equal c, i.customer
  end

  test "it belongs to a merchant" do
    i = Invoice.first
    m = Merchant.first

    m.invoices << i
    assert_equal m, i.merchant
  end

  test "it has many transactions" do
    i = Invoice.first
    t = Transaction.first

    i.transactions << t
    assert_equal 1, i.transactions.count
  end

  test "it has many invoice items" do
    i = Invoice.first
    ii = InvoiceItem.first

    i.invoice_items << ii
    assert_equal 1, i.invoice_items.count
  end

  test "it has many items" do
    invoice = Invoice.first

    assert_equal 1, invoice.items.count
  end

  test "it scopes for associated successful transactions" do
    assert_equal 3, Invoice.all.count
    assert_equal 2, Invoice.successful.count
  end

  test "it finds a random invoice" do
    result = Invoice.random.first

    assert_instance_of Invoice, result
  end
end
