class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  # revenue for multiple merchants query params 'quantity'
  def self.revenue(search_quantity)
    joins(items: { invoice_items: { invoice: :transactions } })
      .where("invoices.status='shipped' AND transactions.result='success'")
      .group(:id)
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .order('revenue DESC')
      .limit(search_quantity)
  end

  # revenue for one merchant (show action)
  def one_revenue
    Merchant
      .joins(:transactions)
      .where("invoices.status='shipped' AND transactions.result='success'")
      .where('merchants.id = ?', id)
      .group('merchants.id')
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
  end
end
