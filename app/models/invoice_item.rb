class InvoiceItem < ActiveRecord::Base
  before_save :set_unit_price

  belongs_to :item
  belongs_to :invoice
  #add before action for total_price
  #change all prices to decimal on DB?

  def total_cost
    unit_price * quantity
  end

private

  def set_unit_price
    self.unit_price = self.unit_price/100
  end
end
