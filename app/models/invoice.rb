class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items

  has_many :items, through: :invoice_items
  scope :successful, -> { where(self.transactions.successful) }

  def successful_invoices
    self.transactions.successful
  end
end
