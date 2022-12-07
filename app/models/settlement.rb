class Settlement < ApplicationRecord
  belongs_to :property
  belongs_to :bill
  belongs_to :user
  validates :amount, presence: true
  validates :payment_method, presence: true
end
