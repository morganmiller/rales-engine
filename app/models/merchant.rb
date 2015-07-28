class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  # scope :most_revenue, -> { order(revenue: :desc) }
  # ^ this doesn't fucking work
  # what if I group the invoices by merchant somehow?

  ##Ways to do this:
   #make poro to calculate most revenue -- super super slow
   #add column and scope -- bad idea, not scalable
   #add column of total to invoices as before save action and then use includes or joins query?


  ###Look in to how to use select for merchant for selecting and grouping by invoice revenue?
  def revenue
    invoices.successful.flat_map(&:total_cost).sum
  end

  def self.most_revenue
    Merchant.all.sort_by { |merchant| merchant.revenue }
  end
end
