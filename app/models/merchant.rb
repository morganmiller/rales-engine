class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(num_merchants)
    Merchant.all.sort_by { |merchant| -merchant.revenue }.take(num_merchants.to_i)
  end

  def self.revenue(date)
    Merchant.all.map { |merchant| merchant.revenue(date) }.reduce(:+)
  end

  def self.most_items(num_merchants)
    Merchant.all.max_by(num_merchants.to_i) { |merchant| merchant.items_sold }
  end

  def revenue(date = nil)
    if date
      invoices.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price")
    else
      invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
    end
  end

  def favorite_customer
    customers.max_by do |c|
      c.invoices.successful.where(merchant_id: self.id).count
    end
  end

  def customers_with_pending_invoices
    pending_invoices.map { |i| i.customer }
  end

  def items_sold
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

private

  def pending_invoices
    invoices - invoices.successful
  end
end
