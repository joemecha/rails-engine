class InvoiceItem < ApplicationRecord
  validates :invoice_id,
            :item_id,
            :quantity,
            :unit_price, presence: true

  belongs_to :invoice
  belongs_to :item
  has_one :merchant, through: :item
  has_many :discounts, through: :merchant
end
