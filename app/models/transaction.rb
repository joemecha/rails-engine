class Transaction < ApplicationRecord
  validates :invoice_id,
            :credit_card_number,
            :result, presence: true

  belongs_to :invoice
  has_many :customers, through: :invoice
end
