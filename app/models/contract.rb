class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :tenant, foreign_key: 'tenant_id', class_name: "Contact"
  belongs_to :guarantor, foreign_key: 'guarantor_id', class_name: "Contact"
  has_many :contract_prices, dependent: :destroy
  has_many_attached :guarantor_documents, dependent: :destroy
  has_many_attached :guarantee_documents, dependent: :destroy
  has_many_attached :security_deposit_receipts, dependent: :destroy
  has_many_attached :security_deposit_return_receipts, dependent: :destroy
  has_many_attached :contract_documents, dependent: :destroy
  validates :kind, presence: true
end
