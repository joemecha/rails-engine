class Item < ApplicationRecord
  validates :name,
            :description,
            :unit_price,
            :merchant_id, presence: true
  validates :unit_price, numericality: true

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.revenue(search_quantity = 10)
    joins(invoice_items: {invoice: :transactions})
    .where("invoices.status='shipped' AND transactions.result='success'")
    .group(:id)
    .select('items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .order('revenue desc')
    .limit(search_quantity)
  end
end
