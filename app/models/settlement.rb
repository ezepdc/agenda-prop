class Settlement < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :bill
  has_many_attached :documents, dependent: :destroy
  validates :payment_method, presence: true
  validates :others_income_amount, numericality: true, allow_blank: true
  validates :others_expense_amount, numericality: true, allow_blank: true
  monetize :price_cents
end
