class Settlement < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :bill
  has_many_attached :documents, dependent: :destroy
  validates :amount, presence: true
  validates :payment_method, presence: true
end
