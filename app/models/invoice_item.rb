class InvoiceItem < ActiveRecord::Base
  before_save :set_unit_price

  belongs_to :item
  belongs_to :invoice

  def self.random
    all.limit(1).order("RANDOM()")
  end

private

  def set_unit_price
    self.unit_price = self.unit_price/100
  end
end
