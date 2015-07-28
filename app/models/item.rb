class Item < ActiveRecord::Base
  before_save :set_unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(num_items)
    Item.all.sort_by { |item| -item.revenue }.take(num_items.to_i)
  end

  def revenue
    invoices.successful.includes(:invoice_items).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"')
  end

private

  def set_unit_price
    self.unit_price = self.unit_price/100
  end
end
