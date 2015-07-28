class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def total_cost
    unit_price * quantity
  end
end
