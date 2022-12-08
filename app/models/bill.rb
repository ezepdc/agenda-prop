class Bill < ApplicationRecord
  belongs_to :property
  belongs_to :contact
  has_one :settlement
  belongs_to :user
  validates :bill_date, presence: true
  validates :kind, inclusion: { in: %w(Pago Cobro) }
  validates :amount, presence: true
  validates :concept, presence: true
  validates :payment_method, presence: true
  has_many_attached :documents

  def reference
    "#{property.property_reference} #{kind} #{concept} Monto: #{amount}"
  end
end
