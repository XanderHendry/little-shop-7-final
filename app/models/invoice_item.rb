class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :status, presence: true

  enum :status, ["pending", "packaged", "shipped"]

  def unit_price_show
    unit_price_formatted = (unit_price.to_f / 100)
  end

  def find_discount
   discount = Discount.where("merchant_id = #{self.item.merchant.id} and threshold <= #{self.quantity}")
                    .order("percentage DESC")
                    .first
  end

  def revenue
    require 'pry'; binding.pry
    self.sum("quantity * unit_price")
  end
end
