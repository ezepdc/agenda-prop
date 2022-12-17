class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :contact
  has_one :settlement, dependent: :destroy
  has_many_attached :documents, dependent: :destroy
  validates :bill_date, presence: true
  validates :amount, presence: true
  validates :concept, presence: true
  validates :payment_method, presence: true
  validates :amount, numericality: true, allow_blank: true
  enum kind: { payout: 0, collection: 1 }

  def reference
    "#{property.reference} #{kind} #{concept} Monto: #{amount}"
  end
end
