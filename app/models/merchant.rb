class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  scope :most_revenue, -> { order(revenue: :desc) }

  def revenue
    invoices.successful.flat_map(&:total_cost).sum
  end
end
