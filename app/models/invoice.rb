class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  scope :successful, -> { includes(:transactions).where(transactions: {result: "success"}) }

  # def total_cost
  #   invoice_items.map(&:total_cost).sum
  # end
end
