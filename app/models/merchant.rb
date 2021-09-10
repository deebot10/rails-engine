class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def self.total_rev
    joins(invoices: [:invoice_items, :transactions])
    .where("invoices.status = 'shipped' AND transactions.result = 0")
    .select('merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue')
    .group(:id)
    .order('revenue')
  end
end
