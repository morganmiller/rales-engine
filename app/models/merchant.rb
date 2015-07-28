class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(num_merchants)
    Merchant.all.sort_by { |merchant| -merchant.revenue }.take(num_merchants.to_i)
  end

  def self.most_items(num_merchants)
    Merchant.all.sort_by { |merchant| -merchant.items_sold }.take(num_merchants.to_i)
  end

  def revenue(date = nil)
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def favorite_customer
    customers.max_by do |c|
      c.invoices.successful.where(merchant_id: self.id).count
    end
  end

  # At some point make a query like this for the date stuff revenue thingy:
  # Merchant.where(updated_at.to_s.include?("27 Mar 2012"))

private

  def items_sold
    invoices.successful.joins(:invoice_items).sum("quantity")
  end
end
