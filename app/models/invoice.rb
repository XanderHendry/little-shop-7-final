class Invoice < ApplicationRecord
  include CurrencyConverter
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates :status, presence: true

  enum :status, ["in progress", "completed", "cancelled"]

  def self.incomplete_invoices
    Invoice.select("invoices.id, invoices.created_at").where("status=0").group("invoices.id").order("invoices.created_at DESC")
  end

  def total_revenue
    successful_transaction_ids = transactions.where(result: "success").pluck(:id)
    
    total_revenue_cents = invoice_items
      .joins(invoice: :transactions)
      .where(transactions: {id: successful_transaction_ids})
      .sum("quantity * unit_price")
    total_revenue = (total_revenue_cents / 100.0)
  end

  def merchant_revenue(merchant_id)
    InvoiceItem.joins(:item)
                .where("items.merchant_id = #{merchant_id} and invoice_items.invoice_id = #{self.id}")
                .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def merchant_discount_revenue(merchant_id)
    discount = find_merchant_discount(merchant_id)
    if discount.nil?
      total_discounted_revenue = invoice_items.joins(:item)
                .where("items.merchant_id = #{merchant_id} and invoice_items.invoice_id = #{self.id}")
                .sum("invoice_items.quantity * invoice_items.unit_price")
    else
      total_discounted_revenue = invoice_items.joins(item: { merchant: :discounts}).where("discounts.id = #{discount.id}").sum("invoice_items.quantity * (invoice_items.unit_price - invoice_items.unit_price * discounts.percentage / 100.0)")
    end
    total_discounted_revenue
  end

  def find_merchant_discount(merchant_id)
    discount = Discount.joins(merchant: { items: :invoice_items }).where("discounts.merchant_id = #{merchant_id} and invoice_items.invoice_id = #{self.id}").where("discounts.threshold <= invoice_items.quantity").order("discounts.percentage DESC").first
  end

  def find_all_discounts
    merchants = Merchant.joins(items: :invoices).where("invoices.id = #{self.id}").distinct
    invoice_discounts = merchants.map do |merchant|
      merchant.discounts.joins(merchant: {items: :invoice_items}).where("invoice_items.invoice_id = #{self.id} and invoice_items.quantity >= discounts.threshold").order("discounts.percentage DESC").first
    end
    invoice_discounts
  end

  def merchant_items(merchant_id)
    items.where("merchant_id = #{merchant_id}")
  end

  def count_items(item_id)
    invoice_items.where("item_id = #{item_id}").count
  end
end
