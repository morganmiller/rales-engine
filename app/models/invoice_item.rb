class InvoiceItem < ActiveRecord::Base
  before_save :set_unit_price

  belongs_to :item
  belongs_to :invoice

  # def total_cost
  #   unit_price * quantity
  # end

private

  def set_unit_price
    self.unit_price = self.unit_price/100
  end
end
