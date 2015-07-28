class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  def revenue(date = nil)
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.most_revenue(num_merchants)
    Merchant.all.sort_by { |merchant| merchant.revenue }.take(num_merchants.to_i)
  end
end
