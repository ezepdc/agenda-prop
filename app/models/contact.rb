class Contact < ApplicationRecord
  belongs_to :user
  has_many :properties, foreign_key: 'owner_id', dependent: :destroy
  has_many :contracts, foreign_key: 'tenant_id', dependent: :destroy
  has_many :contracts, foreign_key: 'guarantor_id', dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :bills, dependent: :destroy
  validates_presence_of :first_name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone, numericality: true, allow_blank: true
  validates :kind, presence: true
  enum kind: { guarantor: 0, tenant: 1, owner: 2, supplier: 3 }
  def full_name
    "#{first_name} #{last_name}"
  end
end
