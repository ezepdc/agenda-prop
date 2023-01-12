class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :contact
  has_one :settlement, dependent: :destroy
  has_many_attached :documents, dependent: :destroy
  validates :bill_date, presence: true
  validates :concept, presence: true
  validates :payment_method, presence: true
  validates :kind, presence: true
  monetize :price_cents
  include TranslateEnum
  enum kind: { payout: 0, collection: 1 }
  translate_enum :kind

  def reference
    "#{property.reference} #{translated_kind} #{concept}"
  end
end
