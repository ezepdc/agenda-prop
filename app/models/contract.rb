class Contract < ApplicationRecord
  belongs_to :property
  belongs_to :tenant, foreign_key: 'tenant_id', class_name: "Contact"
  belongs_to :guarantor, foreign_key: 'guarantor_id', class_name: "Contact"
  belongs_to :user
  validates :kind, presence: true
  has_many :contract_prices, dependent: :destroy
end
