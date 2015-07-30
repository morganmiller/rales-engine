class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.max_by do |m|
      m.invoices.successful.where(customer_id: self.id).count
    end
  end

  def self.random
    all.limit(1).order("RANDOM()")
  end
end
