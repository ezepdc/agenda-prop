class Settlement < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :bill
  has_many_attached :documents, dependent: :destroy
  validates :payment_method, presence: true
  monetize :price_cents
  monetize :others_income_amount_cents, as: "others_income_amount", allow_nil: true
  monetize :others_expense_amount_cents, as: "others_expense_amount", allow_nil: true
end
