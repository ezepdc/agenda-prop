class Contract < ApplicationRecord
  belongs_to :property
  belongs_to :tenant, foreign_key: 'tenant_id', class_name: "Contact"
  belongs_to :guarantor, foreign_key: 'guarantor_id', class_name: "Contact"
  belongs_to :user
  validates :kind, presence: true
  has_many :contract_prices, dependent: :destroy
  has_many_attached :guarantor_documents
  has_many_attached :guarantee_documents
  has_many_attached :security_deposit_receipts
  has_many_attached :security_deposit_return_receipts
  has_many_attached :contract_documents
end
