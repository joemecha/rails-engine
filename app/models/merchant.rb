class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  # revenue for multiple merchants query params 'quantity'
  def self.revenue(search_quantity)
    joins(items: {invoice_items: {invoice: :transactions}})
    .where("invoices.status='shipped' AND transactions.result='success'")
    .group(:id)
    .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .order('revenue DESC')
    .limit(search_quantity)
  end

  # revenue for one merchant (show action) NOT WORKING
  # def revenue
    # self.find_by_sql "SELECT merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue
    # FROM merchants
    # JOIN  items ON merchants.id = items.id
    # JOIN invoice_items ON items.id = invoice_items.item_id
    # JOIN invoices ON invoice_items.invoice_id = invoices.id
    # JOIN transactions ON invoices.id = transactions.invoice_id 
    # WHERE invoices.status='shipped' AND transactions.result='success' AND merchants.id = '9'
    # GROUP BY merchants.id;"

    # items
    # .joins(invoice_items: {invoice: :transactions})
    # .where("invoices.status='shipped' AND transactions.result='success'")
    # .group(:id)
    # .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
  # end
end
