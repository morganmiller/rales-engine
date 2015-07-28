class Item < ActiveRecord::Base
  before_save :set_unit_price

  belongs_to :merchant
  has_many :invoice_items

private

  def set_unit_price
    self.unit_price = self.unit_price/100
  end
end
