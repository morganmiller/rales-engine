class Item < ActiveRecord::Base
  before_save :set_unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(num_items)
    Item.all.sort_by { |item| -item.revenue }.take(num_items.to_i)
  end

  def self.most_items(num_items)
    Item.joins(:invoices)
        .merge(Invoice.successful)
        .group(:name)
        .sum('"invoice_items"."quantity"')
        .sort_by(&:last)
        .last(num_items.to_i)
        .map { |name, _| Item.find_by(name: name)}
  end

  def self.random
    all.limit(1).order("RANDOM()")
  end

  def best_day
    invoices.successful.group_by { |i| i.created_at }.max_by {|k, v| v.count}.first
  end

  def revenue
    invoices.successful.includes(:invoice_items).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"')
  end

private

  def set_unit_price
    self.unit_price = self.unit_price/100
  end
end
